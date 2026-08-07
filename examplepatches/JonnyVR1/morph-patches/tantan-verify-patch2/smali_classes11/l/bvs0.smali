.class public final Ll/bvs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Landroid/content/Context;

.field public final c:Ljava/lang/String;

.field public final d:Lcom/google/android/gms/internal/ads/zzcei;

.field public final e:Ll/hew0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:Ll/nds0;

.field public final g:Ll/nds0;

.field public h:Ll/avs0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Ll/nds0;Ll/nds0;Ll/hew0;)V
    .locals 1
    .param p6    # Ll/hew0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Ll/bvs0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Ll/bvs0;->i:I

    .line 13
    .line 14
    iput-object p3, p0, Ll/bvs0;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/bvs0;->b:Landroid/content/Context;

    .line 21
    .line 22
    iput-object p2, p0, Ll/bvs0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 23
    .line 24
    iput-object p6, p0, Ll/bvs0;->e:Ll/hew0;

    .line 25
    .line 26
    iput-object p4, p0, Ll/bvs0;->f:Ll/nds0;

    .line 27
    .line 28
    iput-object p5, p0, Ll/bvs0;->g:Ll/nds0;

    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic a(Ll/bvs0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/bvs0;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic c(Ll/bvs0;)Ll/avs0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bvs0;->h:Ll/avs0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/bvs0;)Ll/hew0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bvs0;->e:Ll/hew0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic f(Ll/bvs0;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bvs0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/bvs0;Ll/avs0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bvs0;->h:Ll/avs0;

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic h(Ll/bvs0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/bvs0;->i:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final b(Ll/v2s0;)Ll/vus0;
    .locals 4
    .param p1    # Ll/v2s0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string p1, "getEngine: Trying to acquire lock"

    .line 2
    .line 3
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/bvs0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter p1

    .line 9
    :try_start_0
    const-string v0, "getEngine: Lock acquired"

    .line 10
    .line 11
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "refreshIfDestroyed: Trying to acquire lock"

    .line 15
    .line 16
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/bvs0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 22
    :try_start_1
    const-string v1, "refreshIfDestroyed: Lock acquired"

    .line 23
    .line 24
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/bvs0;->h:Ll/avs0;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget v2, p0, Ll/bvs0;->i:I

    .line 32
    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    new-instance v2, Ll/zts0;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/zts0;-><init>(Ll/bvs0;)V

    .line 38
    .line 39
    .line 40
    sget-object v3, Ll/aus0;->a:Ll/aus0;

    .line 41
    .line 42
    invoke-virtual {v1, v2, v3}, Ll/kdt0;->e(Ll/xct0;Ll/vct0;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_2

    .line 48
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    :try_start_2
    const-string v0, "refreshIfDestroyed: Lock released"

    .line 50
    .line 51
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/bvs0;->h:Ll/avs0;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    const/4 v2, 0x2

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/kdt0;->a()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/4 v3, -0x1

    .line 65
    if-ne v0, v3, :cond_1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    iget v0, p0, Ll/bvs0;->i:I

    .line 69
    .line 70
    if-nez v0, :cond_2

    .line 71
    .line 72
    const-string v0, "getEngine (NO_UPDATE): Lock released"

    .line 73
    .line 74
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/bvs0;->h:Ll/avs0;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/avs0;->f()Ll/vus0;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    monitor-exit p1

    .line 84
    return-object p0

    .line 85
    :catchall_1
    move-exception p0

    .line 86
    goto :goto_3

    .line 87
    :cond_2
    const/4 v3, 0x1

    .line 88
    if-ne v0, v3, :cond_3

    .line 89
    .line 90
    iput v2, p0, Ll/bvs0;->i:I

    .line 91
    .line 92
    invoke-virtual {p0, v1}, Ll/bvs0;->d(Ll/v2s0;)Ll/avs0;

    .line 93
    .line 94
    .line 95
    const-string v0, "getEngine (PENDING_UPDATE): Lock released"

    .line 96
    .line 97
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Ll/bvs0;->h:Ll/avs0;

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/avs0;->f()Ll/vus0;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    monitor-exit p1

    .line 107
    return-object p0

    .line 108
    :cond_3
    const-string v0, "getEngine (UPDATING): Lock released"

    .line 109
    .line 110
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/bvs0;->h:Ll/avs0;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/avs0;->f()Ll/vus0;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    monitor-exit p1

    .line 120
    return-object p0

    .line 121
    :cond_4
    :goto_1
    iput v2, p0, Ll/bvs0;->i:I

    .line 122
    .line 123
    invoke-virtual {p0, v1}, Ll/bvs0;->d(Ll/v2s0;)Ll/avs0;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Ll/bvs0;->h:Ll/avs0;

    .line 128
    .line 129
    const-string v0, "getEngine (NULL or REJECTED): Lock released"

    .line 130
    .line 131
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Ll/bvs0;->h:Ll/avs0;

    .line 135
    .line 136
    invoke-virtual {p0}, Ll/avs0;->f()Ll/vus0;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 141
    return-object p0

    .line 142
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 143
    :try_start_4
    throw p0

    .line 144
    :goto_3
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 145
    throw p0
.end method

.method public final d(Ll/v2s0;)Ll/avs0;
    .locals 4
    .param p1    # Ll/v2s0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/bvs0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    invoke-static {p1, v0}, Ll/qdw0;->a(Landroid/content/Context;I)Ll/rdw0;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ll/rdw0;->zzh()Ll/rdw0;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/avs0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/bvs0;->g:Ll/nds0;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/avs0;-><init>(Ll/nds0;)V

    .line 16
    .line 17
    .line 18
    const-string v1, "loadJavascriptEngine > Before UI_THREAD_EXECUTOR"

    .line 19
    .line 20
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object v1, Ll/oct0;->e:Ll/xvw0;

    .line 24
    .line 25
    new-instance v2, Ll/dus0;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-direct {v2, p0, v3, v0}, Ll/dus0;-><init>(Ll/bvs0;Ll/v2s0;Ll/avs0;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "loadNewJavascriptEngine: Promise created"

    .line 35
    .line 36
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/ius0;

    .line 40
    .line 41
    invoke-direct {v1, p0, v0, p1}, Ll/ius0;-><init>(Ll/bvs0;Ll/avs0;Ll/rdw0;)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ll/jus0;

    .line 45
    .line 46
    invoke-direct {v2, p0, v0, p1}, Ll/jus0;-><init>(Ll/bvs0;Ll/avs0;Ll/rdw0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Ll/kdt0;->e(Ll/xct0;Ll/vct0;)V

    .line 50
    .line 51
    .line 52
    return-object v0
.end method

.method public final synthetic i(Ll/avs0;Ll/ots0;Ljava/util/ArrayList;J)V
    .locals 4

    .line 1
    const-string v0, "Could not receive /jsLoaded in "

    .line 2
    .line 3
    const-string v1, "loadJavascriptEngine > newEngine.setLoadedListener(postDelayed): Trying to acquire lock"

    .line 4
    .line 5
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/bvs0;->a:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    :try_start_0
    const-string v2, "loadJavascriptEngine > newEngine.setLoadedListener(postDelayed): Lock acquired"

    .line 12
    .line 13
    invoke-static {v2}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/kdt0;->a()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, -0x1

    .line 21
    if-eq v2, v3, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/kdt0;->a()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v3, 0x1

    .line 28
    if-ne v2, v3, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p1}, Ll/kdt0;->c()V

    .line 32
    .line 33
    .line 34
    sget-object v2, Ll/oct0;->e:Ll/xvw0;

    .line 35
    .line 36
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    new-instance v3, Ll/bus0;

    .line 40
    .line 41
    invoke-direct {v3, p2}, Ll/bus0;-><init>(Ll/ots0;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    sget-object p2, Ll/sgs0;->c:Ll/dgs0;

    .line 48
    .line 49
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p1}, Ll/kdt0;->a()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iget p0, p0, Ll/bvs0;->i:I

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    sub-long/2addr v2, p4

    .line 85
    new-instance p4, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p2, " ms. JS engine session reference status(onEngLoadedTimeout) is "

    .line 94
    .line 95
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p1, ". Update status(onEngLoadedTimeout) is "

    .line 102
    .line 103
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p0, ". LoadNewJavascriptEngine(onEngLoadedTimeout) latency is "

    .line 110
    .line 111
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string p0, " ms. Total latency(onEngLoadedTimeout) is "

    .line 118
    .line 119
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string p0, " ms. Rejecting."

    .line 126
    .line 127
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 138
    const-string p0, "loadJavascriptEngine > newEngine.setLoadedListener(postDelayed): Lock released"

    .line 139
    .line 140
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :catchall_0
    move-exception p0

    .line 145
    goto :goto_1

    .line 146
    :cond_1
    :goto_0
    :try_start_1
    const-string p0, "loadJavascriptEngine > newEngine.setLoadedListener(postDelayed): Lock released, the promise is already settled"

    .line 147
    .line 148
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    monitor-exit v1

    .line 152
    return-void

    .line 153
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 154
    throw p0
.end method

.method public final synthetic j(Ll/v2s0;Ll/avs0;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    new-instance v4, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    :try_start_0
    const-string p1, "loadJavascriptEngine > Before createJavascriptEngine"

    .line 15
    .line 16
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/bvs0;->b:Landroid/content/Context;

    .line 20
    .line 21
    iget-object v0, p0, Ll/bvs0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 22
    .line 23
    new-instance v5, Ll/wts0;

    .line 24
    .line 25
    const/4 v7, 0x0

    .line 26
    invoke-direct {v5, p1, v0, v7, v7}, Ll/wts0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/v2s0;Ll/far0;)V

    .line 27
    .line 28
    .line 29
    const-string p1, "loadJavascriptEngine > After createJavascriptEngine"

    .line 30
    .line 31
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    const-string p1, "loadJavascriptEngine > Before setting new engine loaded listener"

    .line 35
    .line 36
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/cus0;

    .line 40
    .line 41
    move-wide v8, v2

    .line 42
    move-object v2, v4

    .line 43
    move-wide v3, v8

    .line 44
    move-object v1, p0

    .line 45
    move-object v6, v5

    .line 46
    move-object v5, p2

    .line 47
    invoke-direct/range {v0 .. v6}, Ll/cus0;-><init>(Ll/bvs0;Ljava/util/ArrayList;JLl/avs0;Ll/ots0;)V

    .line 48
    .line 49
    .line 50
    move-object p0, v2

    .line 51
    move-object v2, v5

    .line 52
    move-object v5, v6

    .line 53
    invoke-interface {v5, v0}, Ll/ots0;->O(Ll/cus0;)V

    .line 54
    .line 55
    .line 56
    const-string p1, "loadJavascriptEngine > Before registering GmsgHandler for /jsLoaded"

    .line 57
    .line 58
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/eus0;

    .line 62
    .line 63
    move-object v4, v2

    .line 64
    move-wide v2, v8

    .line 65
    invoke-direct/range {v0 .. v5}, Ll/eus0;-><init>(Ll/bvs0;JLl/avs0;Ll/ots0;)V

    .line 66
    .line 67
    .line 68
    move-object v2, v4

    .line 69
    move-wide v3, v8

    .line 70
    const-string p1, "/jsLoaded"

    .line 71
    .line 72
    invoke-interface {v5, p1, v0}, Ll/cvs0;->q0(Ljava/lang/String;Ll/bqs0;)V

    .line 73
    .line 74
    .line 75
    new-instance p1, Ll/e9t0;

    .line 76
    .line 77
    invoke-direct {p1}, Ll/e9t0;-><init>()V

    .line 78
    .line 79
    .line 80
    new-instance p2, Ll/fus0;

    .line 81
    .line 82
    invoke-direct {p2, v1, v7, v5, p1}, Ll/fus0;-><init>(Ll/bvs0;Ll/v2s0;Ll/ots0;Ll/e9t0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p2}, Ll/e9t0;->b(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    const-string p1, "loadJavascriptEngine > Before registering GmsgHandler for /requestReload"

    .line 89
    .line 90
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const-string p1, "/requestReload"

    .line 94
    .line 95
    invoke-interface {v5, p1, p2}, Ll/cvs0;->q0(Ljava/lang/String;Ll/bqs0;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, v1, Ll/bvs0;->c:Ljava/lang/String;

    .line 99
    .line 100
    const-string p2, "loadJavascriptEngine > javascriptPath: "

    .line 101
    .line 102
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object p1, v1, Ll/bvs0;->c:Ljava/lang/String;

    .line 114
    .line 115
    const-string p2, ".js"

    .line 116
    .line 117
    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_0

    .line 122
    .line 123
    const-string p1, "loadJavascriptEngine > Before newEngine.loadJavascript"

    .line 124
    .line 125
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, v1, Ll/bvs0;->c:Ljava/lang/String;

    .line 129
    .line 130
    invoke-interface {v5, p1}, Ll/ots0;->A(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    const-string p1, "loadJavascriptEngine > After newEngine.loadJavascript"

    .line 134
    .line 135
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_0
    iget-object p1, v1, Ll/bvs0;->c:Ljava/lang/String;

    .line 140
    .line 141
    const-string p2, "<html>"

    .line 142
    .line 143
    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_1

    .line 148
    .line 149
    const-string p1, "loadJavascriptEngine > Before newEngine.loadHtml"

    .line 150
    .line 151
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, v1, Ll/bvs0;->c:Ljava/lang/String;

    .line 155
    .line 156
    invoke-interface {v5, p1}, Ll/ots0;->i(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    const-string p1, "loadJavascriptEngine > After newEngine.loadHtml"

    .line 160
    .line 161
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_1
    const-string p1, "loadJavascriptEngine > Before newEngine.loadHtmlWrapper"

    .line 166
    .line 167
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object p1, v1, Ll/bvs0;->c:Ljava/lang/String;

    .line 171
    .line 172
    invoke-interface {v5, p1}, Ll/ots0;->B(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    const-string p1, "loadJavascriptEngine > After newEngine.loadHtmlWrapper"

    .line 176
    .line 177
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    :goto_0
    const-string p1, "loadJavascriptEngine > Before calling ADMOB_UI_HANDLER.postDelayed"

    .line 181
    .line 182
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    sget-object p1, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 186
    .line 187
    new-instance v0, Ll/hus0;

    .line 188
    .line 189
    move-wide v8, v3

    .line 190
    move-object v3, v5

    .line 191
    move-wide v5, v8

    .line 192
    move-object v4, p0

    .line 193
    invoke-direct/range {v0 .. v6}, Ll/hus0;-><init>(Ll/bvs0;Ll/avs0;Ll/ots0;Ljava/util/ArrayList;J)V

    .line 194
    .line 195
    .line 196
    sget-object p0, Ll/sgs0;->d:Ll/dgs0;

    .line 197
    .line 198
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-virtual {p2, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    check-cast p0, Ljava/lang/Integer;

    .line 207
    .line 208
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    int-to-long v1, p0

    .line 213
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :catchall_0
    move-exception v0

    .line 218
    move-object v2, p2

    .line 219
    move-object p0, v0

    .line 220
    const-string p1, "Error creating webview."

    .line 221
    .line 222
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 223
    .line 224
    .line 225
    const-string p1, "SdkJavascriptFactory.loadJavascriptEngine"

    .line 226
    .line 227
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    invoke-virtual {p2, p0, p1}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v2}, Ll/kdt0;->c()V

    .line 235
    .line 236
    .line 237
    return-void
.end method

.method public final synthetic k(Ll/ots0;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/ots0;->zzi()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput p1, p0, Ll/bvs0;->i:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method
