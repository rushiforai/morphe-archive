.class public final Ll/yjt0;
.super Ll/fou0;
.source "SourceFile"


# instance fields
.field public final a:Ll/bft0;

.field public final b:Ljava/lang/Object;

.field public final c:Z

.field public final d:Z

.field public e:I

.field public f:Ll/atu0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Z

.field public h:Z

.field public i:F

.field public j:F

.field public k:F

.field public l:Z

.field public m:Z

.field public n:Ll/pms0;


# direct methods
.method public constructor <init>(Ll/bft0;FZZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/fou0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/yjt0;->h:Z

    .line 13
    .line 14
    iput-object p1, p0, Ll/yjt0;->a:Ll/bft0;

    .line 15
    .line 16
    iput p2, p0, Ll/yjt0;->i:F

    .line 17
    .line 18
    iput-boolean p3, p0, Ll/yjt0;->c:Z

    .line 19
    .line 20
    iput-boolean p4, p0, Ll/yjt0;->d:Z

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final X(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq v0, p1, :cond_0

    .line 3
    .line 4
    const-string p1, "unmute"

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const-string p1, "mute"

    .line 8
    .line 9
    :goto_0
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Ll/yjt0;->w8(Ljava/lang/String;Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ll/yjt0;->h:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final p8(FFIZF)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/yjt0;->i:F

    .line 5
    .line 6
    cmpl-float v1, p2, v1

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget v1, p0, Ll/yjt0;->k:F

    .line 12
    .line 13
    cmpl-float v1, p5, v1

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v2, 0x0

    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_2

    .line 22
    :cond_1
    :goto_0
    iput p2, p0, Ll/yjt0;->i:F

    .line 23
    .line 24
    iput p1, p0, Ll/yjt0;->j:F

    .line 25
    .line 26
    iget-boolean p1, p0, Ll/yjt0;->h:Z

    .line 27
    .line 28
    iput-boolean p4, p0, Ll/yjt0;->h:Z

    .line 29
    .line 30
    iget p2, p0, Ll/yjt0;->e:I

    .line 31
    .line 32
    iput p3, p0, Ll/yjt0;->e:I

    .line 33
    .line 34
    iget v1, p0, Ll/yjt0;->k:F

    .line 35
    .line 36
    iput p5, p0, Ll/yjt0;->k:F

    .line 37
    .line 38
    sub-float/2addr p5, v1

    .line 39
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    .line 40
    .line 41
    .line 42
    move-result p5

    .line 43
    const v1, 0x38d1b717    # 1.0E-4f

    .line 44
    .line 45
    .line 46
    cmpl-float p5, p5, v1

    .line 47
    .line 48
    if-lez p5, :cond_2

    .line 49
    .line 50
    iget-object p5, p0, Ll/yjt0;->a:Ll/bft0;

    .line 51
    .line 52
    invoke-interface {p5}, Ll/kkt0;->zzF()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p5

    .line 56
    invoke-virtual {p5}, Landroid/view/View;->invalidate()V

    .line 57
    .line 58
    .line 59
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    if-nez v2, :cond_3

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    :try_start_1
    iget-object p5, p0, Ll/yjt0;->n:Ll/pms0;

    .line 64
    .line 65
    if-eqz p5, :cond_4

    .line 66
    .line 67
    invoke-virtual {p5}, Ll/pms0;->zze()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :catch_0
    move-exception p5

    .line 72
    const-string v0, "#007 Could not call remote method."

    .line 73
    .line 74
    invoke-static {v0, p5}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    :goto_1
    invoke-virtual {p0, p2, p3, p1, p4}, Ll/yjt0;->v8(IIZZ)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    throw p0
.end method

.method public final synthetic q8(IIZZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/yjt0;->g:Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    if-ne p2, v3, :cond_0

    .line 11
    .line 12
    move p2, v3

    .line 13
    move v4, p2

    .line 14
    move v5, v4

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v4, p2

    .line 17
    move v5, v2

    .line 18
    :goto_0
    if-eq p1, p2, :cond_1

    .line 19
    .line 20
    move p1, v3

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move p1, v2

    .line 23
    :goto_1
    if-eqz p1, :cond_2

    .line 24
    .line 25
    if-ne v4, v3, :cond_2

    .line 26
    .line 27
    move p2, v3

    .line 28
    move v4, p2

    .line 29
    goto :goto_2

    .line 30
    :cond_2
    move p2, v2

    .line 31
    :goto_2
    if-eqz p1, :cond_3

    .line 32
    .line 33
    const/4 v6, 0x2

    .line 34
    if-ne v4, v6, :cond_3

    .line 35
    .line 36
    move v6, v3

    .line 37
    goto :goto_3

    .line 38
    :cond_3
    move v6, v2

    .line 39
    :goto_3
    if-eqz p1, :cond_4

    .line 40
    .line 41
    const/4 p1, 0x3

    .line 42
    if-ne v4, p1, :cond_4

    .line 43
    .line 44
    move p1, v3

    .line 45
    goto :goto_4

    .line 46
    :cond_4
    move p1, v2

    .line 47
    :goto_4
    if-nez v1, :cond_5

    .line 48
    .line 49
    if-eqz v5, :cond_6

    .line 50
    .line 51
    :cond_5
    move v2, v3

    .line 52
    :cond_6
    iput-boolean v2, p0, Ll/yjt0;->g:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    if-eqz v5, :cond_7

    .line 55
    .line 56
    :try_start_1
    iget-object v1, p0, Ll/yjt0;->f:Ll/atu0;

    .line 57
    .line 58
    if-eqz v1, :cond_7

    .line 59
    .line 60
    invoke-interface {v1}, Ll/atu0;->zzi()V

    .line 61
    .line 62
    .line 63
    goto :goto_5

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_8

    .line 66
    :catch_0
    move-exception p0

    .line 67
    goto :goto_6

    .line 68
    :cond_7
    :goto_5
    if-eqz p2, :cond_8

    .line 69
    .line 70
    iget-object p2, p0, Ll/yjt0;->f:Ll/atu0;

    .line 71
    .line 72
    if-eqz p2, :cond_8

    .line 73
    .line 74
    invoke-interface {p2}, Ll/atu0;->zzh()V

    .line 75
    .line 76
    .line 77
    :cond_8
    if-eqz v6, :cond_9

    .line 78
    .line 79
    iget-object p2, p0, Ll/yjt0;->f:Ll/atu0;

    .line 80
    .line 81
    if-eqz p2, :cond_9

    .line 82
    .line 83
    invoke-interface {p2}, Ll/atu0;->zzg()V

    .line 84
    .line 85
    .line 86
    :cond_9
    if-eqz p1, :cond_b

    .line 87
    .line 88
    iget-object p1, p0, Ll/yjt0;->f:Ll/atu0;

    .line 89
    .line 90
    if-eqz p1, :cond_a

    .line 91
    .line 92
    invoke-interface {p1}, Ll/atu0;->zze()V

    .line 93
    .line 94
    .line 95
    :cond_a
    iget-object p1, p0, Ll/yjt0;->a:Ll/bft0;

    .line 96
    .line 97
    invoke-interface {p1}, Ll/bft0;->k()V

    .line 98
    .line 99
    .line 100
    :cond_b
    if-eq p3, p4, :cond_c

    .line 101
    .line 102
    iget-object p0, p0, Ll/yjt0;->f:Ll/atu0;

    .line 103
    .line 104
    if-eqz p0, :cond_c

    .line 105
    .line 106
    invoke-interface {p0, p4}, Ll/atu0;->S(Z)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    .line 108
    .line 109
    goto :goto_7

    .line 110
    :goto_6
    :try_start_2
    const-string p1, "#007 Could not call remote method."

    .line 111
    .line 112
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    :cond_c
    :goto_7
    monitor-exit v0

    .line 116
    return-void

    .line 117
    :goto_8
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 118
    throw p0
.end method

.method public final synthetic r8(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yjt0;->a:Ll/bft0;

    .line 2
    .line 3
    const-string v0, "pubVideoCmd"

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final s1(Ll/atu0;)V
    .locals 1
    .param p1    # Ll/atu0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/yjt0;->f:Ll/atu0;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final s8(Lcom/google/android/gms/ads/internal/client/zzfk;)V
    .locals 9

    .line 1
    iget-object v1, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/google/android/gms/ads/internal/client/zzfk;->zza:Z

    .line 4
    .line 5
    iget-boolean v2, p1, Lcom/google/android/gms/ads/internal/client/zzfk;->zzb:Z

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/google/android/gms/ads/internal/client/zzfk;->zzc:Z

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iput-boolean v2, p0, Ll/yjt0;->l:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Ll/yjt0;->m:Z

    .line 13
    .line 14
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v1, v0, :cond_0

    .line 17
    .line 18
    const-string v0, "0"

    .line 19
    .line 20
    :goto_0
    move-object v4, v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const-string v0, "1"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :goto_1
    if-eq v1, v2, :cond_1

    .line 26
    .line 27
    const-string v0, "0"

    .line 28
    .line 29
    :goto_2
    move-object v6, v0

    .line 30
    goto :goto_3

    .line 31
    :cond_1
    const-string v0, "1"

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :goto_3
    if-eq v1, p1, :cond_2

    .line 35
    .line 36
    const-string p1, "0"

    .line 37
    .line 38
    :goto_4
    move-object v8, p1

    .line 39
    goto :goto_5

    .line 40
    :cond_2
    const-string p1, "1"

    .line 41
    .line 42
    goto :goto_4

    .line 43
    :goto_5
    const-string v7, "clickToExpandRequested"

    .line 44
    .line 45
    const-string v5, "customControlsRequested"

    .line 46
    .line 47
    const-string v3, "muteStart"

    .line 48
    .line 49
    const-string p1, "initialState"

    .line 50
    .line 51
    invoke-static/range {v3 .. v8}, Lcom/google/android/gms/common/util/CollectionUtils;->mapOf(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, p1, v0}, Ll/yjt0;->w8(Ljava/lang/String;Ljava/util/Map;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    move-object p0, v0

    .line 61
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    throw p0
.end method

.method public final t8(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput p1, p0, Ll/yjt0;->j:F

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final u8(Ll/pms0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/yjt0;->n:Ll/pms0;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final v8(IIZZ)V
    .locals 7

    .line 1
    sget-object v0, Ll/oct0;->e:Ll/xvw0;

    .line 2
    .line 3
    new-instance v1, Ll/xjt0;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move v3, p1

    .line 7
    move v4, p2

    .line 8
    move v5, p3

    .line 9
    move v6, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Ll/xjt0;-><init>(Ll/yjt0;IIZZ)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final w8(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    new-instance p2, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    move-object p2, v0

    .line 15
    :goto_0
    const-string v0, "action"

    .line 16
    .line 17
    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    sget-object p1, Ll/oct0;->e:Ll/xvw0;

    .line 21
    .line 22
    new-instance v0, Ll/wjt0;

    .line 23
    .line 24
    invoke-direct {v0, p0, p2}, Ll/wjt0;-><init>(Ll/yjt0;Ljava/util/Map;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final zze()F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Ll/yjt0;->k:F

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzf()F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Ll/yjt0;->j:F

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzg()F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Ll/yjt0;->i:F

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzh()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Ll/yjt0;->e:I

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzi()Ll/atu0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/yjt0;->f:Ll/atu0;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzk()V
    .locals 2

    .line 1
    const-string v0, "pause"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/yjt0;->w8(Ljava/lang/String;Ljava/util/Map;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final zzl()V
    .locals 2

    .line 1
    const-string v0, "play"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/yjt0;->w8(Ljava/lang/String;Ljava/util/Map;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final zzn()V
    .locals 2

    .line 1
    const-string v0, "stop"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/yjt0;->w8(Ljava/lang/String;Ljava/util/Map;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final zzo()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yjt0;->zzp()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    monitor-enter v0

    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    :try_start_0
    iget-boolean v1, p0, Ll/yjt0;->m:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-boolean p0, p0, Ll/yjt0;->d:Z

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return v2

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public final zzp()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/yjt0;->c:Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/yjt0;->l:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit v0

    .line 18
    return v2

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public final zzu()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yjt0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/yjt0;->h:Z

    .line 5
    .line 6
    iget v2, p0, Ll/yjt0;->e:I

    .line 7
    .line 8
    const/4 v3, 0x3

    .line 9
    iput v3, p0, Ll/yjt0;->e:I

    .line 10
    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    invoke-virtual {p0, v2, v3, v1, v1}, Ll/yjt0;->v8(IIZZ)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p0
.end method
