.class public final Ll/ukv0;
.super Ll/kos0;
.source "SourceFile"


# instance fields
.field public final a:Ll/hmv0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/dlt0;Ll/m7w0;Ll/fmu0;Ll/xhs0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/kos0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jmv0;

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/dlt0;->C()Ll/vcw0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, p4, v1}, Ll/jmv0;-><init>(Ll/fmu0;Ll/vcw0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p5}, Ll/jmv0;->e(Ll/xhs0;)V

    .line 14
    .line 15
    .line 16
    new-instance p4, Ll/zmv0;

    .line 17
    .line 18
    invoke-direct {p4, p2, p1, v0, p3}, Ll/zmv0;-><init>(Ll/dlt0;Landroid/content/Context;Ll/jmv0;Ll/m7w0;)V

    .line 19
    .line 20
    .line 21
    new-instance p1, Ll/hmv0;

    .line 22
    .line 23
    invoke-virtual {p3}, Ll/m7w0;->i()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-direct {p1, p4, p2}, Ll/hmv0;-><init>(Ll/mmv0;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/ukv0;->a:Ll/hmv0;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final l3(Lcom/google/android/gms/ads/internal/client/zzl;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ukv0;->a:Ll/hmv0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/hmv0;->d(Lcom/google/android/gms/ads/internal/client/zzl;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final declared-synchronized p2(Lcom/google/android/gms/ads/internal/client/zzl;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ukv0;->a:Ll/hmv0;

    .line 3
    .line 4
    invoke-virtual {v0, p1, p2}, Ll/hmv0;->d(Lcom/google/android/gms/ads/internal/client/zzl;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public final declared-synchronized zze()Ljava/lang/String;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ukv0;->a:Ll/hmv0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/hmv0;->a()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return-object v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public final declared-synchronized zzf()Ljava/lang/String;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ukv0;->a:Ll/hmv0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/hmv0;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return-object v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public final declared-synchronized zzi()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ukv0;->a:Ll/hmv0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/hmv0;->e()Z

    .line 5
    .line 6
    .line 7
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method
