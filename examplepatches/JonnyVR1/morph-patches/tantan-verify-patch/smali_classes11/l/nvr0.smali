.class public final Ll/nvr0;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field public static final g:Z


# instance fields
.field public final a:Ljava/util/concurrent/BlockingQueue;

.field public final b:Ljava/util/concurrent/BlockingQueue;

.field public final c:Ll/lvr0;

.field public volatile d:Z

.field public final e:Ll/twr0;

.field public final f:Ll/rvr0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/swr0;->b:Z

    .line 2
    .line 3
    sput-boolean v0, Ll/nvr0;->g:Z

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/BlockingQueue;Ll/lvr0;Ll/rvr0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/nvr0;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/nvr0;->a:Ljava/util/concurrent/BlockingQueue;

    .line 8
    .line 9
    iput-object p2, p0, Ll/nvr0;->b:Ljava/util/concurrent/BlockingQueue;

    .line 10
    .line 11
    iput-object p3, p0, Ll/nvr0;->c:Ll/lvr0;

    .line 12
    .line 13
    iput-object p4, p0, Ll/nvr0;->f:Ll/rvr0;

    .line 14
    .line 15
    new-instance p1, Ll/twr0;

    .line 16
    .line 17
    invoke-direct {p1, p0, p2, p4}, Ll/twr0;-><init>(Ll/nvr0;Ljava/util/concurrent/BlockingQueue;Ll/rvr0;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/nvr0;->e:Ll/twr0;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic a(Ll/nvr0;)Ljava/util/concurrent/BlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvr0;->b:Ljava/util/concurrent/BlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/nvr0;->d:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final c()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nvr0;->a:Ljava/util/concurrent/BlockingQueue;

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
    const-string v1, "cache-queue-take"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Ll/jwr0;->x(I)V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    :try_start_0
    invoke-virtual {v0}, Ll/jwr0;->A()Z

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Ll/nvr0;->c:Ll/lvr0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/jwr0;->n()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-interface {v3, v4}, Ll/lvr0;->zza(Ljava/lang/String;)Ll/kvr0;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    const-string v1, "cache-miss"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/nvr0;->e:Ll/twr0;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ll/twr0;->c(Ll/jwr0;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_5

    .line 46
    .line 47
    iget-object p0, p0, Ll/nvr0;->b:Ljava/util/concurrent/BlockingQueue;

    .line 48
    .line 49
    invoke-interface {p0, v0}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 58
    .line 59
    .line 60
    move-result-wide v4

    .line 61
    invoke-virtual {v3, v4, v5}, Ll/kvr0;->a(J)Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v6, :cond_1

    .line 66
    .line 67
    const-string v1, "cache-hit-expired"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v3}, Ll/jwr0;->g(Ll/kvr0;)Ll/jwr0;

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/nvr0;->e:Ll/twr0;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ll/twr0;->c(Ll/jwr0;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_5

    .line 82
    .line 83
    iget-object p0, p0, Ll/nvr0;->b:Ljava/util/concurrent/BlockingQueue;

    .line 84
    .line 85
    invoke-interface {p0, v0}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const-string v6, "cache-hit"

    .line 90
    .line 91
    invoke-virtual {v0, v6}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    new-instance v6, Ll/vvr0;

    .line 95
    .line 96
    iget-object v7, v3, Ll/kvr0;->a:[B

    .line 97
    .line 98
    iget-object v8, v3, Ll/kvr0;->g:Ljava/util/Map;

    .line 99
    .line 100
    invoke-direct {v6, v7, v8}, Ll/vvr0;-><init>([BLjava/util/Map;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v6}, Ll/jwr0;->j(Ll/vvr0;)Ll/pwr0;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    const-string v7, "cache-hit-parsed"

    .line 108
    .line 109
    invoke-virtual {v0, v7}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v6}, Ll/pwr0;->c()Z

    .line 113
    .line 114
    .line 115
    move-result v7

    .line 116
    const/4 v8, 0x0

    .line 117
    if-nez v7, :cond_2

    .line 118
    .line 119
    const-string v3, "cache-parsing-failed"

    .line 120
    .line 121
    invoke-virtual {v0, v3}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-object v3, p0, Ll/nvr0;->c:Ll/lvr0;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/jwr0;->n()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    invoke-interface {v3, v4, v1}, Ll/lvr0;->b(Ljava/lang/String;Z)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v8}, Ll/jwr0;->g(Ll/kvr0;)Ll/jwr0;

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Ll/nvr0;->e:Ll/twr0;

    .line 137
    .line 138
    invoke-virtual {v1, v0}, Ll/twr0;->c(Ll/jwr0;)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-nez v1, :cond_5

    .line 143
    .line 144
    iget-object p0, p0, Ll/nvr0;->b:Ljava/util/concurrent/BlockingQueue;

    .line 145
    .line 146
    invoke-interface {p0, v0}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_2
    iget-wide v9, v3, Ll/kvr0;->f:J

    .line 151
    .line 152
    cmp-long v4, v9, v4

    .line 153
    .line 154
    if-gez v4, :cond_4

    .line 155
    .line 156
    const-string v4, "cache-hit-refresh-needed"

    .line 157
    .line 158
    invoke-virtual {v0, v4}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v3}, Ll/jwr0;->g(Ll/kvr0;)Ll/jwr0;

    .line 162
    .line 163
    .line 164
    iput-boolean v1, v6, Ll/pwr0;->d:Z

    .line 165
    .line 166
    iget-object v1, p0, Ll/nvr0;->e:Ll/twr0;

    .line 167
    .line 168
    invoke-virtual {v1, v0}, Ll/twr0;->c(Ll/jwr0;)Z

    .line 169
    .line 170
    .line 171
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    iget-object v3, p0, Ll/nvr0;->f:Ll/rvr0;

    .line 173
    .line 174
    if-nez v1, :cond_3

    .line 175
    .line 176
    :try_start_1
    new-instance v1, Ll/mvr0;

    .line 177
    .line 178
    invoke-direct {v1, p0, v0}, Ll/mvr0;-><init>(Ll/nvr0;Ll/jwr0;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, v0, v6, v1}, Ll/rvr0;->b(Ll/jwr0;Ll/pwr0;Ljava/lang/Runnable;)V

    .line 182
    .line 183
    .line 184
    goto :goto_0

    .line 185
    :cond_3
    invoke-virtual {v3, v0, v6, v8}, Ll/rvr0;->b(Ll/jwr0;Ll/pwr0;Ljava/lang/Runnable;)V

    .line 186
    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_4
    iget-object p0, p0, Ll/nvr0;->f:Ll/rvr0;

    .line 190
    .line 191
    invoke-virtual {p0, v0, v6, v8}, Ll/rvr0;->b(Ll/jwr0;Ll/pwr0;Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 192
    .line 193
    .line 194
    :cond_5
    :goto_0
    invoke-virtual {v0, v2}, Ll/jwr0;->x(I)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :goto_1
    invoke-virtual {v0, v2}, Ll/jwr0;->x(I)V

    .line 199
    .line 200
    .line 201
    throw p0
.end method

.method public final run()V
    .locals 3

    .line 1
    sget-boolean v0, Ll/nvr0;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    new-array v0, v1, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v2, "start new dispatcher"

    .line 9
    .line 10
    invoke-static {v2, v0}, Ll/swr0;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/16 v0, 0xa

    .line 14
    .line 15
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/nvr0;->c:Ll/lvr0;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/lvr0;->zzb()V

    .line 21
    .line 22
    .line 23
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ll/nvr0;->c()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    iget-boolean v0, p0, Ll/nvr0;->d:Z

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    new-array v0, v1, [Ljava/lang/Object;

    .line 40
    .line 41
    const-string v2, "Ignoring spurious interrupt of CacheDispatcher thread; use quit() to terminate it"

    .line 42
    .line 43
    invoke-static {v2, v0}, Ll/swr0;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0
.end method
