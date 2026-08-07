.class public final Ll/m4v0;
.super Ll/k4v0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/k4v0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bxy0;->v()Ll/y1t0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/y1t0;->b()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/l3t0;

    .line 13
    .line 14
    invoke-direct {v1, p1, v0, p0, p0}, Ll/l3t0;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final b(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k4v0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/k4v0;->c:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-object p0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Ll/k4v0;->c:Z

    .line 16
    .line 17
    iput-object p1, p0, Ll/k4v0;->e:Lcom/google/android/gms/internal/ads/zzbze;

    .line 18
    .line 19
    iget-object p1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->checkAvailabilityAndConnect()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/k4v0;->a:Ll/tct0;

    .line 25
    .line 26
    new-instance v1, Ll/l4v0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/l4v0;-><init>(Ll/m4v0;)V

    .line 29
    .line 30
    .line 31
    sget-object v2, Ll/oct0;->f:Ll/xvw0;

    .line 32
    .line 33
    invoke-virtual {p1, v1, v2}, Ll/tct0;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 37
    .line 38
    monitor-exit v0

    .line 39
    return-object p0

    .line 40
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0
.end method

.method public final onConnected(Landroid/os/Bundle;)V
    .locals 4

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
    if-nez v0, :cond_0

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
    iget-object v1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/l3t0;->c()Ll/t3t0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/k4v0;->e:Lcom/google/android/gms/internal/ads/zzbze;

    .line 18
    .line 19
    new-instance v3, Ll/j4v0;

    .line 20
    .line 21
    invoke-direct {v3, p0}, Ll/j4v0;-><init>(Ll/k4v0;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v1, v2, v3}, Ll/t3t0;->c3(Lcom/google/android/gms/internal/ads/zzbze;Ll/n4t0;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception v1

    .line 29
    :try_start_2
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "RemoteSignalsClientTask.onConnected"

    .line 34
    .line 35
    invoke-virtual {v2, v1, v3}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 39
    .line 40
    new-instance v1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 41
    .line 42
    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_1
    move-exception p0

    .line 50
    goto :goto_1

    .line 51
    :catch_0
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 52
    .line 53
    new-instance v1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 54
    .line 55
    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 59
    .line 60
    .line 61
    :cond_0
    :goto_0
    monitor-exit p1

    .line 62
    return-void

    .line 63
    :goto_1
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 64
    throw p0
.end method
