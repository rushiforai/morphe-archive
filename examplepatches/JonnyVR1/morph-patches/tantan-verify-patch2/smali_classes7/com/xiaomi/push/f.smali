.class public Lcom/xiaomi/push/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x1r0;


# instance fields
.field a:Lcom/xiaomi/push/service/XMPushService;

.field b:Ll/u1r0;

.field private c:I

.field private d:Ljava/lang/Exception;

.field private e:Ljava/lang/String;

.field private f:J

.field private g:J

.field private h:J

.field private i:J

.field private j:J

.field private k:J


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/xiaomi/push/f;->f:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/xiaomi/push/f;->g:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/xiaomi/push/f;->h:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/xiaomi/push/f;->i:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/xiaomi/push/f;->j:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/xiaomi/push/f;->k:J

    .line 17
    .line 18
    iput-object p1, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 19
    .line 20
    const-string p1, ""

    .line 21
    .line 22
    iput-object p1, p0, Lcom/xiaomi/push/f;->e:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/xiaomi/push/f;->c()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    :try_start_0
    invoke-static {p1}, Landroid/net/TrafficStats;->getUidRxBytes(I)J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    iput-wide v0, p0, Lcom/xiaomi/push/f;->k:J

    .line 36
    .line 37
    invoke-static {p1}, Landroid/net/TrafficStats;->getUidTxBytes(I)J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    iput-wide v0, p0, Lcom/xiaomi/push/f;->j:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p1

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v1, "Failed to obtain traffic data during initialization: "

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const-wide/16 v0, -0x1

    .line 63
    .line 64
    iput-wide v0, p0, Lcom/xiaomi/push/f;->k:J

    .line 65
    .line 66
    iput-wide v0, p0, Lcom/xiaomi/push/f;->j:J

    .line 67
    .line 68
    return-void
.end method

.method private c()V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/xiaomi/push/f;->g:J

    .line 4
    .line 5
    iput-wide v0, p0, Lcom/xiaomi/push/f;->i:J

    .line 6
    .line 7
    iput-wide v0, p0, Lcom/xiaomi/push/f;->f:J

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/xiaomi/push/f;->h:J

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-object v2, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 16
    .line 17
    invoke-static {v2}, Ll/mtq0;->t(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/xiaomi/push/f;->f:J

    .line 24
    .line 25
    :cond_0
    iget-object v2, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/xiaomi/push/service/XMPushService;->c()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iput-wide v0, p0, Lcom/xiaomi/push/f;->h:J

    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method private declared-synchronized d()V
    .locals 5

    .line 1
    const-string v0, "stat connpt = "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/xiaomi/push/f;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, " netDuration = "

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-wide v2, p0, Lcom/xiaomi/push/f;->g:J

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, " ChannelDuration = "

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-wide v2, p0, Lcom/xiaomi/push/f;->i:J

    .line 30
    .line 31
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v0, " channelConnectedTime = "

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-wide v2, p0, Lcom/xiaomi/push/f;->h:J

    .line 40
    .line 41
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Lcom/xiaomi/push/ej;

    .line 52
    .line 53
    invoke-direct {v0}, Lcom/xiaomi/push/ej;-><init>()V

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    iput-byte v1, v0, Lcom/xiaomi/push/ej;->a:B

    .line 58
    .line 59
    sget-object v1, Lcom/xiaomi/push/ei;->h:Lcom/xiaomi/push/ei;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/xiaomi/push/ei;->a()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/xiaomi/push/f;->e:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->a(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 74
    .line 75
    .line 76
    move-result-wide v1

    .line 77
    const-wide/16 v3, 0x3e8

    .line 78
    .line 79
    div-long/2addr v1, v3

    .line 80
    long-to-int v1, v1

    .line 81
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->d(I)Lcom/xiaomi/push/ej;

    .line 82
    .line 83
    .line 84
    iget-wide v1, p0, Lcom/xiaomi/push/f;->g:J

    .line 85
    .line 86
    div-long/2addr v1, v3

    .line 87
    long-to-int v1, v1

    .line 88
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->b(I)Lcom/xiaomi/push/ej;

    .line 89
    .line 90
    .line 91
    iget-wide v1, p0, Lcom/xiaomi/push/f;->i:J

    .line 92
    .line 93
    div-long/2addr v1, v3

    .line 94
    long-to-int v1, v1

    .line 95
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->c(I)Lcom/xiaomi/push/ej;

    .line 96
    .line 97
    .line 98
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v1, v0}, Lcom/xiaomi/push/h;->i(Lcom/xiaomi/push/ej;)V

    .line 103
    .line 104
    .line 105
    invoke-direct {p0}, Lcom/xiaomi/push/f;->c()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    .line 107
    .line 108
    monitor-exit p0

    .line 109
    return-void

    .line 110
    :catchall_0
    move-exception v0

    .line 111
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    throw v0
.end method


# virtual methods
.method public a()Ljava/lang/Exception;
    .locals 0

    .line 139
    iget-object p0, p0, Lcom/xiaomi/push/f;->d:Ljava/lang/Exception;

    return-object p0
.end method

.method public a(Ll/u1r0;)V
    .locals 2

    const/4 v0, 0x0

    .line 134
    iput v0, p0, Lcom/xiaomi/push/f;->c:I

    const/4 v1, 0x0

    .line 135
    iput-object v1, p0, Lcom/xiaomi/push/f;->d:Ljava/lang/Exception;

    .line 136
    iput-object p1, p0, Lcom/xiaomi/push/f;->b:Ll/u1r0;

    .line 137
    iget-object p1, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {p1}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/push/f;->e:Ljava/lang/String;

    .line 138
    sget-object p0, Lcom/xiaomi/push/ei;->v:Lcom/xiaomi/push/ei;

    invoke-virtual {p0}, Lcom/xiaomi/push/ei;->a()I

    move-result p0

    invoke-static {v0, p0}, Lcom/xiaomi/push/i;->c(II)V

    return-void
.end method

.method public a(Ll/u1r0;ILjava/lang/Exception;)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/xiaomi/push/f;->c:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/xiaomi/push/f;->d:Ljava/lang/Exception;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput p2, p0, Lcom/xiaomi/push/f;->c:I

    .line 10
    .line 11
    iput-object p3, p0, Lcom/xiaomi/push/f;->d:Ljava/lang/Exception;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/u1r0;->c()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0, p3}, Lcom/xiaomi/push/i;->k(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/16 p3, 0x16

    .line 21
    .line 22
    if-ne p2, p3, :cond_2

    .line 23
    .line 24
    iget-wide p2, p0, Lcom/xiaomi/push/f;->h:J

    .line 25
    .line 26
    const-wide/16 v0, 0x0

    .line 27
    .line 28
    cmp-long p2, p2, v0

    .line 29
    .line 30
    if-eqz p2, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/u1r0;->b()J

    .line 33
    .line 34
    .line 35
    move-result-wide p1

    .line 36
    iget-wide v2, p0, Lcom/xiaomi/push/f;->h:J

    .line 37
    .line 38
    sub-long/2addr p1, v2

    .line 39
    cmp-long p3, p1, v0

    .line 40
    .line 41
    if-gez p3, :cond_1

    .line 42
    .line 43
    move-wide p1, v0

    .line 44
    :cond_1
    invoke-static {}, Ll/a2r0;->f()I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    div-int/lit8 p3, p3, 0x2

    .line 49
    .line 50
    int-to-long v2, p3

    .line 51
    add-long/2addr p1, v2

    .line 52
    iget-wide v2, p0, Lcom/xiaomi/push/f;->i:J

    .line 53
    .line 54
    add-long/2addr v2, p1

    .line 55
    iput-wide v2, p0, Lcom/xiaomi/push/f;->i:J

    .line 56
    .line 57
    iput-wide v0, p0, Lcom/xiaomi/push/f;->h:J

    .line 58
    .line 59
    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/f;->b()V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    :try_start_0
    invoke-static {p1}, Landroid/net/TrafficStats;->getUidRxBytes(I)J

    .line 67
    .line 68
    .line 69
    move-result-wide p2

    .line 70
    invoke-static {p1}, Landroid/net/TrafficStats;->getUidTxBytes(I)J

    .line 71
    .line 72
    .line 73
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    goto :goto_0

    .line 75
    :catch_0
    move-exception p1

    .line 76
    new-instance p2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string p3, "Failed to obtain traffic data: "

    .line 79
    .line 80
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const-wide/16 p2, -0x1

    .line 94
    .line 95
    move-wide v0, p2

    .line 96
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v2, "Stats rx="

    .line 99
    .line 100
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-wide v2, p0, Lcom/xiaomi/push/f;->k:J

    .line 104
    .line 105
    sub-long v2, p2, v2

    .line 106
    .line 107
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v2, ", tx="

    .line 111
    .line 112
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget-wide v2, p0, Lcom/xiaomi/push/f;->j:J

    .line 116
    .line 117
    sub-long v2, v0, v2

    .line 118
    .line 119
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-static {p1}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iput-wide p2, p0, Lcom/xiaomi/push/f;->k:J

    .line 130
    .line 131
    iput-wide v0, p0, Lcom/xiaomi/push/f;->j:J

    .line 132
    .line 133
    return-void
.end method

.method public a(Ll/u1r0;Ljava/lang/Exception;)V
    .locals 3

    .line 140
    iget-object p2, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    invoke-static {p2}, Ll/mtq0;->v(Landroid/content/Context;)Z

    move-result p2

    .line 141
    sget-object v0, Lcom/xiaomi/push/ei;->d:Lcom/xiaomi/push/ei;

    invoke-virtual {v0}, Lcom/xiaomi/push/ei;->a()I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p1}, Ll/u1r0;->c()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-static {v2, v0, v1, p1, p2}, Lcom/xiaomi/push/i;->d(IIILjava/lang/String;I)V

    .line 142
    invoke-virtual {p0}, Lcom/xiaomi/push/f;->b()V

    return-void
.end method

.method public declared-synchronized b()V
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    invoke-static {v0}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 13
    .line 14
    invoke-static {v1}, Ll/mtq0;->v(Landroid/content/Context;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    iget-wide v4, p0, Lcom/xiaomi/push/f;->f:J

    .line 23
    .line 24
    const-wide/16 v6, 0x0

    .line 25
    .line 26
    cmp-long v8, v4, v6

    .line 27
    .line 28
    if-lez v8, :cond_1

    .line 29
    .line 30
    iget-wide v8, p0, Lcom/xiaomi/push/f;->g:J

    .line 31
    .line 32
    sub-long v4, v2, v4

    .line 33
    .line 34
    add-long/2addr v8, v4

    .line 35
    iput-wide v8, p0, Lcom/xiaomi/push/f;->g:J

    .line 36
    .line 37
    iput-wide v6, p0, Lcom/xiaomi/push/f;->f:J

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    iget-wide v4, p0, Lcom/xiaomi/push/f;->h:J

    .line 43
    .line 44
    cmp-long v8, v4, v6

    .line 45
    .line 46
    if-eqz v8, :cond_2

    .line 47
    .line 48
    iget-wide v8, p0, Lcom/xiaomi/push/f;->i:J

    .line 49
    .line 50
    sub-long v4, v2, v4

    .line 51
    .line 52
    add-long/2addr v8, v4

    .line 53
    iput-wide v8, p0, Lcom/xiaomi/push/f;->i:J

    .line 54
    .line 55
    iput-wide v6, p0, Lcom/xiaomi/push/f;->h:J

    .line 56
    .line 57
    :cond_2
    if-eqz v1, :cond_7

    .line 58
    .line 59
    iget-object v1, p0, Lcom/xiaomi/push/f;->e:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_3

    .line 66
    .line 67
    iget-wide v4, p0, Lcom/xiaomi/push/f;->g:J

    .line 68
    .line 69
    const-wide/16 v8, 0x7530

    .line 70
    .line 71
    cmp-long v1, v4, v8

    .line 72
    .line 73
    if-gtz v1, :cond_4

    .line 74
    .line 75
    :cond_3
    iget-wide v4, p0, Lcom/xiaomi/push/f;->g:J

    .line 76
    .line 77
    const-wide/32 v8, 0x5265c0

    .line 78
    .line 79
    .line 80
    cmp-long v1, v4, v8

    .line 81
    .line 82
    if-lez v1, :cond_5

    .line 83
    .line 84
    :cond_4
    invoke-direct {p0}, Lcom/xiaomi/push/f;->d()V

    .line 85
    .line 86
    .line 87
    :cond_5
    iput-object v0, p0, Lcom/xiaomi/push/f;->e:Ljava/lang/String;

    .line 88
    .line 89
    iget-wide v0, p0, Lcom/xiaomi/push/f;->f:J

    .line 90
    .line 91
    cmp-long v0, v0, v6

    .line 92
    .line 93
    if-nez v0, :cond_6

    .line 94
    .line 95
    iput-wide v2, p0, Lcom/xiaomi/push/f;->f:J

    .line 96
    .line 97
    :cond_6
    iget-object v0, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/xiaomi/push/service/XMPushService;->c()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_7

    .line 104
    .line 105
    iput-wide v2, p0, Lcom/xiaomi/push/f;->h:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    .line 107
    :cond_7
    monitor-exit p0

    .line 108
    return-void

    .line 109
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 110
    throw v0
.end method

.method public b(Ll/u1r0;)V
    .locals 2

    .line 111
    invoke-virtual {p0}, Lcom/xiaomi/push/f;->b()V

    .line 112
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/f;->h:J

    .line 113
    sget-object p0, Lcom/xiaomi/push/ei;->v:Lcom/xiaomi/push/ei;

    invoke-virtual {p0}, Lcom/xiaomi/push/ei;->a()I

    move-result p0

    invoke-virtual {p1}, Ll/u1r0;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ll/u1r0;->a()I

    move-result p1

    const/4 v1, 0x0

    invoke-static {v1, p0, v0, p1}, Lcom/xiaomi/push/i;->e(IILjava/lang/String;I)V

    return-void
.end method
