.class public Ll/w94;
.super Ll/hn2;
.source "SourceFile"

# interfaces
.implements Ll/cql;


# instance fields
.field private d:Ll/bql;

.field e:I


# direct methods
.method public constructor <init>(Ll/uow;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/row;ILl/jt2;)V
    .locals 1
    .param p1    # Ll/uow;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/row;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/hn2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/w94;->e:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/hn2;->a:Ll/uow;

    .line 8
    .line 9
    iput-object p2, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 10
    .line 11
    invoke-interface {p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p1, p2, p5}, Ll/f410;->b(Ll/uow;Ll/q210$a;Ll/jt2;)Ll/bql;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/w94;->d:Ll/bql;

    .line 20
    .line 21
    iput-object p1, p0, Ll/hn2;->c:Ll/z5m;

    .line 22
    .line 23
    iget-object p2, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 24
    .line 25
    invoke-interface {p2, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->f0(Ll/z5m;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 29
    .line 30
    iget-object p2, p0, Ll/w94;->d:Ll/bql;

    .line 31
    .line 32
    invoke-interface {p1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->u0(Ll/z5m;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string p2, "CameraInputPipline"

    .line 40
    .line 41
    const-string p5, "startPreview"

    .line 42
    .line 43
    filled-new-array {p2, p5}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p1, p2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/w94;->d:Ll/bql;

    .line 51
    .line 52
    invoke-interface {p1, p4, p3}, Ll/aql;->E1(ILl/row;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_0

    .line 57
    .line 58
    iput v0, p0, Ll/w94;->e:I

    .line 59
    .line 60
    :cond_0
    return-void
.end method


# virtual methods
.method public B(Ll/row;)V
    .locals 2
    .param p1    # Ll/row;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/hn2;->a:Ll/uow;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/row;->j()Ll/erf0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, v0, Ll/tow;->u:I

    .line 23
    .line 24
    iget-object v0, p0, Ll/hn2;->a:Ll/uow;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/row;->j()Ll/erf0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ll/erf0;->a()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, v0, Ll/tow;->v:I

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 37
    .line 38
    iget-object v1, p0, Ll/hn2;->a:Ll/uow;

    .line 39
    .line 40
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->i0(Ll/uow;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/w94;->d:Ll/bql;

    .line 44
    .line 45
    invoke-interface {v0, p1}, Ll/aql;->B(Ll/row;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 49
    .line 50
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 51
    .line 52
    invoke-interface {p1, p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->s0(Ll/bql;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    :catch_0
    :cond_2
    :goto_0
    return-void
.end method

.method public B0(Ll/row;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Ll/w94;->i0(Landroid/app/Activity;Ll/row;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public declared-synchronized G()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/w94;->d:Ll/bql;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    invoke-interface {v0}, Ll/aql;->a()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 12
    .line 13
    iget-object v1, p0, Ll/w94;->d:Ll/bql;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Z(Ll/z5m;)Ll/g510;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/g510;->j()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/w94;->d:Ll/bql;

    .line 24
    .line 25
    invoke-super {p0}, Ll/hn2;->G()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto :goto_1

    .line 31
    :catch_0
    :goto_0
    monitor-exit p0

    .line 32
    return-void

    .line 33
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->I(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public N()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/aql;->N()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bql;->P(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Q(Ll/ib4$l;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->Q(Ll/ib4$l;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public R(Ll/nx3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->R(Ll/nx3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->S(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public T(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    invoke-interface {p0, p1}, Ll/aql;->T(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    :catch_0
    :goto_0
    return-void
.end method

.method public Z0(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/u94;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/u94;->Z0(II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public a()Ll/z5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/aql;->b(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/aql;->c()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/aql;->d()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/aql;->e()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->g()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->h()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public i0(Landroid/app/Activity;Ll/row;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-interface {p1, v0, p2}, Ll/aql;->E(ILl/row;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 11
    .line 12
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 13
    .line 14
    invoke-interface {p1, p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->s0(Ll/bql;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public i1(Ll/v94;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->J1(Ll/v94;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j(Ll/jt2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    iget-object p0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j(Ll/jt2;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    :catch_0
    :goto_0
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/aql;->k(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/aql;->m(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public q(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/aql;->q(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/aql;->r()V

    .line 6
    .line 7
    .line 8
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 9
    .line 10
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 11
    .line 12
    invoke-interface {v0, p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->s0(Ll/bql;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    return-void
.end method

.method public s(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->s(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s1(Ll/ylg;Ll/yuf;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/itl;->s1(Ll/ylg;Ll/yuf;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setExposureCompensation(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->setExposureCompensation(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setWarpType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/aql;->setWarpType(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->u(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/aql;->v(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->w(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public x(II)Ll/erf0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/u94;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/u94;->x(II)Ll/erf0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public y1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->Z(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public z()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/aql;->z()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z1()Ll/v94;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w94;->d:Ll/bql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->a1()Ll/v94;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method
