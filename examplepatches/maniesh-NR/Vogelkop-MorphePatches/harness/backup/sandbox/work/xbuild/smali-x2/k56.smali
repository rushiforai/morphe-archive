.class public Lk56;
.super Lxkj;
.source "SourceFile"


# instance fields
.field public h:Landroid/view/animation/BaseInterpolator;

.field public final i:Ljava/util/ArrayList;

.field public final j:Ljava/util/ArrayList;

.field public final k:Ljava/util/ArrayList;

.field public final l:Ljava/util/ArrayList;

.field public final m:Ljava/util/ArrayList;

.field public final n:Ljava/util/ArrayList;

.field public final o:Ljava/util/ArrayList;

.field public final p:Ljava/util/ArrayList;

.field public final q:Ljava/util/ArrayList;

.field public final r:Ljava/util/ArrayList;

.field public final s:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lxkj;-><init>()V

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    iput-object v0, p0, Lk56;->h:Landroid/view/animation/BaseInterpolator;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->i:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->j:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->k:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->l:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->m:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->n:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->o:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->p:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->q:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->r:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk56;->s:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public A(J)J
    .registers 3

    return-wide p1
.end method

.method public final B(Landroidx/recyclerview/widget/i;)V
    .registers 4

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lk56;->h:Landroid/view/animation/BaseInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {p0, p1}, Lk56;->e(Landroidx/recyclerview/widget/i;)V

    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/i;Ljava/util/List;)Z
    .registers 3

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_12

    iget-boolean p0, p0, Lxkj;->g:Z

    if-eqz p0, :cond_12

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->isInvalid()Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method

.method public final e(Landroidx/recyclerview/widget/i;)V
    .registers 10

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->hasTransientState()Z

    move-result v1

    if-nez v1, :cond_f

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_f
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget-object v1, p0, Lk56;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_1e
    const/4 v3, 0x0

    if-ltz v2, :cond_3a

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lj56;

    iget-object v4, v4, Lj56;->a:Landroidx/recyclerview/widget/i;

    if-ne v4, p1, :cond_37

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, p1}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_37
    add-int/lit8 v2, v2, -0x1

    goto :goto_1e

    :cond_3a
    iget-object v1, p0, Lk56;->l:Ljava/util/ArrayList;

    invoke-virtual {p0, v1, p1}, Lk56;->x(Ljava/util/ArrayList;Landroidx/recyclerview/widget/i;)V

    iget-object v1, p0, Lk56;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_4f

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    :cond_4f
    iget-object v1, p0, Lk56;->j:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5d

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    :cond_5d
    iget-object v1, p0, Lk56;->o:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    :goto_65
    if-ltz v4, :cond_7c

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {p0, v5, p1}, Lk56;->x(Ljava/util/ArrayList;Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_79

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_79
    add-int/lit8 v4, v4, -0x1

    goto :goto_65

    :cond_7c
    iget-object v1, p0, Lk56;->n:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    :goto_84
    if-ltz v4, :cond_ba

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    :goto_92
    if-ltz v6, :cond_b7

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lj56;

    iget-object v7, v7, Lj56;->a:Landroidx/recyclerview/widget/i;

    if-ne v7, p1, :cond_b4

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, p1}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_b7

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_b7

    :cond_b4
    add-int/lit8 v6, v6, -0x1

    goto :goto_92

    :cond_b7
    :goto_b7
    add-int/lit8 v4, v4, -0x1

    goto :goto_84

    :cond_ba
    iget-object v1, p0, Lk56;->m:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    :goto_c2
    if-ltz v3, :cond_e2

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_df

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_df

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_df
    add-int/lit8 v3, v3, -0x1

    goto :goto_c2

    :cond_e2
    iget-object v0, p0, Lk56;->r:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lk56;->p:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lk56;->s:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lk56;->q:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lk56;->w()Z

    return-void
.end method

.method public f()V
    .registers 9

    iget-object v0, p0, Lk56;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_8
    const/4 v2, 0x0

    if-ltz v1, :cond_26

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lj56;

    iget-object v4, v3, Lj56;->a:Landroidx/recyclerview/widget/i;

    iget-object v4, v4, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4, v2}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v4, v2}, Landroid/view/View;->setTranslationX(F)V

    iget-object v2, v3, Lj56;->a:Landroidx/recyclerview/widget/i;

    invoke-virtual {p0, v2}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_26
    iget-object v0, p0, Lk56;->i:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_2e
    if-ltz v1, :cond_3f

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/i;

    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x1

    goto :goto_2e

    :cond_3f
    iget-object v0, p0, Lk56;->j:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_47
    const/high16 v3, 0x3f800000    # 1.0f

    if-ltz v1, :cond_5f

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/i;

    iget-object v5, v4, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5, v3}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x1

    goto :goto_47

    :cond_5f
    iget-object v0, p0, Lk56;->l:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_67
    if-ltz v1, :cond_80

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Li56;

    iget-object v5, v4, Li56;->a:Landroidx/recyclerview/widget/i;

    if-eqz v5, :cond_76

    invoke-virtual {p0, v4, v5}, Lk56;->y(Li56;Landroidx/recyclerview/widget/i;)Z

    :cond_76
    iget-object v5, v4, Li56;->b:Landroidx/recyclerview/widget/i;

    if-eqz v5, :cond_7d

    invoke-virtual {p0, v4, v5}, Lk56;->y(Li56;Landroidx/recyclerview/widget/i;)Z

    :cond_7d
    add-int/lit8 v1, v1, -0x1

    goto :goto_67

    :cond_80
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p0}, Lk56;->h()Z

    move-result v0

    if-nez v0, :cond_8a

    return-void

    :cond_8a
    iget-object v0, p0, Lk56;->n:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_92
    if-ltz v1, :cond_c9

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    :goto_a0
    if-ltz v5, :cond_c6

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lj56;

    iget-object v7, v6, Lj56;->a:Landroidx/recyclerview/widget/i;

    iget-object v7, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v7, v2}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v7, v2}, Landroid/view/View;->setTranslationX(F)V

    iget-object v6, v6, Lj56;->a:Landroidx/recyclerview/widget/i;

    invoke-virtual {p0, v6}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_c3

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_c3
    add-int/lit8 v5, v5, -0x1

    goto :goto_a0

    :cond_c6
    add-int/lit8 v1, v1, -0x1

    goto :goto_92

    :cond_c9
    iget-object v0, p0, Lk56;->m:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_d1
    if-ltz v1, :cond_101

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    :goto_df
    if-ltz v4, :cond_fe

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/recyclerview/widget/i;

    iget-object v6, v5, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6, v3}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0, v5}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_fb

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_fb
    add-int/lit8 v4, v4, -0x1

    goto :goto_df

    :cond_fe
    add-int/lit8 v1, v1, -0x1

    goto :goto_d1

    :cond_101
    iget-object v0, p0, Lk56;->o:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_109
    if-ltz v1, :cond_13c

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    :goto_117
    if-ltz v3, :cond_139

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Li56;

    iget-object v5, v4, Li56;->a:Landroidx/recyclerview/widget/i;

    if-eqz v5, :cond_126

    invoke-virtual {p0, v4, v5}, Lk56;->y(Li56;Landroidx/recyclerview/widget/i;)Z

    :cond_126
    iget-object v5, v4, Li56;->b:Landroidx/recyclerview/widget/i;

    if-eqz v5, :cond_12d

    invoke-virtual {p0, v4, v5}, Lk56;->y(Li56;Landroidx/recyclerview/widget/i;)Z

    :cond_12d
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_136

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_136
    add-int/lit8 v3, v3, -0x1

    goto :goto_117

    :cond_139
    add-int/lit8 v1, v1, -0x1

    goto :goto_109

    :cond_13c
    iget-object v0, p0, Lk56;->r:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lk56;->v(Ljava/util/ArrayList;)V

    iget-object v0, p0, Lk56;->q:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lk56;->v(Ljava/util/ArrayList;)V

    iget-object v0, p0, Lk56;->p:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lk56;->v(Ljava/util/ArrayList;)V

    iget-object v0, p0, Lk56;->s:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lk56;->v(Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/e;->d()V

    return-void
.end method

.method public final h()Z
    .registers 2

    iget-object v0, p0, Lk56;->j:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->l:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->i:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->q:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->r:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->p:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->s:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->n:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lk56;->m:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object p0, p0, Lk56;->o:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_5a

    const/4 p0, 0x0

    return p0

    :cond_5a
    const/4 p0, 0x1

    return p0
.end method

.method public final j()V
    .registers 14

    iget-object v1, p0, Lk56;->i:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    iget-object v3, p0, Lk56;->k:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    iget-object v5, p0, Lk56;->l:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    iget-object v7, p0, Lk56;->j:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v2, :cond_20

    if-eqz v4, :cond_20

    if-eqz v8, :cond_20

    if-nez v6, :cond_de

    :cond_20
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x0

    move v11, v10

    :goto_26
    if-ge v11, v9, :cond_34

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Landroidx/recyclerview/widget/i;

    invoke-virtual {p0, v12}, Lk56;->u(Landroidx/recyclerview/widget/i;)V

    goto :goto_26

    :cond_34
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    if-nez v4, :cond_67

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v9, p0, Lk56;->n:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    new-instance v3, Le56;

    invoke-direct {v3, p0, v1, v10}, Le56;-><init>(Lk56;Ljava/util/ArrayList;B)V

    if-nez v2, :cond_64

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj56;

    iget-object v1, v1, Lj56;->a:Landroidx/recyclerview/widget/i;

    iget-object v1, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-wide v11, p0, Landroidx/recyclerview/widget/e;->d:J

    invoke-virtual {p0, v11, v12}, Lk56;->A(J)J

    move-result-wide v11

    invoke-virtual {v1, v3, v11, v12}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    goto :goto_67

    :cond_64
    invoke-virtual {v3}, Le56;->run()V

    :cond_67
    :goto_67
    if-nez v6, :cond_94

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v3, p0, Lk56;->o:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    new-instance v3, Lvr9;

    const/4 v5, 0x7

    invoke-direct {v3, v5, p0, v1, v10}, Lvr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    if-nez v2, :cond_91

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Li56;

    iget-object v1, v1, Li56;->a:Landroidx/recyclerview/widget/i;

    iget-object v1, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-wide v11, p0, Landroidx/recyclerview/widget/e;->d:J

    invoke-virtual {v1, v3, v11, v12}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    goto :goto_94

    :cond_91
    invoke-virtual {v3}, Lvr9;->run()V

    :cond_94
    :goto_94
    if-nez v8, :cond_de

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v3, p0, Lk56;->m:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    new-instance v7, Le56;

    const/4 v3, 0x1

    invoke-direct {v7, p0, v1, v3}, Le56;-><init>(Lk56;Ljava/util/ArrayList;B)V

    if-eqz v2, :cond_b6

    if-eqz v4, :cond_b6

    if-eqz v6, :cond_b6

    invoke-virtual {v7}, Le56;->run()V

    return-void

    :cond_b6
    const-wide/16 v8, 0x0

    if-nez v2, :cond_bd

    iget-wide v2, p0, Landroidx/recyclerview/widget/e;->d:J

    goto :goto_be

    :cond_bd
    move-wide v2, v8

    :goto_be
    if-nez v4, :cond_c5

    invoke-virtual {p0}, Landroidx/recyclerview/widget/e;->g()J

    move-result-wide v4

    goto :goto_c6

    :cond_c5
    move-wide v4, v8

    :goto_c6
    if-nez v6, :cond_cb

    iget-short v6, p0, Landroidx/recyclerview/widget/e;->f:S

    int-to-long v8, v6

    :cond_cb
    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/i;

    iget-object v10, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    move-object v0, p0

    move-wide v1, v2

    move-wide v3, v4

    move-wide v5, v8

    invoke-virtual/range {v0 .. v6}, Lk56;->z(JJJ)J

    move-result-wide v0

    invoke-virtual {v10, v7, v0, v1}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_de
    return-void
.end method

.method public k(Landroidx/recyclerview/widget/i;)Z
    .registers 4

    invoke-virtual {p0, p1}, Lk56;->B(Landroidx/recyclerview/widget/i;)V

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    iget-object p0, p0, Lk56;->j:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public l(Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;IIII)Z
    .registers 13

    move-object v0, p0

    move-object v1, p1

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    if-ne p1, p2, :cond_d

    invoke-virtual/range {v0 .. v5}, Lk56;->m(Landroidx/recyclerview/widget/i;IIII)Z

    move-result p0

    return p0

    :cond_d
    iget-object p0, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result p0

    iget-object p1, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    iget-object p3, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getAlpha()F

    move-result p3

    invoke-virtual {v0, v1}, Lk56;->B(Landroidx/recyclerview/widget/i;)V

    sub-int p5, v4, v2

    int-to-float p4, p5

    sub-float/2addr p4, p0

    float-to-int p4, p4

    sub-int p6, v5, v3

    int-to-float p5, p6

    sub-float/2addr p5, p1

    float-to-int p5, p5

    iget-object p6, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p6, p0}, Landroid/view/View;->setTranslationX(F)V

    iget-object p0, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    iget-object p0, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p3}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0, p2}, Lk56;->B(Landroidx/recyclerview/widget/i;)V

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    neg-int p1, p4

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    neg-int p1, p5

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    new-instance p0, Li56;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Li56;->a:Landroidx/recyclerview/widget/i;

    iput-object p2, p0, Li56;->b:Landroidx/recyclerview/widget/i;

    iput v2, p0, Li56;->c:I

    iput v3, p0, Li56;->d:I

    iput v4, p0, Li56;->e:I

    iput v5, p0, Li56;->f:I

    iget-object p1, v0, Lk56;->l:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public m(Landroidx/recyclerview/widget/i;IIII)Z
    .registers 9

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v1

    float-to-int v1, v1

    add-int/2addr p2, v1

    iget-object v1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    float-to-int v1, v1

    add-int/2addr p3, v1

    invoke-virtual {p0, p1}, Lk56;->B(Landroidx/recyclerview/widget/i;)V

    sub-int v1, p4, p2

    sub-int v2, p5, p3

    if-nez v1, :cond_20

    if-nez v2, :cond_25

    invoke-virtual {p0, p1}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x0

    return p0

    :cond_20
    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    :cond_25
    if-eqz v2, :cond_2c

    neg-int v1, v2

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    :cond_2c
    new-instance v0, Lj56;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Lj56;->a:Landroidx/recyclerview/widget/i;

    iput p2, v0, Lj56;->b:I

    iput p3, v0, Lj56;->c:I

    iput p4, v0, Lj56;->d:I

    iput p5, v0, Lj56;->e:I

    iget-object p0, p0, Lk56;->k:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    invoke-virtual {p0, p1}, Lk56;->B(Landroidx/recyclerview/widget/i;)V

    iget-object p0, p0, Lk56;->i:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public s(Landroidx/recyclerview/widget/i;)V
    .registers 9

    iget-object v3, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    iget-object v0, p0, Lk56;->p:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {v4, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v1, p0, Landroidx/recyclerview/widget/e;->c:J

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    new-instance v0, Lf56;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lf56;-><init>(Lk56;Landroidx/recyclerview/widget/i;Landroid/view/View;Landroid/view/ViewPropertyAnimator;B)V

    invoke-virtual {v6, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public t(Landroidx/recyclerview/widget/i;IIII)V
    .registers 14

    iget-object v4, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sub-int v3, p4, p2

    sub-int v5, p5, p3

    const/4 p2, 0x0

    if-eqz v3, :cond_10

    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p3

    invoke-virtual {p3, p2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    :cond_10
    if-eqz v5, :cond_19

    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p3

    invoke-virtual {p3, p2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    :cond_19
    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    iget-object p2, p0, Lk56;->q:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Landroidx/recyclerview/widget/e;->g()J

    move-result-wide p2

    invoke-virtual {v6, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    new-instance v0, Lg56;

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lg56;-><init>(Lxkj;Landroidx/recyclerview/widget/i;ILandroid/view/View;ILandroid/view/ViewPropertyAnimator;B)V

    invoke-virtual {p2, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public u(Landroidx/recyclerview/widget/i;)V
    .registers 6

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget-object v2, p0, Lk56;->r:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-wide v2, p0, Landroidx/recyclerview/widget/e;->d:J

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Lf56;

    invoke-direct {v3, p0, p1, v1, v0}, Lf56;-><init>(Lk56;Landroidx/recyclerview/widget/i;Landroid/view/ViewPropertyAnimator;Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public final v(Ljava/util/ArrayList;)V
    .registers 3

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    :goto_6
    if-ltz p0, :cond_1a

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/i;

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    add-int/lit8 p0, p0, -0x1

    goto :goto_6

    :cond_1a
    return-void
.end method

.method public final w()Z
    .registers 2

    invoke-virtual {p0}, Lk56;->h()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-virtual {p0}, Landroidx/recyclerview/widget/e;->d()V

    const/4 p0, 0x1

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public final x(Ljava/util/ArrayList;Landroidx/recyclerview/widget/i;)V
    .registers 6

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_22

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Li56;

    invoke-virtual {p0, v1, p2}, Lk56;->y(Li56;Landroidx/recyclerview/widget/i;)Z

    move-result v2

    if-eqz v2, :cond_1f

    iget-object v2, v1, Li56;->a:Landroidx/recyclerview/widget/i;

    if-nez v2, :cond_1f

    iget-object v2, v1, Li56;->b:Landroidx/recyclerview/widget/i;

    if-nez v2, :cond_1f

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_1f
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_22
    return-void
.end method

.method public final y(Li56;Landroidx/recyclerview/widget/i;)Z
    .registers 5

    iget-object v0, p1, Li56;->b:Landroidx/recyclerview/widget/i;

    const/4 v1, 0x0

    if-ne v0, p2, :cond_8

    iput-object v1, p1, Li56;->b:Landroidx/recyclerview/widget/i;

    goto :goto_e

    :cond_8
    iget-object v0, p1, Li56;->a:Landroidx/recyclerview/widget/i;

    if-ne v0, p2, :cond_25

    iput-object v1, p1, Li56;->a:Landroidx/recyclerview/widget/i;

    :goto_e
    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x1

    return p0

    :cond_25
    const/4 p0, 0x0

    return p0
.end method

.method public z(JJJ)J
    .registers 7

    invoke-static {p3, p4, p5, p6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p3

    add-long/2addr p3, p1

    return-wide p3
.end method
