.class public Ll/u94;
.super Ll/qgk;
.source "SourceFile"

# interfaces
.implements Ll/bql;


# instance fields
.field private d:Ll/erf0;

.field private e:Ll/erf0;

.field f:Ll/hql;

.field g:Ll/jt2;

.field private i:F


# direct methods
.method public constructor <init>(Ll/uow;Ll/q210$a;Ll/jt2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/qgk;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/u94;->i:F

    .line 7
    .line 8
    iget-boolean v0, p1, Ll/tow;->g0:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/wc4;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2}, Ll/wc4;-><init>(Ll/uow;Ll/q210$a;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/u94;->f:Ll/hql;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Ll/ib4;

    .line 21
    .line 22
    invoke-direct {v0, p1, p2}, Ll/ib4;-><init>(Ll/uow;Ll/q210$a;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/u94;->f:Ll/hql;

    .line 26
    .line 27
    :goto_0
    iput-object p3, p0, Ll/u94;->g:Ll/jt2;

    .line 28
    .line 29
    if-nez p3, :cond_1

    .line 30
    .line 31
    new-instance p2, Ll/qv40;

    .line 32
    .line 33
    invoke-direct {p2}, Ll/qv40;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p2, p0, Ll/u94;->g:Ll/jt2;

    .line 37
    .line 38
    :cond_1
    iget-object p2, p0, Ll/u94;->g:Ll/jt2;

    .line 39
    .line 40
    invoke-virtual {p0, p2}, Ll/qgk;->R1(Ll/gfj;)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Ll/u94;->f:Ll/hql;

    .line 44
    .line 45
    check-cast p2, Ll/gfj;

    .line 46
    .line 47
    invoke-virtual {p2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Ll/u94;->g:Ll/jt2;

    .line 51
    .line 52
    invoke-virtual {p2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ll/u94;->g:Ll/jt2;

    .line 56
    .line 57
    invoke-virtual {p0, p2}, Ll/qgk;->S1(Ll/gfj;)V

    .line 58
    .line 59
    .line 60
    new-instance p2, Ll/erf0;

    .line 61
    .line 62
    iget p3, p1, Ll/tow;->x:I

    .line 63
    .line 64
    iget p1, p1, Ll/tow;->w:I

    .line 65
    .line 66
    invoke-direct {p2, p3, p1}, Ll/erf0;-><init>(II)V

    .line 67
    .line 68
    .line 69
    iput-object p2, p0, Ll/u94;->d:Ll/erf0;

    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public B(Ll/row;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->B(Ll/row;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public E(ILl/row;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/aql;->E(ILl/row;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public E1(ILl/row;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/aql;->E1(ILl/row;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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

.method public I0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/eql;->I0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public J1(Ll/v94;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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

.method public K(Ll/g510;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->K(Ll/g510;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/hql;->M()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public N()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->N()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    :cond_0
    return-void
.end method

.method public P(F)V
    .locals 3

    .line 1
    iget v0, p0, Ll/u94;->i:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Ll/u94;->i:F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    cmpl-float v0, p1, v0

    .line 12
    .line 13
    iget-object v1, p0, Ll/u94;->d:Ll/erf0;

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Ll/erf0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    mul-float/2addr v1, p1

    .line 25
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Ll/u94;->d:Ll/erf0;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/erf0;->a()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-float v2, v2

    .line 36
    mul-float/2addr v2, p1

    .line 37
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-direct {v0, v1, p1}, Ll/erf0;-><init>(II)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/u94;->e:Ll/erf0;

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    new-instance p1, Ll/erf0;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object v1, p0, Ll/u94;->d:Ll/erf0;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-direct {p1, v0, v1}, Ll/erf0;-><init>(II)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Ll/u94;->e:Ll/erf0;

    .line 63
    .line 64
    return-void
.end method

.method public Q(Ll/ib4$l;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->T(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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

.method public Z0(II)V
    .locals 1

    .line 1
    new-instance v0, Ll/erf0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/erf0;-><init>(II)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/u94;->d:Ll/erf0;

    .line 7
    .line 8
    iget p1, p0, Ll/u94;->i:F

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    cmpl-float p2, p1, p2

    .line 12
    .line 13
    if-lez p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/u94;->P(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/aql;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/u94;->g:Ll/jt2;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public a1()Ll/v94;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->b(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->d()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/u94;->f:Ll/hql;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    instance-of v1, v0, Ll/wej;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    check-cast v0, Ll/gfj;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    invoke-super {p0}, Ll/qgk;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getInput()Ll/gfj;
    .locals 0

    .line 1
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public j(Ll/jt2;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/u94;->g:Ll/jt2;

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/qgk;->T1(Ll/gfj;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/u94;->g:Ll/jt2;

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/u94;->g:Ll/jt2;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/qgk;->U1(Ll/gfj;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/u94;->g:Ll/jt2;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/qgk;->R1(Ll/gfj;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/qgk;->S1(Ll/gfj;)V

    .line 30
    .line 31
    .line 32
    monitor-exit v0

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->k(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->m(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onDrawFrame()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u94;->e:Ll/erf0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/erf0;->b()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/u94;->e:Ll/erf0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/erf0;->a()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/u94;->e:Ll/erf0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/erf0;->b()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Ll/u94;->e:Ll/erf0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/erf0;->a()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p0, v0, v1}, Ll/qgk;->setRenderSize(II)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 35
    .line 36
    check-cast p0, Ll/wej;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public q(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->q(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->r()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/qgk;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    instance-of v0, p0, Ll/wej;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/gfj;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public s(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->setWarpType(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aql;->v(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v1()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/eql;->v1()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

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
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/hql;->x(II)Ll/erf0;

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

.method public z()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/u94;->f:Ll/hql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/aql;->z()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    :cond_0
    return-void
.end method
