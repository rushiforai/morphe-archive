.class public final Ll/v3v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/ScheduledExecutorService;

.field public final b:Ll/xvw0;

.field public final c:Ll/xvw0;

.field public final d:Ll/m4v0;

.field public final e:Ll/kpx0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ScheduledExecutorService;Ll/xvw0;Ll/xvw0;Ll/m4v0;Ll/kpx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/v3v0;->a:Ljava/util/concurrent/ScheduledExecutorService;

    .line 5
    .line 6
    iput-object p2, p0, Ll/v3v0;->b:Ll/xvw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/v3v0;->c:Ll/xvw0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/v3v0;->d:Ll/m4v0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/v3v0;->e:Ll/kpx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final synthetic a(Lcom/google/android/gms/internal/ads/zzbze;ILjava/lang/Throwable;)Ll/hpr;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v3v0;->e:Ll/kpx0;

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
    invoke-virtual {p0, p1, p2}, Ll/u7v0;->q8(Lcom/google/android/gms/internal/ads/zzbze;I)Ll/hpr;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final b(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 6

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
    sget-object v0, Ll/sgs0;->A7:Ll/dgs0;

    .line 24
    .line 25
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/v3v0;->c:Ll/xvw0;

    .line 42
    .line 43
    new-instance v1, Ll/n3v0;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/n3v0;-><init>(Ll/v3v0;Lcom/google/android/gms/internal/ads/zzbze;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v1}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object v0, p0, Ll/v3v0;->d:Ll/m4v0;

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ll/m4v0;->b(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_0
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-static {v0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget-object v2, Ll/sgs0;->x5:Ll/dgs0;

    .line 68
    .line 69
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Ljava/lang/Integer;

    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    int-to-long v2, v2

    .line 84
    iget-object v4, p0, Ll/v3v0;->a:Ljava/util/concurrent/ScheduledExecutorService;

    .line 85
    .line 86
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 87
    .line 88
    invoke-static {v0, v2, v3, v5, v4}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ll/gvw0;

    .line 93
    .line 94
    new-instance v2, Ll/u3v0;

    .line 95
    .line 96
    invoke-direct {v2, p0, p1, v1}, Ll/u3v0;-><init>(Ll/v3v0;Lcom/google/android/gms/internal/ads/zzbze;I)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/v3v0;->b:Ll/xvw0;

    .line 100
    .line 101
    const-class p1, Ljava/lang/Throwable;

    .line 102
    .line 103
    invoke-static {v0, p1, v2, p0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method

.method public final synthetic c(Lcom/google/android/gms/internal/ads/zzbze;)Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v3v0;->d:Ll/m4v0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m4v0;->b(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object p1, Ll/sgs0;->x5:Ll/dgs0;

    .line 8
    .line 9
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    int-to-long v0, p1

    .line 24
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 25
    .line 26
    invoke-interface {p0, v0, v1, p1}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ljava/io/InputStream;

    .line 31
    .line 32
    return-object p0
.end method
