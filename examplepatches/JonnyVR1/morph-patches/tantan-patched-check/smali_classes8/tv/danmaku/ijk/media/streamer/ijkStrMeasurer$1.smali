.class Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 5
    .line 6
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->o(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    monitor-enter p1

    .line 11
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 12
    .line 13
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 20
    .line 21
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getRtmpSendSize()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    long-to-int v0, v0

    .line 30
    int-to-long v0, v0

    .line 31
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 32
    .line 33
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->d(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    sub-long v2, v0, v2

    .line 38
    .line 39
    long-to-int v2, v2

    .line 40
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 41
    .line 42
    invoke-static {v3, v0, v1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->e(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;J)J

    .line 43
    .line 44
    .line 45
    mul-int/lit8 v2, v2, 0x8

    .line 46
    .line 47
    int-to-float v0, v2

    .line 48
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 49
    .line 50
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->l(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    long-to-float v1, v1

    .line 55
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 56
    .line 57
    div-float/2addr v1, v2

    .line 58
    div-float/2addr v0, v1

    .line 59
    float-to-int v0, v0

    .line 60
    div-int/lit16 v0, v0, 0x3e8

    .line 61
    .line 62
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->r(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto :goto_1

    .line 70
    :cond_0
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 72
    .line 73
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->f(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-lez p1, :cond_1

    .line 78
    .line 79
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$1;->a:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 80
    .line 81
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->l(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    const/4 p1, 0x1

    .line 86
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void

    .line 90
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    throw p0
.end method
