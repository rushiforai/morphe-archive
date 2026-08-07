.class public final Ll/uvr0;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/BlockingQueue;

.field public final b:Ll/tvr0;

.field public final c:Ll/lvr0;

.field public volatile d:Z

.field public final e:Ll/rvr0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/BlockingQueue;Ll/tvr0;Ll/lvr0;Ll/rvr0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/uvr0;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/uvr0;->a:Ljava/util/concurrent/BlockingQueue;

    .line 8
    .line 9
    iput-object p2, p0, Ll/uvr0;->b:Ll/tvr0;

    .line 10
    .line 11
    iput-object p3, p0, Ll/uvr0;->c:Ll/lvr0;

    .line 12
    .line 13
    iput-object p4, p0, Ll/uvr0;->e:Ll/rvr0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/uvr0;->d:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final b()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uvr0;->a:Ljava/util/concurrent/BlockingQueue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jwr0;

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x3

    .line 13
    invoke-virtual {v0, v1}, Ll/jwr0;->x(I)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x4

    .line 17
    :try_start_0
    const-string v2, "network-queue-take"

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ll/jwr0;->A()Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ll/jwr0;->b()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {v2}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/uvr0;->b:Ll/tvr0;

    .line 33
    .line 34
    invoke-interface {v2, v0}, Ll/tvr0;->a(Ll/jwr0;)Ll/vvr0;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v3, "network-http-complete"

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-boolean v3, v2, Ll/vvr0;->e:Z

    .line 44
    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/jwr0;->z()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    const-string v2, "not-modified"

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Ll/jwr0;->t(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ll/jwr0;->v()V

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    goto :goto_3

    .line 64
    :catch_0
    move-exception v2

    .line 65
    goto :goto_0

    .line 66
    :catch_1
    move-exception v2

    .line 67
    goto :goto_1

    .line 68
    :cond_0
    invoke-virtual {v0, v2}, Ll/jwr0;->j(Ll/vvr0;)Ll/pwr0;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const-string v3, "network-parse-complete"

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v3, v2, Ll/pwr0;->b:Ll/kvr0;

    .line 78
    .line 79
    if-eqz v3, :cond_1

    .line 80
    .line 81
    iget-object v3, p0, Ll/uvr0;->c:Ll/lvr0;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/jwr0;->n()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iget-object v5, v2, Ll/pwr0;->b:Ll/kvr0;

    .line 88
    .line 89
    invoke-interface {v3, v4, v5}, Ll/lvr0;->a(Ljava/lang/String;Ll/kvr0;)V

    .line 90
    .line 91
    .line 92
    const-string v3, "network-cache-written"

    .line 93
    .line 94
    invoke-virtual {v0, v3}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    invoke-virtual {v0}, Ll/jwr0;->u()V

    .line 98
    .line 99
    .line 100
    iget-object v3, p0, Ll/uvr0;->e:Ll/rvr0;

    .line 101
    .line 102
    const/4 v4, 0x0

    .line 103
    invoke-virtual {v3, v0, v2, v4}, Ll/rvr0;->b(Ll/jwr0;Ll/pwr0;Ljava/lang/Runnable;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v2}, Ll/jwr0;->w(Ll/pwr0;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzaqj; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :goto_0
    :try_start_1
    const-string v3, "Unhandled exception %s"

    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-static {v2, v3, v4}, Ll/swr0;->c(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    new-instance v3, Lcom/google/android/gms/internal/ads/zzaqj;

    .line 124
    .line 125
    invoke-direct {v3, v2}, Lcom/google/android/gms/internal/ads/zzaqj;-><init>(Ljava/lang/Throwable;)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Ll/uvr0;->e:Ll/rvr0;

    .line 132
    .line 133
    invoke-virtual {p0, v0, v3}, Ll/rvr0;->a(Ll/jwr0;Lcom/google/android/gms/internal/ads/zzaqj;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ll/jwr0;->v()V

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Ll/uvr0;->e:Ll/rvr0;

    .line 144
    .line 145
    invoke-virtual {p0, v0, v2}, Ll/rvr0;->a(Ll/jwr0;Lcom/google/android/gms/internal/ads/zzaqj;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ll/jwr0;->v()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    .line 150
    .line 151
    :goto_2
    invoke-virtual {v0, v1}, Ll/jwr0;->x(I)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :goto_3
    invoke-virtual {v0, v1}, Ll/jwr0;->x(I)V

    .line 156
    .line 157
    .line 158
    throw p0
.end method

.method public final run()V
    .locals 2

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ll/uvr0;->b()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_0
    iget-boolean v0, p0, Ll/uvr0;->d:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    new-array v0, v0, [Ljava/lang/Object;

    .line 24
    .line 25
    const-string v1, "Ignoring spurious interrupt of NetworkDispatcher thread; use quit() to terminate it"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/swr0;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0
.end method
