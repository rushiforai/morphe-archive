.class public final Lx10;
.super Lmq;
.source "SourceFile"

# interfaces
.implements Ltz;


# instance fields
.field public p:Lsz;

.field public q:Z

.field public r:Z


# virtual methods
.method public final a(Lyz;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final b(Lyz;)Z
    .registers 3

    invoke-virtual {p0}, Lx10;->n()V

    iget-object v0, p0, Lx10;->p:Lsz;

    if-eqz v0, :cond_c

    invoke-virtual {v0, p1}, Lsz;->b(Lyz;)Z

    move-result p1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    if-nez p1, :cond_12

    invoke-virtual {p0}, Lx10;->o()V

    :cond_12
    return p1
.end method

.method public final c(Lyz;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final h(Ldl;)Ltz;
    .registers 5

    new-instance v0, Lsz;

    new-instance v1, Ljq;

    invoke-direct {v1, p0, p1}, Ljq;-><init>(Lmq;Ldl;)V

    const/4 p1, 0x2

    new-array p1, p1, [Ltz;

    const/4 v2, 0x0

    aput-object p0, p1, v2

    const/4 p0, 0x1

    aput-object v1, p1, p0

    invoke-direct {v0, p1}, Lsz;-><init>([Ltz;)V

    return-object v0
.end method

.method public final m(Lyz;)Z
    .registers 3

    move-object v0, p1

    check-cast v0, Lw10;

    invoke-virtual {v0}, Lw10;->v()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-boolean p0, p0, Lx10;->q:Z

    return p0

    :cond_c
    invoke-super {p0, p1}, Lmq;->m(Lyz;)Z

    move-result p0

    return p0
.end method

.method public final n()V
    .registers 3

    iget-object v0, p0, Lmq;->d:Lyz;

    check-cast v0, Lw10;

    invoke-virtual {v0}, Lw10;->v()Z

    move-result v1

    if-eqz v1, :cond_e

    iget-boolean v1, p0, Lx10;->r:Z

    if-eqz v1, :cond_f

    :cond_e
    return-void

    :cond_f
    const/4 v1, 0x1

    iput-boolean v1, p0, Lx10;->r:Z

    iget-object p0, p0, Lmq;->g:Lkm;

    invoke-interface {p0, v0}, Lkm;->l(Lyz;)V

    return-void
.end method

.method public final o()V
    .registers 3

    iget-object v0, p0, Lmq;->d:Lyz;

    check-cast v0, Lw10;

    invoke-virtual {v0}, Lw10;->v()Z

    move-result v1

    if-eqz v1, :cond_e

    iget-boolean v1, p0, Lx10;->q:Z

    if-eqz v1, :cond_f

    :cond_e
    return-void

    :cond_f
    const/4 v1, 0x1

    iput-boolean v1, p0, Lx10;->q:Z

    iget-object p0, p0, Lmq;->g:Lkm;

    invoke-interface {p0, v0}, Lkm;->A(Lyz;)V

    return-void
.end method
