.class public final Ll/l0z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ll/kzy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ljava/util/concurrent/CopyOnWriteArrayList;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 12
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Ll/l0z0;-><init>(Ljava/util/concurrent/CopyOnWriteArrayList;ILl/kzy0;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/CopyOnWriteArrayList;ILl/kzy0;)V
    .locals 0
    .param p3    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/l0z0;->a:I

    .line 8
    .line 9
    iput-object p3, p0, Ll/l0z0;->b:Ll/kzy0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(ILl/kzy0;)Ll/l0z0;
    .locals 1
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    new-instance p1, Ll/l0z0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-direct {p1, p0, v0, p2}, Ll/l0z0;-><init>(Ljava/util/concurrent/CopyOnWriteArrayList;ILl/kzy0;)V

    .line 7
    .line 8
    .line 9
    return-object p1
.end method

.method public final b(Landroid/os/Handler;Ll/m0z0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/szy0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/szy0;-><init>(Landroid/os/Handler;Ll/m0z0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final c(Ll/gzy0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/szy0;

    .line 18
    .line 19
    iget-object v2, v1, Ll/szy0;->b:Ll/m0z0;

    .line 20
    .line 21
    iget-object v1, v1, Ll/szy0;->a:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v3, Ll/nzy0;

    .line 24
    .line 25
    invoke-direct {v3, p0, v2, p1}, Ll/nzy0;-><init>(Ll/l0z0;Ll/m0z0;Ll/gzy0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v3}, Ll/mpw0;->k(Landroid/os/Handler;Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public final d(Ll/bzy0;Ll/gzy0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/szy0;

    .line 18
    .line 19
    iget-object v2, v1, Ll/szy0;->b:Ll/m0z0;

    .line 20
    .line 21
    iget-object v1, v1, Ll/szy0;->a:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v3, Ll/rzy0;

    .line 24
    .line 25
    invoke-direct {v3, p0, v2, p1, p2}, Ll/rzy0;-><init>(Ll/l0z0;Ll/m0z0;Ll/bzy0;Ll/gzy0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v3}, Ll/mpw0;->k(Landroid/os/Handler;Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public final e(Ll/bzy0;Ll/gzy0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/szy0;

    .line 18
    .line 19
    iget-object v2, v1, Ll/szy0;->b:Ll/m0z0;

    .line 20
    .line 21
    iget-object v1, v1, Ll/szy0;->a:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v3, Ll/pzy0;

    .line 24
    .line 25
    invoke-direct {v3, p0, v2, p1, p2}, Ll/pzy0;-><init>(Ll/l0z0;Ll/m0z0;Ll/bzy0;Ll/gzy0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v3}, Ll/mpw0;->k(Landroid/os/Handler;Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public final f(Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/szy0;

    .line 18
    .line 19
    iget-object v4, v1, Ll/szy0;->b:Ll/m0z0;

    .line 20
    .line 21
    iget-object v1, v1, Ll/szy0;->a:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v2, Ll/qzy0;

    .line 24
    .line 25
    move-object v3, p0

    .line 26
    move-object v5, p1

    .line 27
    move-object v6, p2

    .line 28
    move-object v7, p3

    .line 29
    move v8, p4

    .line 30
    invoke-direct/range {v2 .. v8}, Ll/qzy0;-><init>(Ll/l0z0;Ll/m0z0;Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/mpw0;->k(Landroid/os/Handler;Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public final g(Ll/bzy0;Ll/gzy0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/szy0;

    .line 18
    .line 19
    iget-object v2, v1, Ll/szy0;->b:Ll/m0z0;

    .line 20
    .line 21
    iget-object v1, v1, Ll/szy0;->a:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v3, Ll/ozy0;

    .line 24
    .line 25
    invoke-direct {v3, p0, v2, p1, p2}, Ll/ozy0;-><init>(Ll/l0z0;Ll/m0z0;Ll/bzy0;Ll/gzy0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v3}, Ll/mpw0;->k(Landroid/os/Handler;Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public final h(Ll/m0z0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/szy0;

    .line 18
    .line 19
    iget-object v2, v1, Ll/szy0;->b:Ll/m0z0;

    .line 20
    .line 21
    if-ne v2, p1, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Ll/l0z0;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-void
.end method
