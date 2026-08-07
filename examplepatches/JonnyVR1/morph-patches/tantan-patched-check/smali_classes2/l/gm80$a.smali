.class public Ll/gm80$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gm80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final c:Ll/cl90;

.field public final d:Ll/yk90;

.field public final e:Ll/fm80;

.field public f:Z

.field public g:Ll/fb5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public h:I

.field public i:Z

.field public j:Z

.field public final synthetic k:Ll/gm80;


# direct methods
.method public constructor <init>(Ll/gm80;Ll/z06;Ll/cl90;Ll/fm80;Ll/yk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/cl90;",
            "Ll/fm80;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/gm80$a;->k:Ll/gm80;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/pud;-><init>(Ll/z06;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    iput-object p2, p0, Ll/gm80$a;->g:Ll/fb5;

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    iput p2, p0, Ll/gm80$a;->h:I

    .line 11
    .line 12
    iput-boolean p2, p0, Ll/gm80$a;->i:Z

    .line 13
    .line 14
    iput-boolean p2, p0, Ll/gm80$a;->j:Z

    .line 15
    .line 16
    iput-object p3, p0, Ll/gm80$a;->c:Ll/cl90;

    .line 17
    .line 18
    iput-object p4, p0, Ll/gm80$a;->e:Ll/fm80;

    .line 19
    .line 20
    iput-object p5, p0, Ll/gm80$a;->d:Ll/yk90;

    .line 21
    .line 22
    new-instance p2, Ll/gm80$a$a;

    .line 23
    .line 24
    invoke-direct {p2, p0, p1}, Ll/gm80$a$a;-><init>(Ll/gm80$a;Ll/gm80;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p5, p2}, Ll/yk90;->q(Ll/zk90;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic p(Ll/gm80$a;)Ll/fb5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gm80$a;->g:Ll/fb5;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/gm80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/gm80$a;->h:I

    return p0
.end method

.method public static bridge synthetic r(Ll/gm80$a;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/gm80$a;->i:Z

    return-void
.end method

.method public static bridge synthetic s(Ll/gm80$a;Ll/fb5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gm80$a;->g:Ll/fb5;

    return-void
.end method

.method public static bridge synthetic t(Ll/gm80$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gm80$a;->w()V

    return-void
.end method

.method public static bridge synthetic u(Ll/gm80$a;Ll/fb5;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gm80$a;->y(Ll/fb5;I)V

    return-void
.end method

.method public static bridge synthetic v(Ll/gm80$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gm80$a;->B()V

    return-void
.end method

.method private x()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gm80$a;->f:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    monitor-exit p0

    .line 8
    return v0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/gm80$a;->g:Ll/fb5;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-object v1, p0, Ll/gm80$a;->g:Ll/fb5;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Ll/gm80$a;->f:Z

    .line 18
    .line 19
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 21
    .line 22
    .line 23
    return v1

    .line 24
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method


# virtual methods
.method public final declared-synchronized A()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gm80$a;->f:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

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

.method public final B()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/gm80$a;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/z06;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final C(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/gm80$a;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Ll/z06;->onFailure(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final D(Ll/fb5;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/ji2;->d(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gm80$a;->A()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    :cond_0
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-direct {p0}, Ll/gm80$a;->x()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 26
    .line 27
    .line 28
    :cond_2
    return-void
.end method

.method public E(Ll/fb5;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->Q(Ll/fb5;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Ll/ji2;->d(I)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1, p2}, Ll/gm80$a;->D(Ll/fb5;I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/gm80$a;->J(Ll/fb5;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final F(Ll/db5;)Ll/fb5;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/db5;",
            ")",
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Ll/ib5;

    .line 3
    .line 4
    invoke-interface {v0}, Ll/ab5;->b0()Landroid/graphics/Bitmap;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Ll/gm80$a;->e:Ll/fm80;

    .line 9
    .line 10
    iget-object p0, p0, Ll/gm80$a;->k:Ll/gm80;

    .line 11
    .line 12
    invoke-static {p0}, Ll/gm80;->c(Ll/gm80;)Ll/xc80;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {v2, v1, p0}, Ll/fm80;->b(Landroid/graphics/Bitmap;Ll/xc80;)Ll/fb5;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {v0}, Ll/ib5;->V()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-interface {v0}, Ll/ib5;->x()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    :try_start_0
    invoke-interface {p1}, Ll/db5;->Y()Ll/qvb0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p0, p1, v1, v2}, Ll/ib5;->O(Ll/fb5;Ll/qvb0;II)Ll/ib5;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {v0}, Ll/nyk;->getExtras()Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {p1, v0}, Ll/lyk;->d(Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Ll/fb5;->S(Ljava/io/Closeable;)Ll/fb5;

    .line 44
    .line 45
    .line 46
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    invoke-static {p0}, Ll/fb5;->v(Ll/fb5;)V

    .line 48
    .line 49
    .line 50
    return-object p1

    .line 51
    :catchall_0
    move-exception p1

    .line 52
    invoke-static {p0}, Ll/fb5;->v(Ll/fb5;)V

    .line 53
    .line 54
    .line 55
    throw p1
.end method

.method public final declared-synchronized G()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gm80$a;->f:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-boolean v0, p0, Ll/gm80$a;->i:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Ll/gm80$a;->j:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/gm80$a;->g:Ll/fb5;

    .line 15
    .line 16
    invoke-static {v0}, Ll/fb5;->Q(Ll/fb5;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Ll/gm80$a;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return v0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    monitor-exit p0

    .line 30
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw v0
.end method

.method public final H(Ll/db5;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Ll/ib5;

    .line 2
    .line 3
    return p0
.end method

.method public final I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gm80$a;->k:Ll/gm80;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gm80;->d(Ll/gm80;)Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/gm80$a$b;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/gm80$a$b;-><init>(Ll/gm80$a;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final J(Ll/fb5;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gm80$a;->f:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/gm80$a;->g:Ll/fb5;

    .line 11
    .line 12
    invoke-static {p1}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/gm80$a;->g:Ll/fb5;

    .line 17
    .line 18
    iput p2, p0, Ll/gm80$a;->h:I

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Ll/gm80$a;->i:Z

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gm80$a;->G()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 29
    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/gm80$a;->I()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void

    .line 37
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gm80$a;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gm80$a;->C(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/gm80$a;->E(Ll/fb5;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final w()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/gm80$a;->j:Z

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gm80$a;->G()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/gm80$a;->I()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public final y(Ll/fb5;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->Q(Ll/fb5;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/wn80;->b(Ljava/lang/Boolean;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/db5;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/gm80$a;->H(Ll/db5;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Ll/gm80$a;->D(Ll/fb5;I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Ll/gm80$a;->c:Ll/cl90;

    .line 29
    .line 30
    iget-object v1, p0, Ll/gm80$a;->d:Ll/yk90;

    .line 31
    .line 32
    const-string v2, "PostprocessorProducer"

    .line 33
    .line 34
    invoke-interface {v0, v1, v2}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    :try_start_0
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ll/db5;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/gm80$a;->F(Ll/db5;)Ll/fb5;

    .line 45
    .line 46
    .line 47
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :try_start_1
    iget-object p1, p0, Ll/gm80$a;->c:Ll/cl90;

    .line 49
    .line 50
    iget-object v1, p0, Ll/gm80$a;->d:Ll/yk90;

    .line 51
    .line 52
    iget-object v3, p0, Ll/gm80$a;->e:Ll/fm80;

    .line 53
    .line 54
    invoke-virtual {p0, p1, v1, v3}, Ll/gm80$a;->z(Ll/cl90;Ll/yk90;Ll/fm80;)Ljava/util/Map;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-interface {p1, v1, v2, v3}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0, p2}, Ll/gm80$a;->D(Ll/fb5;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    .line 63
    .line 64
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto :goto_0

    .line 70
    :catch_0
    move-exception p1

    .line 71
    :try_start_2
    iget-object p2, p0, Ll/gm80$a;->c:Ll/cl90;

    .line 72
    .line 73
    iget-object v1, p0, Ll/gm80$a;->d:Ll/yk90;

    .line 74
    .line 75
    iget-object v3, p0, Ll/gm80$a;->e:Ll/fm80;

    .line 76
    .line 77
    invoke-virtual {p0, p2, v1, v3}, Ll/gm80$a;->z(Ll/cl90;Ll/yk90;Ll/fm80;)Ljava/util/Map;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-interface {p2, v1, v2, p1, v3}, Ll/cl90;->i(Ll/yk90;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1}, Ll/gm80$a;->C(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :goto_0
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 92
    .line 93
    .line 94
    throw p0
.end method

.method public final z(Ll/cl90;Ll/yk90;Ll/fm80;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cl90;",
            "Ll/yk90;",
            "Ll/fm80;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "PostprocessorProducer"

    .line 2
    .line 3
    invoke-interface {p1, p2, p0}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "Postprocessor"

    .line 12
    .line 13
    invoke-interface {p3}, Ll/fm80;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
