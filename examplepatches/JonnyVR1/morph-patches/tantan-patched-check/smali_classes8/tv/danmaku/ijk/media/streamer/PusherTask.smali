.class public Ltv/danmaku/ijk/media/streamer/PusherTask;
.super Lcom/immomo/mediacore/sink/IjkWriter;
.source "SourceFile"


# instance fields
.field private duration:J


# direct methods
.method public constructor <init>(Lcom/immomo/mediacore/strinf/NotifyCenter;ZJ)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediacore/sink/IjkWriter;-><init>(Lcom/immomo/mediacore/strinf/NotifyCenter;Z)V

    .line 2
    .line 3
    .line 4
    const-wide/16 p1, 0x2710

    .line 5
    .line 6
    cmp-long v0, p3, p1

    .line 7
    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    move-wide p3, p1

    .line 11
    :cond_0
    iput-wide p3, p0, Ltv/danmaku/ijk/media/streamer/PusherTask;->duration:J

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public prepare()Z
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    :try_start_0
    invoke-virtual {p0, v2}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 8
    .line 9
    .line 10
    const-string v4, "lqdebug"

    .line 11
    .line 12
    const-string v5, "pusher task prepare:"

    .line 13
    .line 14
    invoke-static {v4, v5}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    iget-object v4, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mFPreparedSyncObject:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1

    .line 20
    :try_start_1
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->_prepare()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    :try_start_2
    iget-object v5, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mFPreparedSyncObject:Ljava/lang/Object;

    .line 24
    .line 25
    iget-wide v6, p0, Ltv/danmaku/ijk/media/streamer/PusherTask;->duration:J

    .line 26
    .line 27
    invoke-virtual {v5, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v5

    .line 32
    goto :goto_1

    .line 33
    :catch_0
    :goto_0
    :try_start_3
    monitor-exit v4

    .line 34
    move v4, v3

    .line 35
    goto :goto_5

    .line 36
    :goto_1
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 37
    :try_start_4
    throw v5
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Error; {:try_start_4 .. :try_end_4} :catch_1

    .line 38
    :catch_1
    move-exception v4

    .line 39
    goto :goto_2

    .line 40
    :catch_2
    move-exception v4

    .line 41
    goto :goto_4

    .line 42
    :goto_2
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    :goto_3
    move v4, v2

    .line 46
    goto :goto_5

    .line 47
    :goto_4
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 48
    .line 49
    .line 50
    goto :goto_3

    .line 51
    :goto_5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getLastError()Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-virtual {v5, v3, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_0

    .line 60
    .line 61
    return v2

    .line 62
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 63
    .line 64
    .line 65
    move-result-wide v5

    .line 66
    sub-long/2addr v5, v0

    .line 67
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/PusherTask;->duration:J

    .line 68
    .line 69
    cmp-long v0, v5, v0

    .line 70
    .line 71
    if-ltz v0, :cond_1

    .line 72
    .line 73
    goto :goto_6

    .line 74
    :cond_1
    move v2, v4

    .line 75
    :goto_6
    if-eqz v2, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/IjkWriter;->getServerIpAddr()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    :cond_2
    return v2
.end method
