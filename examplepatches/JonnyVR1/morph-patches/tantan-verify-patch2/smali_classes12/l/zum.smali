.class public Ll/zum;
.super Ll/bkm;
.source "SourceFile"


# instance fields
.field o:Ll/hfj;

.field private p:Z

.field private q:I

.field private r:Ll/crf0;

.field private s:Ll/kt2;

.field private t:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bkm;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/zum;->s:Ll/kt2;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/zum;->t:I

    .line 9
    .line 10
    return-void
.end method

.method private B()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    instance-of v1, v0, Ll/hb20;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-boolean v1, p0, Ll/zum;->p:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    check-cast v0, Ll/hb20;

    .line 15
    .line 16
    iget v1, p0, Ll/zum;->q:I

    .line 17
    .line 18
    rsub-int v1, v1, 0x168

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/hb20;->O(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 24
    .line 25
    check-cast v0, Ll/hb20;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-virtual {v0, v1}, Ll/hb20;->P(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    check-cast v0, Ll/hb20;

    .line 33
    .line 34
    iget v1, p0, Ll/zum;->q:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/hb20;->O(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 40
    .line 41
    check-cast v0, Ll/hb20;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, v1}, Ll/hb20;->P(I)V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object v0, p0, Ll/zum;->r:Ll/crf0;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Ll/zum;->o:Ll/hfj;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/crf0;->b()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object p0, p0, Ll/zum;->r:Ll/crf0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/crf0;->a()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {v1, v0, p0}, Ll/xej;->z(II)V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public declared-synchronized A(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/zum;->t:I

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    new-instance p1, Ll/ss30;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/ss30;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/zum;->o:Ll/hfj;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    new-instance p1, Ll/nmq0;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/nmq0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/zum;->o:Ll/hfj;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x2

    .line 28
    if-ne p1, v0, :cond_2

    .line 29
    .line 30
    new-instance p1, Ll/r1f;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/r1f;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/zum;->o:Ll/hfj;

    .line 36
    .line 37
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/zum;->o:Ll/hfj;

    .line 38
    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object v0, p0, Ll/zum;->r:Ll/crf0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/crf0;->b()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Ll/zum;->r:Ll/crf0;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/crf0;->a()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {p1, v0, v1}, Ll/xej;->z(II)V

    .line 54
    .line 55
    .line 56
    :cond_3
    iget-object p1, p0, Ll/zum;->o:Ll/hfj;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/bkm;->k(Ll/hfj;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    .line 60
    .line 61
    monitor-exit p0

    .line 62
    return-void

    .line 63
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    throw p1
.end method

.method public declared-synchronized C([BI)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    instance-of v1, v0, Ll/hb20;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast v0, Ll/hb20;

    .line 13
    .line 14
    invoke-virtual {v0, p1, p2}, Ll/hb20;->V([BI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p1
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget v0, p0, Ll/zum;->t:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/ss30;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/ss30;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v1, 0x1

    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    new-instance v0, Ll/nmq0;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/nmq0;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 v1, 0x2

    .line 29
    if-ne v0, v1, :cond_2

    .line 30
    .line 31
    new-instance v0, Ll/r1f;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/r1f;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 37
    .line 38
    :cond_2
    :goto_0
    invoke-direct {p0}, Ll/zum;->B()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/bkm;->o(Ll/hfj;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/bkm;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zum;->s:Ll/kt2;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/hfj;->f()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/zum;->s:Ll/kt2;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public n(Ll/crf0;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/zum;->r:Ll/crf0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/zum;->o:Ll/hfj;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Ll/zum;->r:Ll/crf0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/crf0;->a()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {v0, v1, v2}, Ll/xej;->z(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-super {p0, p1}, Ll/bkm;->n(Ll/crf0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public declared-synchronized t(Ll/kt2;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/bkm;->d:Ll/hfj;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/zum;->s:Ll/kt2;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/hfj;->C(Ll/efj;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public declared-synchronized u()Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/zum;->o:Ll/hfj;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_1
    instance-of v2, v0, Ll/gul;

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    check-cast v0, Ll/gul;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/gul;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    monitor-exit p0

    .line 20
    return v0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    monitor-exit p0

    .line 24
    return v1

    .line 25
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 26
    throw v0
.end method

.method public v(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zum;->o:Ll/hfj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/r1f;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/r1f;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/r1f;->P(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public w(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/zum;->q:I

    .line 2
    .line 3
    invoke-direct {p0}, Ll/zum;->B()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zum;->p:Z

    .line 2
    .line 3
    invoke-direct {p0}, Ll/zum;->B()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/zum;->t:I

    .line 2
    .line 3
    return-void
.end method

.method public z(IIIIII)V
    .locals 8

    .line 1
    iget-object p0, p0, Ll/zum;->o:Ll/hfj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/ss30;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v1, p0

    .line 10
    check-cast v1, Ll/ss30;

    .line 11
    .line 12
    move v2, p1

    .line 13
    move v3, p2

    .line 14
    move v4, p3

    .line 15
    move v5, p4

    .line 16
    move v6, p5

    .line 17
    move v7, p6

    .line 18
    invoke-virtual/range {v1 .. v7}, Ll/ss30;->W(IIIIII)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
