.class public final Ll/q4v0;
.super Ll/k4v0;
.source "SourceFile"


# instance fields
.field public g:Ljava/lang/String;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/k4v0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/q4v0;->h:I

    .line 6
    .line 7
    invoke-static {}, Ll/bxy0;->v()Ll/y1t0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/y1t0;->b()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/l3t0;

    .line 16
    .line 17
    invoke-direct {v1, p1, v0, p0, p0}, Ll/l3t0;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final b(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k4v0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/q4v0;->h:I

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x2

    .line 8
    if-eq v1, v2, :cond_0

    .line 9
    .line 10
    if-eq v1, v3, :cond_0

    .line 11
    .line 12
    new-instance p0, Lcom/google/android/gms/internal/ads/zzecf;

    .line 13
    .line 14
    invoke-direct {p0, v3}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    monitor-exit v0

    .line 22
    return-object p0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-boolean v1, p0, Ll/k4v0;->c:Z

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 30
    .line 31
    monitor-exit v0

    .line 32
    return-object p0

    .line 33
    :cond_1
    iput v3, p0, Ll/q4v0;->h:I

    .line 34
    .line 35
    iput-boolean v2, p0, Ll/k4v0;->c:Z

    .line 36
    .line 37
    iput-object p1, p0, Ll/k4v0;->e:Lcom/google/android/gms/internal/ads/zzbze;

    .line 38
    .line 39
    iget-object p1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->checkAvailabilityAndConnect()V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/k4v0;->a:Ll/tct0;

    .line 45
    .line 46
    new-instance v1, Ll/o4v0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/o4v0;-><init>(Ll/q4v0;)V

    .line 49
    .line 50
    .line 51
    sget-object v2, Ll/oct0;->f:Ll/xvw0;

    .line 52
    .line 53
    invoke-virtual {p1, v1, v2}, Ll/tct0;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 57
    .line 58
    monitor-exit v0

    .line 59
    return-object p0

    .line 60
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    throw p0
.end method

.method public final c(Ljava/lang/String;)Ll/hpr;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k4v0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/q4v0;->h:I

    .line 5
    .line 6
    const/4 v2, 0x3

    .line 7
    const/4 v3, 0x1

    .line 8
    if-eq v1, v3, :cond_0

    .line 9
    .line 10
    if-eq v1, v2, :cond_0

    .line 11
    .line 12
    new-instance p0, Lcom/google/android/gms/internal/ads/zzecf;

    .line 13
    .line 14
    const/4 p1, 0x2

    .line 15
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    monitor-exit v0

    .line 23
    return-object p0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-boolean v1, p0, Ll/k4v0;->c:Z

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 31
    .line 32
    monitor-exit v0

    .line 33
    return-object p0

    .line 34
    :cond_1
    iput v2, p0, Ll/q4v0;->h:I

    .line 35
    .line 36
    iput-boolean v3, p0, Ll/k4v0;->c:Z

    .line 37
    .line 38
    iput-object p1, p0, Ll/q4v0;->g:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->checkAvailabilityAndConnect()V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/k4v0;->a:Ll/tct0;

    .line 46
    .line 47
    new-instance v1, Ll/p4v0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/p4v0;-><init>(Ll/q4v0;)V

    .line 50
    .line 51
    .line 52
    sget-object v2, Ll/oct0;->f:Ll/xvw0;

    .line 53
    .line 54
    invoke-virtual {p1, v1, v2}, Ll/tct0;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 58
    .line 59
    monitor-exit v0

    .line 60
    return-object p0

    .line 61
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    throw p0
.end method

.method public final onConnected(Landroid/os/Bundle;)V
    .locals 4
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/k4v0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iget-boolean v0, p0, Ll/k4v0;->d:Z

    .line 5
    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/k4v0;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    .line 11
    :try_start_1
    iget v1, p0, Ll/q4v0;->h:I

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/l3t0;->c()Ll/t3t0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Ll/k4v0;->e:Lcom/google/android/gms/internal/ads/zzbze;

    .line 23
    .line 24
    new-instance v3, Ll/j4v0;

    .line 25
    .line 26
    invoke-direct {v3, p0}, Ll/j4v0;-><init>(Ll/k4v0;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v1, v2, v3}, Ll/t3t0;->q3(Lcom/google/android/gms/internal/ads/zzbze;Ll/n4t0;)V

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :catchall_0
    move-exception v1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v2, 0x3

    .line 36
    if-ne v1, v2, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/l3t0;->c()Ll/t3t0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Ll/q4v0;->g:Ljava/lang/String;

    .line 45
    .line 46
    new-instance v3, Ll/j4v0;

    .line 47
    .line 48
    invoke-direct {v3, p0}, Ll/j4v0;-><init>(Ll/k4v0;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v1, v2, v3}, Ll/t3t0;->r1(Ljava/lang/String;Ll/n4t0;)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v1, p0, Ll/k4v0;->a:Ll/tct0;

    .line 56
    .line 57
    new-instance v2, Lcom/google/android/gms/internal/ads/zzecf;

    .line 58
    .line 59
    invoke-direct {v2, v0}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Ll/tct0;->c(Ljava/lang/Throwable;)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :goto_0
    :try_start_2
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const-string v3, "RemoteUrlAndCacheKeyClientTask.onConnected"

    .line 71
    .line 72
    invoke-virtual {v2, v1, v3}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 76
    .line 77
    new-instance v1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 78
    .line 79
    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :catchall_1
    move-exception p0

    .line 87
    goto :goto_2

    .line 88
    :catch_0
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 89
    .line 90
    new-instance v1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 91
    .line 92
    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 96
    .line 97
    .line 98
    :cond_2
    :goto_1
    monitor-exit p1

    .line 99
    return-void

    .line 100
    :goto_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 101
    throw p0
.end method

.method public final onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 1
    .param p1    # Lcom/google/android/gms/common/ConnectionResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string p1, "Cannot connect to remote service, fallback to local instance."

    .line 2
    .line 3
    invoke-static {p1}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-direct {p1, v0}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method
