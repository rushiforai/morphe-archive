.class public final Lm/e;
.super LD/g;
.source "SourceFile"


# virtual methods
.method public final K(Lm/f;Lm/f;)V
    .locals 0

    iput-object p2, p1, Lm/f;->b:Lm/f;

    return-void
.end method

.method public final L(Lm/f;Ljava/lang/Thread;)V
    .locals 0

    iput-object p2, p1, Lm/f;->a:Ljava/lang/Thread;

    return-void
.end method

.method public final a(Lm/g;Lm/c;)Z
    .locals 2

    sget-object v0, Lm/c;->b:Lm/c;

    monitor-enter p1

    :try_start_0
    iget-object v1, p1, Lm/g;->b:Lm/c;

    if-ne v1, p2, :cond_0

    iput-object v0, p1, Lm/g;->b:Lm/c;

    const/4 p2, 0x1

    monitor-exit p1

    return p2

    :catchall_0
    move-exception p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    monitor-exit p1

    return p2

    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public final b(Lm/g;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1

    monitor-enter p1

    :try_start_0
    iget-object v0, p1, Lm/g;->a:Ljava/lang/Object;

    if-ne v0, p2, :cond_0

    iput-object p3, p1, Lm/g;->a:Ljava/lang/Object;

    const/4 p2, 0x1

    monitor-exit p1

    return p2

    :catchall_0
    move-exception p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    monitor-exit p1

    return p2

    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public final c(Lm/g;Lm/f;Lm/f;)Z
    .locals 1

    monitor-enter p1

    :try_start_0
    iget-object v0, p1, Lm/g;->c:Lm/f;

    if-ne v0, p2, :cond_0

    iput-object p3, p1, Lm/g;->c:Lm/f;

    const/4 p2, 0x1

    monitor-exit p1

    return p2

    :catchall_0
    move-exception p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    monitor-exit p1

    return p2

    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method
