.class public final Ll/v2v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/xvw0;

.field public final c:Ll/i4v0;

.field public final d:Ll/kpx0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/xvw0;Ll/i4v0;Ll/kpx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/v2v0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/v2v0;->b:Ll/xvw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/v2v0;->c:Ll/i4v0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/v2v0;->d:Ll/kpx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic a(Lcom/google/android/gms/internal/ads/zzbze;ILcom/google/android/gms/internal/ads/zzecf;)Ll/hpr;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v2v0;->d:Ll/kpx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/u7v0;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/u7v0;->p8(Lcom/google/android/gms/internal/ads/zzbze;I)Ll/hpr;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final b(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzd:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/b;->b(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/google/android/gms/internal/ads/zzecf;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ads/zzecf;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Ll/v2v0;->a:Ll/xvw0;

    .line 24
    .line 25
    new-instance v1, Ll/s2v0;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/s2v0;-><init>(Ll/v2v0;Lcom/google/android/gms/internal/ads/zzbze;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Ll/v2v0;->b:Ll/xvw0;

    .line 35
    .line 36
    const-class v2, Ljava/util/concurrent/ExecutionException;

    .line 37
    .line 38
    sget-object v3, Ll/t2v0;->a:Ll/t2v0;

    .line 39
    .line 40
    invoke-static {v0, v2, v3, v1}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :goto_0
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    new-instance v2, Ll/u2v0;

    .line 49
    .line 50
    invoke-direct {v2, p0, p1, v1}, Ll/u2v0;-><init>(Ll/v2v0;Lcom/google/android/gms/internal/ads/zzbze;I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/v2v0;->b:Ll/xvw0;

    .line 54
    .line 55
    const-class p1, Lcom/google/android/gms/internal/ads/zzecf;

    .line 56
    .line 57
    invoke-static {v0, p1, v2, p0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public final synthetic c(Lcom/google/android/gms/internal/ads/zzbze;)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v2v0;->c:Ll/i4v0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/k4v0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Ll/k4v0;->c:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 11
    .line 12
    monitor-exit v0

    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Ll/k4v0;->c:Z

    .line 18
    .line 19
    iput-object p1, p0, Ll/k4v0;->e:Lcom/google/android/gms/internal/ads/zzbze;

    .line 20
    .line 21
    iget-object p1, p0, Ll/k4v0;->f:Ll/l3t0;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->checkAvailabilityAndConnect()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/k4v0;->a:Ll/tct0;

    .line 27
    .line 28
    new-instance v1, Ll/h4v0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/h4v0;-><init>(Ll/i4v0;)V

    .line 31
    .line 32
    .line 33
    sget-object v2, Ll/oct0;->f:Ll/xvw0;

    .line 34
    .line 35
    invoke-virtual {p1, v1, v2}, Ll/tct0;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/k4v0;->a:Ll/tct0;

    .line 39
    .line 40
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :goto_0
    sget-object p1, Ll/sgs0;->x5:Ll/dgs0;

    .line 42
    .line 43
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    int-to-long v0, p1

    .line 58
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 59
    .line 60
    invoke-interface {p0, v0, v1, p1}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Ljava/io/InputStream;

    .line 65
    .line 66
    return-object p0

    .line 67
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    throw p0
.end method
