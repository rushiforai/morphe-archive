.class public final Lfpd;
.super Lgk9;
.source "SourceFile"


# instance fields
.field public final d:Lx5f;

.field public final e:Ltjg;


# direct methods
.method public constructor <init>(Lujc;Lx5f;Ltjg;)V
    .registers 4

    invoke-direct {p0, p1}, Lgk9;-><init>(Lgig;)V

    iput-object p2, p0, Lfpd;->d:Lx5f;

    iput-object p3, p0, Lfpd;->e:Ltjg;

    return-void
.end method


# virtual methods
.method public final M()V
    .registers 2

    sget-object v0, Lai0;->f:Lai0;

    invoke-virtual {p0, v0}, Lfpd;->u0(Lai0;)V

    invoke-super {p0}, Lgk9;->M()V

    return-void
.end method

.method public final f()V
    .registers 1

    return-void
.end method

.method public final o0()V
    .registers 2

    sget-object v0, Lai0;->h:Lai0;

    invoke-virtual {p0, v0}, Lfpd;->u0(Lai0;)V

    invoke-super {p0}, Lgk9;->o0()V

    return-void
.end method

.method public final p0()V
    .registers 2

    sget-object v0, Lai0;->g:Lai0;

    invoke-virtual {p0, v0}, Lfpd;->u0(Lai0;)V

    invoke-super {p0}, Lgk9;->p0()V

    return-void
.end method

.method public final pause()V
    .registers 4

    iget-object v0, p0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->e0()Z

    move-result v1

    if-nez v1, :cond_1b

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_20

    invoke-interface {v0}, Lgig;->getPlayWhenReady()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Lgig;->G()I

    move-result v0

    if-nez v0, :cond_20

    :cond_1b
    sget-object v0, Lai0;->c:Lai0;

    invoke-virtual {p0, v0}, Lfpd;->u0(Lai0;)V

    :cond_20
    invoke-super {p0}, Lgk9;->pause()V

    return-void
.end method

.method public final play()V
    .registers 4

    iget-object v0, p0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->e0()Z

    move-result v1

    if-nez v1, :cond_20

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1b

    invoke-interface {v0}, Lgig;->getPlayWhenReady()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Lgig;->G()I

    move-result v0

    if-eqz v0, :cond_20

    :cond_1b
    sget-object v0, Lai0;->b:Lai0;

    invoke-virtual {p0, v0}, Lfpd;->u0(Lai0;)V

    :cond_20
    invoke-super {p0}, Lgk9;->play()V

    return-void
.end method

.method public final r()V
    .registers 2

    sget-object v0, Lai0;->e:Lai0;

    invoke-virtual {p0, v0}, Lfpd;->u0(Lai0;)V

    invoke-super {p0}, Lgk9;->r()V

    return-void
.end method

.method public final seekTo(IJ)V
    .registers 5

    iget-object v0, p0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->f0()I

    move-result v0

    if-ne p1, v0, :cond_b

    invoke-virtual {p0, p2, p3}, Lfpd;->v0(J)V

    :cond_b
    invoke-super {p0, p1, p2, p3}, Lgk9;->seekTo(IJ)V

    return-void
.end method

.method public final seekTo(J)V
    .registers 3

    .line 15
    invoke-virtual {p0, p1, p2}, Lfpd;->v0(J)V

    .line 16
    invoke-super {p0, p1, p2}, Lgk9;->seekTo(J)V

    return-void
.end method

.method public final stop()V
    .registers 2

    sget-object v0, Lai0;->d:Lai0;

    invoke-virtual {p0, v0}, Lfpd;->u0(Lai0;)V

    invoke-super {p0}, Lgk9;->stop()V

    return-void
.end method

.method public final u0(Lai0;)V
    .registers 9

    iget-object v0, p0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v0

    if-eqz v0, :cond_21

    iget-object v1, p0, Lfpd;->e:Ltjg;

    invoke-static {v1, v0}, Lzkd;->R(Ltjg;Lqjd;)Lrh0;

    move-result-object v2

    invoke-virtual {v1, v0}, Ltjg;->k(Lqjd;)Lkg7;

    move-result-object v0

    sget-object v1, Lkg7;->g:Lkg7;

    if-ne v0, v1, :cond_19

    sget-object v0, Lsh0;->b:Lsh0;

    goto :goto_1b

    :cond_19
    sget-object v0, Lsh0;->c:Lsh0;

    :goto_1b
    iget-object p0, p0, Lfpd;->d:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_22

    :cond_21
    return-void

    :cond_22
    iget-object v1, p0, Lx5f;->d:Lzpa;

    new-instance v3, Lbi0;

    const/4 v4, -0x1

    const/4 v5, 0x2

    const/16 v6, 0x98b

    invoke-direct {v3, v6, v4, v5}, Ljf0;-><init>(III)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x0

    invoke-virtual {v3, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lvh0;

    if-nez v5, :cond_47

    invoke-static {}, Lzpa;->A()Lvh0;

    move-result-object v5

    invoke-virtual {v3, p1, v4, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v3, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lvh0;

    :cond_47
    invoke-virtual {v5, v4, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, p1, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_6b

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_6b

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_74

    :cond_6b
    invoke-static {v0, v1, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_74
    invoke-virtual {v4, v3}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final v0(J)V
    .registers 9

    iget-object v0, p0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->getCurrentPosition()J

    move-result-wide v0

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x7530

    invoke-static {p1, p2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/16 v2, 0x1f4

    cmp-long v0, v0, v2

    if-ltz v0, :cond_28

    const-wide/16 v0, 0x3a98

    invoke-static {p1, p2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    sub-long/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_28

    return-void

    :cond_28
    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    if-gez p1, :cond_34

    sget-object p1, Lai0;->g:Lai0;

    invoke-virtual {p0, p1}, Lfpd;->u0(Lai0;)V

    return-void

    :cond_34
    sget-object p1, Lai0;->h:Lai0;

    invoke-virtual {p0, p1}, Lfpd;->u0(Lai0;)V

    return-void
.end method
