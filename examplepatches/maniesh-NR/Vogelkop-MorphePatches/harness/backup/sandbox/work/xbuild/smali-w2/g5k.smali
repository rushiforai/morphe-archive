.class public final Lg5k;
.super Lk8;
.source "SourceFile"


# instance fields
.field public final o:Lk5k;

.field public final p:Lxnh;

.field public final q:Ls9i;


# direct methods
.method public constructor <init>(Lk5k;Lxnh;Lx5f;Ls9i;Z)V
    .registers 6

    if-eqz p5, :cond_8

    new-instance p5, Lf5k;

    invoke-direct {p5, p1}, Lf5k;-><init>(Lk5k;)V

    goto :goto_9

    :cond_8
    const/4 p5, 0x0

    :goto_9
    invoke-direct {p0, p3, p5}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lg5k;->o:Lk5k;

    iput-object p2, p0, Lg5k;->p:Lxnh;

    iput-object p4, p0, Lg5k;->q:Ls9i;

    return-void
.end method


# virtual methods
.method public final Y(Lmq;)Z
    .registers 2

    iget-object p0, p0, Lg5k;->q:Ls9i;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method

.method public final d0(Lmq;)V
    .registers 6

    invoke-virtual {p0, p1}, Lg5k;->s0(Lmq;)Z

    move-result v0

    if-nez v0, :cond_a3

    sget-object v0, Llq;->a:Llq;

    filled-new-array {v0}, [Llq;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmq;->i([Llq;)Z

    move-result v0

    if-eqz v0, :cond_a3

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lmq;->g(ZZ)Z

    move-result v2

    iget-object v3, p0, Lg5k;->o:Lk5k;

    if-eqz v2, :cond_26

    invoke-virtual {v3, p1}, Lk5k;->f(Lmq;)V

    invoke-virtual {p1}, Lmq;->j()Z

    move-result v1

    if-nez v1, :cond_a3

    move v1, v0

    :cond_26
    iget-object p0, p0, Lg5k;->p:Lxnh;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/16 v2, 0x10

    invoke-virtual {p0, v2}, Lwnh;->a(I)Z

    move-result p0

    if-nez p0, :cond_44

    if-eqz v1, :cond_a3

    iget-boolean p0, v3, Lk5k;->h:Z

    if-nez p0, :cond_44

    iget-object p0, p1, Lmq;->g:Lkm;

    iget-object p1, p1, Lmq;->c:Ldl;

    invoke-interface {p0, p1}, Lkm;->t(Ldl;)V

    return-void

    :cond_44
    iget-object p0, v3, Lk5k;->c:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj5k;

    iget-object v2, v1, Lj5k;->b:Ljava/util/ArrayDeque;

    iget-object v3, v1, Lj5k;->a:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4e

    invoke-virtual {v2, p1}, Ljava/util/ArrayDeque;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a3

    invoke-virtual {v2, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    iget-object p0, p1, Lmq;->f:Ljava/util/List;

    iget-object p1, v1, Lj5k;->e:Lk5k;

    iget-object p1, p1, Lk5k;->b:Lh5k;

    new-instance v2, Li5k;

    invoke-direct {v2, v1, p0}, Li5k;-><init>(Lj5k;Ljava/util/List;)V

    iget-object p0, p1, Lh5k;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    iget-boolean v1, p1, Lh5k;->a:Z

    iget-object v3, v2, Li5k;->a:Ljava/lang/String;

    if-nez v1, :cond_90

    iget-object v1, p1, Lh5k;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_90

    invoke-virtual {p1, v2}, Lh5k;->i(Li5k;)V

    return-void

    :cond_90
    invoke-virtual {p0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    if-nez p1, :cond_a0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a3
    return-void
.end method

.method public final f0(Lmq;)V
    .registers 4

    iget-object v0, p0, Lg5k;->p:Lxnh;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwnh;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lwnh;->a(I)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object p0, p0, Lg5k;->o:Lk5k;

    iget-object p0, p0, Lk5k;->c:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj5k;

    iget-object v0, v0, Lj5k;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_2e
    return-void
.end method

.method public final g0(Lmq;)V
    .registers 2

    invoke-super {p0, p1}, Lk8;->g0(Lmq;)V

    iget-object p0, p0, Lg5k;->q:Ls9i;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final p0(Lmq;)V
    .registers 4

    invoke-virtual {p0, p1}, Lg5k;->s0(Lmq;)Z

    move-result v0

    if-nez v0, :cond_33

    sget-object v0, Llq;->a:Llq;

    filled-new-array {v0}, [Llq;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmq;->i([Llq;)Z

    move-result v0

    iget-object v1, p0, Lg5k;->o:Lk5k;

    if-eqz v0, :cond_28

    iget-object p0, p0, Lg5k;->p:Lxnh;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lwnh;->a(I)Z

    move-result p0

    if-nez p0, :cond_28

    iget-boolean p0, v1, Lk5k;->h:Z

    if-eqz p0, :cond_33

    :cond_28
    const/4 p0, 0x0

    const/4 v0, 0x1

    invoke-virtual {p1, v0, p0}, Lmq;->g(ZZ)Z

    move-result p0

    if-eqz p0, :cond_33

    invoke-virtual {v1, p1}, Lk5k;->f(Lmq;)V

    :cond_33
    return-void
.end method

.method public final s0(Lmq;)Z
    .registers 5

    iget-object p0, p0, Lg5k;->q:Ls9i;

    iget-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v0, Lil;

    if-nez v0, :cond_18

    iget-object v0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lvzk;

    iget-object v0, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lcy;

    invoke-virtual {v0}, Lcy;->c()Lml;

    move-result-object v0

    iget-object v0, v0, Lml;->h:Lil;

    iput-object v0, p0, Ls9i;->e:Ljava/lang/Object;

    :cond_18
    if-eqz v0, :cond_57

    iget-object v0, v0, Lil;->f:Lo1;

    if-eqz v0, :cond_57

    iget-object v0, v0, Lo1;->b:Ljava/lang/String;

    iget-object v1, p1, Lmq;->c:Ldl;

    iget-object v1, v1, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_57

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Li16;

    iget-object v1, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast v1, Lil;

    iget-object v1, v1, Lil;->f:Lo1;

    iget v2, v1, Lo1;->c:I

    iget v1, v1, Lo1;->d:I

    invoke-virtual {v0, v2, v1}, Li16;->A(II)Z

    move-result v0

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    if-eqz v0, :cond_46

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_57

    :cond_46
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    instance-of p0, p1, Lno;

    const/4 v0, 0x1

    if-eqz p0, :cond_56

    check-cast p1, Lno;

    iget-boolean p0, p1, Lmq;->n:Z

    if-eqz p0, :cond_56

    iput-boolean v0, p1, Lno;->q:Z

    :cond_56
    return v0

    :cond_57
    :goto_57
    const/4 p0, 0x0

    return p0
.end method
