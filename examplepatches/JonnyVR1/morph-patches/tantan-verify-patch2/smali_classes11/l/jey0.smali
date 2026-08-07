.class public final Ll/jey0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/gey0;

.field public final b:Ll/hdy0;

.field public final c:Ll/mfv0;

.field public final d:Ll/d0u0;

.field public e:I

.field public f:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:Landroid/os/Looper;

.field public final h:I

.field public i:Z

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Ll/hdy0;Ll/gey0;Ll/d0u0;ILl/mfv0;Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jey0;->b:Ll/hdy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jey0;->a:Ll/gey0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jey0;->d:Ll/d0u0;

    .line 9
    .line 10
    iput-object p6, p0, Ll/jey0;->g:Landroid/os/Looper;

    .line 11
    .line 12
    iput-object p5, p0, Ll/jey0;->c:Ll/mfv0;

    .line 13
    .line 14
    iput p4, p0, Ll/jey0;->h:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/jey0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()Landroid/os/Looper;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jey0;->g:Landroid/os/Looper;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/gey0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jey0;->a:Ll/gey0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/jey0;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/jey0;->i:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 6
    .line 7
    .line 8
    iput-boolean v1, p0, Ll/jey0;->i:Z

    .line 9
    .line 10
    iget-object v0, p0, Ll/jey0;->b:Ll/hdy0;

    .line 11
    .line 12
    invoke-interface {v0, p0}, Ll/hdy0;->b(Ll/jey0;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public final e(Ljava/lang/Object;)Ll/jey0;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Ll/jey0;->i:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/jey0;->f:Ljava/lang/Object;

    .line 9
    .line 10
    return-object p0
.end method

.method public final f(I)Ll/jey0;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/jey0;->i:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Ll/jey0;->e:I

    .line 9
    .line 10
    return-object p0
.end method

.method public final g()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jey0;->f:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final declared-synchronized h(Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/jey0;->j:Z

    .line 3
    .line 4
    or-int/2addr p1, v0

    .line 5
    iput-boolean p1, p0, Ll/jey0;->j:Z

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/jey0;->k:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public final declared-synchronized i(J)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/jey0;->i:Z

    .line 3
    .line 4
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/jey0;->g:Landroid/os/Looper;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    add-long/2addr v0, p1

    .line 30
    :goto_1
    iget-boolean v2, p0, Ll/jey0;->k:Z

    .line 31
    .line 32
    if-nez v2, :cond_2

    .line 33
    .line 34
    const-wide/16 v2, 0x0

    .line 35
    .line 36
    cmp-long v2, p1, v2

    .line 37
    .line 38
    if-lez v2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2}, Ljava/lang/Object;->wait(J)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 44
    .line 45
    .line 46
    move-result-wide p1

    .line 47
    sub-long p1, v0, p1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    new-instance p1, Ljava/util/concurrent/TimeoutException;

    .line 53
    .line 54
    const-string p2, "Message delivery timed out."

    .line 55
    .line 56
    invoke-direct {p1, p2}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p1

    .line 60
    :cond_2
    iget-boolean p1, p0, Ll/jey0;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    monitor-exit p0

    .line 63
    return p1

    .line 64
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw p1
.end method

.method public final declared-synchronized j()Z
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    const/4 p0, 0x0

    .line 4
    return p0
.end method
