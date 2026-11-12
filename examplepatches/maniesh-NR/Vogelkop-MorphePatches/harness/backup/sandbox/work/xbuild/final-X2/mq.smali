.class public abstract Lmq;
.super Ln43;
.source "SourceFile"


# instance fields
.field public final c:Ldl;

.field public final d:Lyz;

.field public e:I

.field public final f:Ljava/util/List;

.field public final g:Lkm;

.field public final h:Lep;

.field public volatile i:Llq;

.field public j:Llq;

.field public final k:Lk8;

.field public final l:Lkq;

.field public m:J

.field public n:Z

.field public o:Z


# direct methods
.method public constructor <init>(Lyz;Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)V
    .registers 9

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    sget-object v1, Llq;->a:Llq;

    iput-object v1, p0, Lmq;->i:Llq;

    iput-object p1, p0, Lmq;->d:Lyz;

    if-eqz p1, :cond_12

    invoke-virtual {p0, p2}, Lmq;->h(Ldl;)Ltz;

    move-result-object v1

    iput-object v1, p1, Lyz;->q:Ltz;

    :cond_12
    iput-object p2, p0, Lmq;->c:Ldl;

    iput-object p3, p0, Lmq;->g:Lkm;

    iput-object p4, p0, Lmq;->k:Lk8;

    iput-object p5, p0, Lmq;->l:Lkq;

    iput-object p6, p0, Lmq;->f:Ljava/util/List;

    instance-of p1, p2, Lkl;

    if-eqz p1, :cond_2e

    new-instance p1, Lep;

    check-cast p2, Lkl;

    iget-boolean p3, p2, Lkl;->h:Z

    iget-boolean p4, p2, Lkl;->i:Z

    iget-wide p5, p2, Lkl;->g:J

    invoke-direct {p1, p5, p6, p3, p4}, Lep;-><init>(JZZ)V

    goto :goto_3a

    :cond_2e
    new-instance p1, Lep;

    sget-wide p2, Lep;->d:J

    invoke-static {p2, p3}, Lpn7;->f(J)J

    move-result-wide p2

    const/4 p4, 0x0

    invoke-direct {p1, p2, p3, v0, p4}, Lep;-><init>(JZZ)V

    :goto_3a
    iput-object p1, p0, Lmq;->h:Lep;

    return-void
.end method


# virtual methods
.method public final e()Z
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lmq;->g(ZZ)Z

    move-result p0

    return p0
.end method

.method public final f()V
    .registers 5

    iget-object v0, p0, Lmq;->d:Lyz;

    const/4 v1, 0x0

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Lyz;->t()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_15

    iget-object v0, p0, Lmq;->d:Lyz;

    invoke-virtual {v0}, Lyz;->o()Z

    move-result v0

    xor-int/lit8 v1, v0, 0x1

    goto :goto_25

    :cond_15
    iget-object v0, p0, Lmq;->i:Llq;

    sget-object v3, Llq;->d:Llq;

    if-ne v0, v3, :cond_1e

    iget-object v0, p0, Lmq;->j:Llq;

    goto :goto_20

    :cond_1e
    iget-object v0, p0, Lmq;->i:Llq;

    :goto_20
    sget-object v3, Llq;->a:Llq;

    if-ne v0, v3, :cond_25

    move v1, v2

    :cond_25
    :goto_25
    iget-object p0, p0, Lmq;->d:Lyz;

    if-eqz v1, :cond_2d

    invoke-virtual {p0}, Lyz;->b()V

    return-void

    :cond_2d
    if-eqz p0, :cond_35

    const/4 v0, 0x0

    iput-object v0, p0, Lyz;->q:Ltz;

    invoke-virtual {p0}, Lyz;->c()V

    :cond_35
    return-void
.end method

.method public g(ZZ)Z
    .registers 5

    iget-object v0, p0, Lmq;->d:Lyz;

    if-eqz v0, :cond_36

    invoke-virtual {p0}, Lmq;->j()Z

    move-result v1

    if-nez v1, :cond_36

    if-eqz p2, :cond_12

    iget-object p2, p0, Lmq;->h:Lep;

    iget-boolean p2, p2, Lep;->b:Z

    if-nez p2, :cond_34

    :cond_12
    sget-object p2, Llq;->c:Llq;

    filled-new-array {p2}, [Llq;

    move-result-object p2

    invoke-virtual {p0, p2}, Lmq;->i([Llq;)Z

    move-result p2

    if-nez p2, :cond_34

    invoke-virtual {v0}, Lyz;->q()Z

    move-result p2

    if-eqz p2, :cond_36

    if-eqz p1, :cond_34

    sget-object p1, Llq;->a:Llq;

    sget-object p2, Llq;->b:Llq;

    filled-new-array {p1, p2}, [Llq;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmq;->i([Llq;)Z

    move-result p0

    if-eqz p0, :cond_36

    :cond_34
    const/4 p0, 0x1

    return p0

    :cond_36
    const/4 p0, 0x0

    return p0
.end method

.method public h(Ldl;)Ltz;
    .registers 3

    new-instance v0, Ljq;

    invoke-direct {v0, p0, p1}, Ljq;-><init>(Lmq;Ldl;)V

    return-object v0
.end method

.method public final varargs i([Llq;)Z
    .registers 2

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iget-object p0, p0, Lmq;->i:Llq;

    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final j()Z
    .registers 2

    sget-object v0, Llq;->d:Llq;

    filled-new-array {v0}, [Llq;

    move-result-object v0

    invoke-virtual {p0, v0}, Lmq;->i([Llq;)Z

    move-result p0

    return p0
.end method

.method public k()V
    .registers 4

    iget-object v0, p0, Lmq;->d:Lyz;

    if-eqz v0, :cond_b

    iget-object v1, p0, Lmq;->g:Lkm;

    iget-object v2, p0, Lmq;->c:Ldl;

    invoke-interface {v1, v0, v2}, Lkm;->k(Lyz;Ldl;)V

    :cond_b
    iget-object v0, p0, Lmq;->h:Lep;

    iget-boolean v0, v0, Lep;->a:Z

    if-eqz v0, :cond_15

    sget-object v0, Llq;->c:Llq;

    iput-object v0, p0, Lmq;->i:Llq;

    :cond_15
    return-void
.end method

.method public l(Z)V
    .registers 11

    iget-boolean v0, p0, Lmq;->n:Z

    if-eq v0, p1, :cond_82

    iput-boolean p1, p0, Lmq;->n:Z

    iget-object v0, p0, Lmq;->k:Lk8;

    if-eqz p1, :cond_83

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Llq;->b:Llq;

    sget-object v1, Llq;->a:Llq;

    filled-new-array {v1}, [Llq;

    move-result-object v1

    invoke-virtual {p0, v1}, Lmq;->i([Llq;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_23

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lmq;->m:J

    goto :goto_4c

    :cond_23
    invoke-virtual {p0, v2, v2}, Lmq;->g(ZZ)Z

    move-result v3

    if-nez v3, :cond_4c

    iget-wide v3, p0, Lmq;->m:J

    iget-object v5, p0, Lmq;->h:Lep;

    iget-wide v5, v5, Lep;->c:J

    add-long/2addr v3, v5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    cmp-long v3, v5, v3

    if-lez v3, :cond_4c

    iget-object v3, p0, Lmq;->d:Lyz;

    if-eqz v3, :cond_4c

    iget-object v3, p0, Lmq;->i:Llq;

    if-ne v3, p1, :cond_4c

    iget-object v3, p0, Lmq;->d:Lyz;

    invoke-virtual {p0, v3}, Lmq;->m(Lyz;)Z

    move-result v3

    if-eqz v3, :cond_4c

    sget-object v3, Llq;->c:Llq;

    iput-object v3, p0, Lmq;->i:Llq;

    :cond_4c
    :goto_4c
    invoke-virtual {v0, p0}, Lk8;->p0(Lmq;)V

    instance-of v3, p0, Lno;

    if-nez v3, :cond_82

    if-eqz v1, :cond_82

    iget-object v1, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v1, Lf5k;

    if-eqz v1, :cond_63

    iget-object v1, v1, Lf5k;->a:Lk5k;

    iget-boolean v2, v1, Lk5k;->h:Z

    const/4 v1, 0x1

    move v7, v1

    move v8, v2

    goto :goto_65

    :cond_63
    move v7, v2

    move v8, v7

    :goto_65
    iget-object v0, v0, Lk8;->a:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lx5f;

    iget-object v0, p0, Lmq;->c:Ldl;

    iget-object v4, v0, Ldl;->b:Lq50;

    iget-object v5, v0, Ldl;->c:Ljava/lang/String;

    iget v6, p0, Lmq;->e:I

    invoke-virtual/range {v3 .. v8}, Lx5f;->r(Lq50;Ljava/lang/String;IZZ)V

    iput-object p1, p0, Lmq;->i:Llq;

    iget-object p1, p0, Lmq;->d:Lyz;

    if-eqz p1, :cond_82

    iget-object v0, p0, Lmq;->g:Lkm;

    iget-object p0, p0, Lmq;->c:Ldl;

    invoke-interface {v0, p1, p0, v8}, Lkm;->p(Lyz;Ldl;Z)V

    :cond_82
    return-void

    :cond_83
    invoke-virtual {v0, p0}, Lk8;->g0(Lmq;)V

    return-void
.end method

.method public m(Lyz;)Z
    .registers 2

    invoke-virtual {p1}, Lyz;->t()Z

    move-result p0

    if-nez p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    invoke-virtual {p1}, Lyz;->o()Z

    move-result p0

    return p0
.end method
