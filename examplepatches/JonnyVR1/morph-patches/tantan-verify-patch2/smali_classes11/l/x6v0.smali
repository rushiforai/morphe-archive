.class public final Ll/x6v0;
.super Ll/a7v0;
.source "SourceFile"


# instance fields
.field public h:Lcom/google/android/gms/internal/ads/zzbyi;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a7v0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a7v0;->e:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {}, Ll/bxy0;->v()Ll/y1t0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/y1t0;->b()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/a7v0;->f:Landroid/os/Looper;

    .line 15
    .line 16
    iput-object p2, p0, Ll/a7v0;->g:Ljava/util/concurrent/ScheduledExecutorService;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final declared-synchronized c(Lcom/google/android/gms/internal/ads/zzbyi;J)Ll/hpr;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/a7v0;->b:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/a7v0;->a:Ll/tct0;

    .line 7
    .line 8
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    iget-object v1, p0, Ll/a7v0;->g:Ljava/util/concurrent/ScheduledExecutorService;

    .line 11
    .line 12
    invoke-static {p1, p2, p3, v0, v1}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 13
    .line 14
    .line 15
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    monitor-exit p0

    .line 17
    return-object p1

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    :try_start_1
    iput-boolean v0, p0, Ll/a7v0;->b:Z

    .line 22
    .line 23
    iput-object p1, p0, Ll/x6v0;->h:Lcom/google/android/gms/internal/ads/zzbyi;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/a7v0;->a()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/a7v0;->a:Ll/tct0;

    .line 29
    .line 30
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 31
    .line 32
    iget-object v1, p0, Ll/a7v0;->g:Ljava/util/concurrent/ScheduledExecutorService;

    .line 33
    .line 34
    invoke-static {p1, p2, p3, v0, v1}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance p2, Ll/w6v0;

    .line 39
    .line 40
    invoke-direct {p2, p0}, Ll/w6v0;-><init>(Ll/x6v0;)V

    .line 41
    .line 42
    .line 43
    sget-object p3, Ll/oct0;->f:Ll/xvw0;

    .line 44
    .line 45
    invoke-interface {p1, p2, p3}, Ll/hpr;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    .line 47
    .line 48
    monitor-exit p0

    .line 49
    return-object p1

    .line 50
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    throw p1
.end method

.method public final declared-synchronized onConnected(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean p1, p0, Ll/a7v0;->c:Z

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ll/a7v0;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    .line 9
    :try_start_1
    iget-object v0, p0, Ll/a7v0;->d:Ll/n3t0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/n3t0;->c()Ll/x3t0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/x6v0;->h:Lcom/google/android/gms/internal/ads/zzbyi;

    .line 16
    .line 17
    new-instance v2, Ll/z6v0;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/z6v0;-><init>(Ll/a7v0;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1, v2}, Ll/x3t0;->p5(Lcom/google/android/gms/internal/ads/zzbyi;Ll/a4t0;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    :try_start_2
    const-string v0, "RemoteAdsServiceSignalClientTask.onConnected"

    .line 29
    .line 30
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, p1, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/a7v0;->a:Ll/tct0;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 40
    .line 41
    .line 42
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :catchall_1
    move-exception p1

    .line 45
    goto :goto_0

    .line 46
    :catch_0
    :try_start_3
    iget-object v0, p0, Ll/a7v0;->a:Ll/tct0;

    .line 47
    .line 48
    new-instance v1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 49
    .line 50
    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 54
    .line 55
    .line 56
    monitor-exit p0

    .line 57
    return-void

    .line 58
    :cond_0
    monitor-exit p0

    .line 59
    return-void

    .line 60
    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 61
    throw p1
.end method

.method public final onConnectionSuspended(I)V
    .locals 2

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v1, "Remote ad service connection suspended, cause: %d."

    .line 12
    .line 13
    invoke-static {v0, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Lcom/google/android/gms/internal/ads/zzecf;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/a7v0;->a:Ll/tct0;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method
