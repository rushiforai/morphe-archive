.class public final Ll/xfy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;
.implements Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;
.implements Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;


# instance fields
.field public volatile a:Z

.field public volatile b:Ll/e0x0;

.field public final synthetic c:Ll/hcy0;


# direct methods
.method public constructor <init>(Ll/hcy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic c(Ll/xfy0;Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/xfy0;->a:Z

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter p0

    .line 13
    :try_start_0
    iget-boolean v1, p0, Ll/xfy0;->a:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "Connection attempt already in progress"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v1, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    iget-object v1, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnecting()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnected()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    :cond_1
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "Already awaiting connection attempt"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    monitor-exit p0

    .line 72
    return-void

    .line 73
    :cond_2
    new-instance v1, Ll/e0x0;

    .line 74
    .line 75
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-direct {v1, v0, v2, p0, p0}, Ll/e0x0;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;)V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 83
    .line 84
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "Connecting to remote service"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const/4 v0, 0x1

    .line 100
    iput-boolean v0, p0, Ll/xfy0;->a:Z

    .line 101
    .line 102
    iget-object v0, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->checkAvailabilityAndConnect()V

    .line 110
    .line 111
    .line 112
    monitor-exit p0

    .line 113
    return-void

    .line 114
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    throw v0
.end method

.method public final b(Landroid/content/Intent;)V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Lcom/google/android/gms/common/stats/ConnectionTracker;->getInstance()Lcom/google/android/gms/common/stats/ConnectionTracker;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    monitor-enter p0

    .line 17
    :try_start_0
    iget-boolean v2, p0, Ll/xfy0;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    iget-object v3, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    :try_start_1
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/d6x0;->E()Ll/l8x0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "Connection attempt already in progress"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return-void

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ll/d6x0;->E()Ll/l8x0;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "Using local app measurement service"

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 v2, 0x1

    .line 54
    iput-boolean v2, p0, Ll/xfy0;->a:Z

    .line 55
    .line 56
    iget-object v2, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 57
    .line 58
    invoke-static {v2}, Ll/hcy0;->h0(Ll/hcy0;)Ll/xfy0;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const/16 v3, 0x81

    .line 63
    .line 64
    invoke-virtual {v1, v0, p1, v2, v3}, Lcom/google/android/gms/common/stats/ConnectionTracker;->bindService(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 65
    .line 66
    .line 67
    monitor-exit p0

    .line 68
    return-void

    .line 69
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    throw p1
.end method

.method public final d()V
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnected()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnecting()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->disconnect()V

    .line 24
    .line 25
    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 28
    .line 29
    return-void
.end method

.method public final onConnected(Landroid/os/Bundle;)V
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    const-string p1, "MeasurementServiceConnection.onConnected"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    iget-object p1, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getService()Landroid/os/IInterface;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ll/isw0;

    .line 19
    .line 20
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/agy0;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Ll/agy0;-><init>(Ll/xfy0;Ll/isw0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/qsx0;->w(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :catch_0
    const/4 p1, 0x0

    .line 38
    :try_start_1
    iput-object p1, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Ll/xfy0;->a:Z

    .line 42
    .line 43
    :goto_0
    monitor-exit p0

    .line 44
    return-void

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    throw p1
.end method

.method public final onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/common/ConnectionResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    const-string v0, "MeasurementServiceConnection.onConnectionFailed"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/atx0;->z()Ll/d6x0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Service connection failed"

    .line 21
    .line 22
    invoke-virtual {v0, v1, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    monitor-enter p0

    .line 26
    const/4 p1, 0x0

    .line 27
    :try_start_0
    iput-boolean p1, p0, Ll/xfy0;->a:Z

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Ll/xfy0;->b:Ll/e0x0;

    .line 31
    .line 32
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    iget-object p1, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/egy0;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/egy0;-><init>(Ll/xfy0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    throw p1
.end method

.method public final onConnectionSuspended(I)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    const-string p1, "MeasurementServiceConnection.onConnectionSuspended"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/d6x0;->z()Ll/l8x0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "Service connection suspended"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/ggy0;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/ggy0;-><init>(Ll/xfy0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    const-string p1, "MeasurementServiceConnection.onServiceConnected"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    monitor-enter p0

    .line 7
    const/4 p1, 0x0

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    :try_start_0
    iput-boolean p1, p0, Ll/xfy0;->a:Z

    .line 11
    .line 12
    iget-object p1, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/d6x0;->A()Ll/l8x0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p2, "Service connected with null binder"

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    :try_start_1
    invoke-interface {p2}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "com.google.android.gms.measurement.internal.IMeasurementService"

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    const-string v1, "com.google.android.gms.measurement.internal.IMeasurementService"

    .line 46
    .line 47
    invoke-interface {p2, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    instance-of v2, v1, Ll/isw0;

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    check-cast v1, Ll/isw0;

    .line 56
    .line 57
    :goto_0
    move-object v0, v1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    new-instance v1, Ll/cuw0;

    .line 60
    .line 61
    invoke-direct {v1, p2}, Ll/cuw0;-><init>(Landroid/os/IBinder;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :goto_1
    iget-object p2, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 66
    .line 67
    invoke-virtual {p2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p2}, Ll/d6x0;->E()Ll/l8x0;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    const-string v1, "Bound to IMeasurementService interface"

    .line 76
    .line 77
    invoke-virtual {p2, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    iget-object p2, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 82
    .line 83
    invoke-virtual {p2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p2}, Ll/d6x0;->A()Ll/l8x0;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    const-string v2, "Got binder with a wrong descriptor"

    .line 92
    .line 93
    invoke-virtual {p2, v2, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    .line 95
    .line 96
    goto :goto_2

    .line 97
    :catch_0
    :try_start_2
    iget-object p2, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 98
    .line 99
    invoke-virtual {p2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-virtual {p2}, Ll/d6x0;->A()Ll/l8x0;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    const-string v1, "Service connect failed to get IMeasurementService"

    .line 108
    .line 109
    invoke-virtual {p2, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :goto_2
    if-nez v0, :cond_3

    .line 113
    .line 114
    iput-boolean p1, p0, Ll/xfy0;->a:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    .line 116
    :try_start_3
    invoke-static {}, Lcom/google/android/gms/common/stats/ConnectionTracker;->getInstance()Lcom/google/android/gms/common/stats/ConnectionTracker;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget-object p2, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 121
    .line 122
    invoke-virtual {p2}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 127
    .line 128
    invoke-static {v0}, Ll/hcy0;->h0(Ll/hcy0;)Ll/xfy0;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p1, p2, v0}, Lcom/google/android/gms/common/stats/ConnectionTracker;->unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 133
    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_3
    :try_start_4
    iget-object p1, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 137
    .line 138
    invoke-virtual {p1}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    new-instance p2, Ll/vfy0;

    .line 143
    .line 144
    invoke-direct {p2, p0, v0}, Ll/vfy0;-><init>(Ll/xfy0;Ll/isw0;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1, p2}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 148
    .line 149
    .line 150
    :catch_1
    :goto_3
    monitor-exit p0

    .line 151
    return-void

    .line 152
    :goto_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 153
    throw p1
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    const-string v0, "MeasurementServiceConnection.onServiceDisconnected"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/d6x0;->z()Ll/l8x0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "Service disconnected"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/cgy0;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/cgy0;-><init>(Ll/xfy0;Landroid/content/ComponentName;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
