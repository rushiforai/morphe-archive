.class Ltv/danmaku/ijk/media/sink/AgoraWriter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/coninf/MRtcEventHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/sink/AgoraWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/sink/AgoraWriter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAudioMixingFinished()V
    .locals 3

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-interface {v0, p0, v1, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onConnectionLost()V
    .locals 4

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "onConnectionLost"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 9
    .line 10
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/16 v1, -0x130

    .line 15
    .line 16
    const/16 v2, 0xa

    .line 17
    .line 18
    const/16 v3, 0x12c

    .line 19
    .line 20
    invoke-virtual {v0, v3, v1, v2, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onError(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onError"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AgoraWriter"

    .line 16
    .line 17
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    const/16 v0, 0x11

    .line 21
    .line 22
    if-eq p1, v0, :cond_1

    .line 23
    .line 24
    const/16 v0, 0x12

    .line 25
    .line 26
    if-eq p1, v0, :cond_1

    .line 27
    .line 28
    const/16 v0, 0x643

    .line 29
    .line 30
    if-eq p1, v0, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    if-eq p1, v0, :cond_1

    .line 34
    .line 35
    const/16 v0, 0x6d

    .line 36
    .line 37
    if-eq p1, v0, :cond_1

    .line 38
    .line 39
    const/16 v0, 0x6e

    .line 40
    .line 41
    if-eq p1, v0, :cond_1

    .line 42
    .line 43
    const/16 v0, 0x6a

    .line 44
    .line 45
    if-ne p1, v0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 54
    .line 55
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->q(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Landroid/os/Handler;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;

    .line 60
    .line 61
    invoke-direct {v1, p0, p1}, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;-><init>(Ltv/danmaku/ijk/media/sink/AgoraWriter$1;I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 65
    .line 66
    .line 67
    :cond_1
    :goto_0
    return-void
.end method

.method public onFirstRemoteVideoDecoded(JIII)V
    .locals 1

    .line 1
    new-instance p5, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onFirstRemoteVideoDecoded texture: "

    .line 4
    .line 5
    invoke-direct {p5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, ";width:"

    .line 12
    .line 13
    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, ";height"

    .line 20
    .line 21
    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p5, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p5

    .line 31
    const-string v0, "AgoraWriter"

    .line 32
    .line 33
    invoke-static {v0, p5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 37
    .line 38
    invoke-static {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a(Ltv/danmaku/ijk/media/sink/AgoraWriter;JII)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onJoinChannelSuccess(Ljava/lang/String;JI)V
    .locals 2

    .line 1
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 2
    .line 3
    invoke-static {p1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    monitor-enter p1

    .line 8
    :try_start_0
    iget-object p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 9
    .line 10
    invoke-static {p4}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 11
    .line 12
    .line 13
    move-result-object p4

    .line 14
    const/16 v0, 0x64

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p4, v0, v1, v1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 21
    .line 22
    invoke-static {p4}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->l(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lio/agora/rtc2/RtcEngine;

    .line 23
    .line 24
    .line 25
    move-result-object p4

    .line 26
    if-nez p4, :cond_0

    .line 27
    .line 28
    monitor-exit p1

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 33
    .line 34
    invoke-static {p4}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    if-nez p4, :cond_1

    .line 39
    .line 40
    iget-object p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 41
    .line 42
    invoke-static {p4}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z

    .line 43
    .line 44
    .line 45
    move-result p4

    .line 46
    if-eqz p4, :cond_2

    .line 47
    .line 48
    :cond_1
    iget-object p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 49
    .line 50
    invoke-virtual {p4}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    cmp-long p4, v0, p2

    .line 55
    .line 56
    if-eqz p4, :cond_2

    .line 57
    .line 58
    iget-object p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 59
    .line 60
    invoke-static {p4}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->q(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Landroid/os/Handler;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    new-instance v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;

    .line 65
    .line 66
    invoke-direct {v0, p0, p2, p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;-><init>(Ltv/danmaku/ijk/media/sink/AgoraWriter$1;J)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p4, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 70
    .line 71
    .line 72
    :cond_2
    monitor-exit p1

    .line 73
    return-void

    .line 74
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    throw p0
.end method

.method public onJoinChannelfail(Ljava/lang/String;JI)V
    .locals 0

    return-void
.end method

.method public onUserMuteAudio(IZ)V
    .locals 0

    return-void
.end method

.method public onUserMuteVideo(IZ)V
    .locals 0

    return-void
.end method

.method public onUserOffline(JI)V
    .locals 7

    .line 1
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 2
    .line 3
    invoke-static {p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->r(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 10
    .line 11
    invoke-static {p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->r(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-eqz p3, :cond_1

    .line 24
    .line 25
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 26
    .line 27
    invoke-static {p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->r(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    check-cast p3, Ltv/danmaku/ijk/media/util/helpSurface;

    .line 40
    .line 41
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 42
    .line 43
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->r(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/util/Map;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 55
    .line 56
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/sink/CongressUtil;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 63
    .line 64
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/sink/CongressUtil;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-virtual {v0, p1, p2, v1}, Lcom/immomo/mediacore/sink/CongressUtil;->setVideoSurface(JLandroid/view/Surface;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    invoke-virtual {p3}, Ltv/danmaku/ijk/media/util/helpSurface;->g()V

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 76
    .line 77
    invoke-static {p3, p1, p2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->d(Ltv/danmaku/ijk/media/sink/AgoraWriter;J)J

    .line 78
    .line 79
    .line 80
    move-result-wide v1

    .line 81
    const-wide/16 v3, -0x1

    .line 82
    .line 83
    cmp-long p3, v1, v3

    .line 84
    .line 85
    if-eqz p3, :cond_2

    .line 86
    .line 87
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 88
    .line 89
    invoke-static {p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->e(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    if-eqz p3, :cond_2

    .line 94
    .line 95
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 96
    .line 97
    invoke-static {p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    const/4 v0, 0x1

    .line 102
    invoke-virtual {p3, v1, v2, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1(JZ)V

    .line 103
    .line 104
    .line 105
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 106
    .line 107
    invoke-static {p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const/4 v5, 0x0

    .line 112
    const/4 v6, 0x5

    .line 113
    const/4 v3, 0x0

    .line 114
    const/4 v4, 0x0

    .line 115
    invoke-virtual/range {v0 .. v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L1(JIIII)V

    .line 116
    .line 117
    .line 118
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 119
    .line 120
    invoke-static {p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const/4 v5, 0x0

    .line 125
    const/4 v3, 0x0

    .line 126
    invoke-virtual/range {v0 .. v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n2(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V

    .line 127
    .line 128
    .line 129
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 130
    .line 131
    invoke-static {p3}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->f(Ltv/danmaku/ijk/media/sink/AgoraWriter;)[Z

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    long-to-int v0, v1

    .line 136
    const/4 v1, 0x0

    .line 137
    aput-boolean v1, p3, v0

    .line 138
    .line 139
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 140
    .line 141
    invoke-static {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/util/HashMap;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    :cond_2
    return-void
.end method

.method public onWarning(I)V
    .locals 2

    .line 1
    const/16 v0, 0x2bd

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 6
    .line 7
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-interface {p1, p0, v0, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
