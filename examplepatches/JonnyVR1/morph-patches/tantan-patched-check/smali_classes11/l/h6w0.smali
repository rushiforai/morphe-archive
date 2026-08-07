.class public final Ll/h6w0;
.super Ll/k7t0;
.source "SourceFile"


# instance fields
.field public final a:Ll/y5w0;

.field public final b:Ll/o5w0;

.field public final c:Ljava/lang/String;

.field public final d:Ll/c7w0;

.field public final e:Landroid/content/Context;

.field public final f:Lcom/google/android/gms/internal/ads/zzcei;

.field public final g:Ll/v2s0;

.field public final h:Ll/xwu0;

.field public i:Ll/ksu0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/y5w0;Landroid/content/Context;Ll/o5w0;Ll/c7w0;Lcom/google/android/gms/internal/ads/zzcei;Ll/v2s0;Ll/xwu0;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/k7t0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h6w0;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/h6w0;->a:Ll/y5w0;

    .line 7
    .line 8
    iput-object p4, p0, Ll/h6w0;->b:Ll/o5w0;

    .line 9
    .line 10
    iput-object p5, p0, Ll/h6w0;->d:Ll/c7w0;

    .line 11
    .line 12
    iput-object p3, p0, Ll/h6w0;->e:Landroid/content/Context;

    .line 13
    .line 14
    iput-object p6, p0, Ll/h6w0;->f:Lcom/google/android/gms/internal/ads/zzcei;

    .line 15
    .line 16
    sget-object p1, Ll/sgs0;->D0:Ll/dgs0;

    .line 17
    .line 18
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput-boolean p1, p0, Ll/h6w0;->j:Z

    .line 33
    .line 34
    iput-object p7, p0, Ll/h6w0;->g:Ll/v2s0;

    .line 35
    .line 36
    iput-object p8, p0, Ll/h6w0;->h:Ll/xwu0;

    .line 37
    .line 38
    return-void
.end method

.method public static bridge synthetic p8(Ll/h6w0;)Ll/ksu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic q8(Ll/h6w0;)Ll/c7w0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h6w0;->d:Ll/c7w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic r8(Ll/h6w0;Ll/ksu0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final declared-synchronized B0(Ll/p1m;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "#008 Must be called on the main UI thread."

    .line 3
    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p1, "Rewarded can not be shown before loaded"

    .line 12
    .line 13
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/h6w0;->b:Ll/o5w0;

    .line 17
    .line 18
    const/16 p2, 0x9

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p2, v0, v0}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p1, p2}, Ll/o5w0;->k(Lcom/google/android/gms/ads/internal/client/zze;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    :try_start_1
    sget-object v0, Ll/sgs0;->z2:Ll/dgs0;

    .line 33
    .line 34
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Ll/h6w0;->g:Ll/v2s0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/v2s0;->c()Ll/r2s0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ljava/lang/Throwable;

    .line 57
    .line 58
    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v0, v1}, Ll/r2s0;->d([Ljava/lang/StackTraceElement;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/app/Activity;

    .line 73
    .line 74
    iget-object v0, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 75
    .line 76
    invoke-virtual {v0, p2, p1}, Ll/ksu0;->o(ZLandroid/app/Activity;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    .line 78
    .line 79
    monitor-exit p0

    .line 80
    return-void

    .line 81
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    throw p1
.end method

.method public final J4(Ll/e9u0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h6w0;->b:Ll/o5w0;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-virtual {v0, p0}, Ll/o5w0;->z(Ll/gl50;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Ll/f6w0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/f6w0;-><init>(Ll/h6w0;Ll/e9u0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/o5w0;->z(Ll/gl50;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final declared-synchronized M5(Lcom/google/android/gms/ads/internal/client/zzl;Ll/s7t0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x3

    .line 3
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Ll/h6w0;->s8(Lcom/google/android/gms/ads/internal/client/zzl;Ll/s7t0;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw p1
.end method

.method public final N5(Ll/ycu0;)V
    .locals 2

    .line 1
    const-string v0, "setOnPaidEventListener must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-interface {p1}, Ll/ycu0;->zzf()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/h6w0;->h:Ll/xwu0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/xwu0;->e()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception v0

    .line 19
    const-string v1, "Error in making CSI ping for reporting paid event callback"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/dct0;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/h6w0;->b:Ll/o5w0;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/o5w0;->A(Ll/ycu0;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final R0(Ll/o7t0;)V
    .locals 1

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/h6w0;->b:Ll/o5w0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/o5w0;->B(Ll/o7t0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final R2(Ll/t7t0;)V
    .locals 1

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/h6w0;->b:Ll/o5w0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/o5w0;->P(Ll/t7t0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final declared-synchronized g0(Ll/p1m;)V
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
    iget-boolean v0, p0, Ll/h6w0;->j:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0}, Ll/h6w0;->B0(Ll/p1m;Z)V
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

.method public final declared-synchronized i2(Lcom/google/android/gms/internal/ads/zzcbb;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "#008 Must be called on the main UI thread."

    .line 3
    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/h6w0;->d:Ll/c7w0;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/google/android/gms/internal/ads/zzcbb;->zza:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Ll/c7w0;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/google/android/gms/internal/ads/zzcbb;->zzb:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, v0, Ll/c7w0;->b:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p1
.end method

.method public final declared-synchronized s5(Lcom/google/android/gms/ads/internal/client/zzl;Ll/s7t0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x2

    .line 3
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Ll/h6w0;->s8(Lcom/google/android/gms/ads/internal/client/zzl;Ll/s7t0;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw p1
.end method

.method public final declared-synchronized s8(Lcom/google/android/gms/ads/internal/client/zzl;Ll/s7t0;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Ll/wis0;->l:Ll/kis0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/sgs0;->Ga:Ll/dgs0;

    .line 18
    .line 19
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_2

    .line 39
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/h6w0;->f:Lcom/google/android/gms/internal/ads/zzcei;

    .line 40
    .line 41
    iget v0, v0, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 42
    .line 43
    sget-object v2, Ll/sgs0;->Ha:Ll/dgs0;

    .line 44
    .line 45
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-lt v0, v2, :cond_1

    .line 60
    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    :cond_1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 64
    .line 65
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    iget-object v0, p0, Ll/h6w0;->b:Ll/o5w0;

    .line 69
    .line 70
    invoke-virtual {v0, p2}, Ll/o5w0;->D(Ll/s7t0;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Ll/h6w0;->e:Landroid/content/Context;

    .line 77
    .line 78
    invoke-static {p2}, Lcom/google/android/gms/ads/internal/util/b;->g(Landroid/content/Context;)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    const/4 v0, 0x0

    .line 83
    if-eqz p2, :cond_4

    .line 84
    .line 85
    iget-object p2, p1, Lcom/google/android/gms/ads/internal/client/zzl;->zzs:Lcom/google/android/gms/ads/internal/client/zzc;

    .line 86
    .line 87
    if-eqz p2, :cond_3

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    const-string p1, "Failed to load the ad because app ID is missing."

    .line 91
    .line 92
    invoke-static {p1}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/h6w0;->b:Ll/o5w0;

    .line 96
    .line 97
    const/4 p2, 0x4

    .line 98
    invoke-static {p2, v0, v0}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p1, p2}, Ll/o5w0;->u(Lcom/google/android/gms/ads/internal/client/zze;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    .line 104
    .line 105
    monitor-exit p0

    .line 106
    return-void

    .line 107
    :cond_4
    :goto_1
    :try_start_1
    iget-object p2, p0, Ll/h6w0;->i:Ll/ksu0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    .line 109
    if-eqz p2, :cond_5

    .line 110
    .line 111
    monitor-exit p0

    .line 112
    return-void

    .line 113
    :cond_5
    :try_start_2
    new-instance p2, Ll/q5w0;

    .line 114
    .line 115
    invoke-direct {p2, v0}, Ll/q5w0;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/h6w0;->a:Ll/y5w0;

    .line 119
    .line 120
    invoke-virtual {v0, p3}, Ll/y5w0;->i(I)V

    .line 121
    .line 122
    .line 123
    iget-object p3, p0, Ll/h6w0;->a:Ll/y5w0;

    .line 124
    .line 125
    iget-object v0, p0, Ll/h6w0;->c:Ljava/lang/String;

    .line 126
    .line 127
    new-instance v1, Ll/g6w0;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/g6w0;-><init>(Ll/h6w0;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p3, p1, v0, p2, v1}, Ll/y5w0;->a(Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ll/kmv0;Ll/lmv0;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 133
    .line 134
    .line 135
    monitor-exit p0

    .line 136
    return-void

    .line 137
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 138
    throw p1
.end method

.method public final declared-synchronized x1(Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "setImmersiveMode must be called on the main UI thread."

    .line 3
    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iput-boolean p1, p0, Ll/h6w0;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw p1
.end method

.method public final zzb()Landroid/os/Bundle;
    .locals 1

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ksu0;->i()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance p0, Landroid/os/Bundle;

    .line 16
    .line 17
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public final zzc()Ll/tlu0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/sgs0;->N6:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/kzt0;->d()Ll/b6u0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public final zzd()Ll/i7t0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ksu0;->j()Ll/i7t0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public final declared-synchronized zze()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/kzt0;->d()Ll/b6u0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/kzt0;->d()Ll/b6u0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/b6u0;->zzg()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    monitor-exit p0

    .line 21
    return-object v0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit p0

    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v0
.end method

.method public final zzo()Z
    .locals 1

    .line 1
    const-string v0, "#008 Must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/h6w0;->i:Ll/ksu0;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ksu0;->m()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method
