.class public final Ll/igv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ljava/util/concurrent/ScheduledExecutorService;

.field public final c:Ll/nzt0;

.field public final d:Ll/ehv0;

.field public final e:Ll/uew0;

.field public final f:Lcom/google/android/gms/internal/ads/v3;

.field public final g:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public h:Ll/jgv0;

.field public i:Ll/b7w0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Ll/nzt0;Ll/ehv0;Ll/uew0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/ads/v3;->C()Lcom/google/android/gms/internal/ads/v3;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/igv0;->f:Lcom/google/android/gms/internal/ads/v3;

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/igv0;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 16
    .line 17
    iput-object p1, p0, Ll/igv0;->a:Ljava/util/concurrent/Executor;

    .line 18
    .line 19
    iput-object p2, p0, Ll/igv0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 20
    .line 21
    iput-object p3, p0, Ll/igv0;->c:Ll/nzt0;

    .line 22
    .line 23
    iput-object p4, p0, Ll/igv0;->d:Ll/ehv0;

    .line 24
    .line 25
    iput-object p5, p0, Ll/igv0;->e:Ll/uew0;

    .line 26
    .line 27
    return-void
.end method

.method public static bridge synthetic a(Ll/igv0;)Ll/jgv0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/igv0;->h:Ll/jgv0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic c(Ll/igv0;Ll/q6w0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/igv0;->e(Ll/q6w0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final declared-synchronized b(Ll/b7w0;)Ll/hpr;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/igv0;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/a7w0;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/igv0;->f:Lcom/google/android/gms/internal/ads/v3;

    .line 22
    .line 23
    new-instance v1, Lcom/google/android/gms/internal/ads/zzeml;

    .line 24
    .line 25
    invoke-static {p1}, Ll/khv0;->b(Ll/b7w0;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v2, 0x3

    .line 30
    invoke-direct {v1, v2, p1}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ads/v3;->f(Ljava/lang/Throwable;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_2

    .line 39
    :cond_0
    iput-object p1, p0, Ll/igv0;->i:Ll/b7w0;

    .line 40
    .line 41
    iget-object v0, p0, Ll/igv0;->d:Ll/ehv0;

    .line 42
    .line 43
    iget-object v1, p0, Ll/igv0;->f:Lcom/google/android/gms/internal/ads/v3;

    .line 44
    .line 45
    new-instance v2, Ll/jgv0;

    .line 46
    .line 47
    invoke-direct {v2, p1, v0, v1}, Ll/jgv0;-><init>(Ll/b7w0;Ll/ehv0;Lcom/google/android/gms/internal/ads/v3;)V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Ll/igv0;->h:Ll/jgv0;

    .line 51
    .line 52
    iget-object v0, p0, Ll/igv0;->d:Ll/ehv0;

    .line 53
    .line 54
    iget-object p1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 55
    .line 56
    iget-object p1, p1, Ll/a7w0;->a:Ljava/util/List;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Ll/ehv0;->k(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object p1, p0, Ll/igv0;->h:Ll/jgv0;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/jgv0;->e()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    iget-object p1, p0, Ll/igv0;->h:Ll/jgv0;

    .line 70
    .line 71
    invoke-virtual {p1}, Ll/jgv0;->a()Ll/q6w0;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Ll/igv0;->e(Ll/q6w0;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    :goto_1
    iget-object p1, p0, Ll/igv0;->f:Lcom/google/android/gms/internal/ads/v3;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    monitor-exit p0

    .line 82
    return-object p1

    .line 83
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    throw p1
.end method

.method public final declared-synchronized d(Ll/q6w0;)Ll/hpr;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p1, Ll/q6w0;->a:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p0, Ll/igv0;->c:Ll/nzt0;

    .line 21
    .line 22
    iget v3, p1, Ll/q6w0;->b:I

    .line 23
    .line 24
    invoke-interface {v2, v3, v1}, Ll/nzt0;->d(ILjava/lang/String;)Ll/pcv0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object v2, p0, Ll/igv0;->i:Ll/b7w0;

    .line 31
    .line 32
    invoke-interface {v1, v2, p1}, Ll/pcv0;->a(Ll/b7w0;Ll/q6w0;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Ll/igv0;->i:Ll/b7w0;

    .line 39
    .line 40
    invoke-interface {v1, v0, p1}, Ll/pcv0;->b(Ll/b7w0;Ll/q6w0;)Ll/hpr;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget p1, p1, Ll/q6w0;->S:I

    .line 45
    .line 46
    iget-object v1, p0, Ll/igv0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 47
    .line 48
    int-to-long v2, p1

    .line 49
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 50
    .line 51
    invoke-static {v0, v2, v3, p1, v1}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 52
    .line 53
    .line 54
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    monitor-exit p0

    .line 56
    return-object p1

    .line 57
    :catchall_0
    move-exception p1

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    :try_start_1
    new-instance p1, Lcom/google/android/gms/internal/ads/zzead;

    .line 60
    .line 61
    const/4 v0, 0x3

    .line 62
    invoke-direct {p1, v0}, Lcom/google/android/gms/internal/ads/zzead;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 66
    .line 67
    .line 68
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    monitor-exit p0

    .line 70
    return-object p1

    .line 71
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    throw p1
.end method

.method public final e(Ll/q6w0;)V
    .locals 4
    .param p1    # Ll/q6w0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Ll/igv0;->d(Ll/q6w0;)Ll/hpr;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Ll/igv0;->d:Ll/ehv0;

    .line 9
    .line 10
    iget-object v2, p0, Ll/igv0;->i:Ll/b7w0;

    .line 11
    .line 12
    iget-object v3, p0, Ll/igv0;->e:Ll/uew0;

    .line 13
    .line 14
    invoke-virtual {v1, v2, p1, v0, v3}, Ll/ehv0;->f(Ll/b7w0;Ll/q6w0;Ll/hpr;Ll/uew0;)Ll/hpr;

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/hgv0;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/hgv0;-><init>(Ll/igv0;Ll/q6w0;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/igv0;->a:Ljava/util/concurrent/Executor;

    .line 23
    .line 24
    invoke-static {v0, v1, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
