.class public final Ll/g1z0;
.super Ll/txy0;
.source "SourceFile"

# interfaces
.implements Ll/x0z0;


# instance fields
.field public final h:Ll/kdx0;

.field public final i:Ll/huy0;

.field public final j:I

.field public k:Z

.field public l:J

.field public m:Z

.field public n:Z

.field public o:Ll/btx0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public p:Ll/trs0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field public final q:Ll/d1z0;

.field public final r:Ll/s6z0;


# direct methods
.method public synthetic constructor <init>(Ll/trs0;Ll/kdx0;Ll/d1z0;Ll/huy0;Ll/s6z0;ILl/f1z0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/txy0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g1z0;->p:Ll/trs0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/g1z0;->h:Ll/kdx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/g1z0;->q:Ll/d1z0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/g1z0;->i:Ll/huy0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/g1z0;->r:Ll/s6z0;

    .line 13
    .line 14
    iput p6, p0, Ll/g1z0;->j:I

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Ll/g1z0;->k:Z

    .line 18
    .line 19
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    iput-wide p1, p0, Ll/g1z0;->l:J

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/j2z0;

    .line 4
    .line 5
    iget-wide v8, v0, Ll/g1z0;->l:J

    .line 6
    .line 7
    iget-boolean v2, v0, Ll/g1z0;->m:Z

    .line 8
    .line 9
    iget-boolean v3, v0, Ll/g1z0;->n:Z

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/g1z0;->d()Ll/trs0;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    iget-object v3, v4, Ll/trs0;->d:Ll/jfs0;

    .line 18
    .line 19
    :goto_0
    move-object/from16 v21, v3

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const/4 v3, 0x0

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    const/16 v18, 0x0

    .line 25
    .line 26
    const/16 v19, 0x0

    .line 27
    .line 28
    move/from16 v16, v2

    .line 29
    .line 30
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    const-wide/16 v12, 0x0

    .line 36
    .line 37
    const-wide/16 v14, 0x0

    .line 38
    .line 39
    const/16 v17, 0x0

    .line 40
    .line 41
    move-object/from16 v20, v4

    .line 42
    .line 43
    move-wide v4, v2

    .line 44
    move-wide v6, v2

    .line 45
    move-wide v10, v8

    .line 46
    invoke-direct/range {v1 .. v21}, Ll/j2z0;-><init>(JJJJJJJZZZLjava/lang/Object;Ll/trs0;Ll/jfs0;)V

    .line 47
    .line 48
    .line 49
    iget-boolean v2, v0, Ll/g1z0;->k:Z

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    new-instance v2, Ll/c1z0;

    .line 54
    .line 55
    invoke-direct {v2, v0, v1}, Ll/c1z0;-><init>(Ll/g1z0;Ll/d0u0;)V

    .line 56
    .line 57
    .line 58
    move-object v1, v2

    .line 59
    :cond_1
    invoke-virtual {v0, v1}, Ll/txy0;->w(Ll/d0u0;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final G()V
    .locals 0

    .line 1
    return-void
.end method

.method public final c(JZZ)V
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-wide p1, p0, Ll/g1z0;->l:J

    .line 11
    .line 12
    :cond_0
    iget-boolean v0, p0, Ll/g1z0;->k:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-wide v0, p0, Ll/g1z0;->l:J

    .line 17
    .line 18
    cmp-long v0, v0, p1

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-boolean v0, p0, Ll/g1z0;->m:Z

    .line 23
    .line 24
    if-ne v0, p3, :cond_1

    .line 25
    .line 26
    iget-boolean v0, p0, Ll/g1z0;->n:Z

    .line 27
    .line 28
    if-ne v0, p4, :cond_1

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iput-wide p1, p0, Ll/g1z0;->l:J

    .line 32
    .line 33
    iput-boolean p3, p0, Ll/g1z0;->m:Z

    .line 34
    .line 35
    iput-boolean p4, p0, Ll/g1z0;->n:Z

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Ll/g1z0;->k:Z

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/g1z0;->A()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final declared-synchronized d()Ll/trs0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/g1z0;->p:Ll/trs0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public final i(Ll/kzy0;Ll/c6z0;J)Ll/izy0;
    .locals 14

    .line 1
    iget-object v0, p0, Ll/g1z0;->h:Ll/kdx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kdx0;->zza()Ll/fex0;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-object v0, p0, Ll/g1z0;->o:Ll/btx0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v2, v0}, Ll/fex0;->f(Ll/btx0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/g1z0;->d()Ll/trs0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Ll/trs0;->b:Ll/zis0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/g1z0;->q:Ll/d1z0;

    .line 24
    .line 25
    new-instance v3, Ll/b1z0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/txy0;->o()Ll/voy0;

    .line 28
    .line 29
    .line 30
    move-object v4, v3

    .line 31
    new-instance v3, Ll/uxy0;

    .line 32
    .line 33
    iget-object v1, v1, Ll/d1z0;->a:Ll/ifr0;

    .line 34
    .line 35
    invoke-direct {v3, v1}, Ll/uxy0;-><init>(Ll/ifr0;)V

    .line 36
    .line 37
    .line 38
    move-object v1, v4

    .line 39
    iget-object v4, p0, Ll/g1z0;->i:Ll/huy0;

    .line 40
    .line 41
    invoke-virtual/range {p0 .. p1}, Ll/txy0;->p(Ll/kzy0;)Ll/zty0;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    iget-object v6, p0, Ll/g1z0;->r:Ll/s6z0;

    .line 46
    .line 47
    invoke-virtual/range {p0 .. p1}, Ll/txy0;->r(Ll/kzy0;)Ll/l0z0;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    iget v11, p0, Ll/g1z0;->j:I

    .line 52
    .line 53
    iget-object v0, v0, Ll/zis0;->a:Landroid/net/Uri;

    .line 54
    .line 55
    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    invoke-static {v9, v10}, Ll/mpw0;->F(J)J

    .line 61
    .line 62
    .line 63
    move-result-wide v12

    .line 64
    const/4 v10, 0x0

    .line 65
    move-object v8, v1

    .line 66
    move-object v1, v0

    .line 67
    move-object v0, v8

    .line 68
    move-object v8, p0

    .line 69
    move-object/from16 v9, p2

    .line 70
    .line 71
    invoke-direct/range {v0 .. v13}, Ll/b1z0;-><init>(Landroid/net/Uri;Ll/fex0;Ll/q0z0;Ll/huy0;Ll/zty0;Ll/s6z0;Ll/l0z0;Ll/x0z0;Ll/c6z0;Ljava/lang/String;IJ)V

    .line 72
    .line 73
    .line 74
    return-object v0
.end method

.method public final k(Ll/izy0;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b1z0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/b1z0;->w()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final declared-synchronized m(Ll/trs0;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Ll/g1z0;->p:Ll/trs0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public final v(Ll/btx0;)V
    .locals 0
    .param p1    # Ll/btx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/g1z0;->o:Ll/btx0;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/txy0;->o()Ll/voy0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/g1z0;->A()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final x()V
    .locals 0

    .line 1
    return-void
.end method
