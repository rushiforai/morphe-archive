.class public Lcom/momo/xeengine/widget/MediaPlayerImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/widget/IVideoPlayer;
.implements Landroid/media/MediaPlayer$OnInfoListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private errorMessage:Ljava/lang/String;

.field private firstFrameLatch:Ljava/util/concurrent/CountDownLatch;

.field private hasError:Z

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field private mute:Z

.field private videoPath:Ljava/lang/String;

.field private videoRenderingStart:Z

.field private volume:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoRenderingStart:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->hasError:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mute:Z

    .line 10
    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->volume:F

    .line 14
    .line 15
    new-instance v0, Landroid/media/MediaPlayer;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public getCurrentPosition()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getDuration()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->errorMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getVideoHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getVideoWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->hasError:Z

    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "what="

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p2, ", extra="

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->errorMessage:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->firstFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    :try_start_0
    iput-boolean p1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoRenderingStart:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->firstFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    :catchall_0
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public pause()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :catch_0
    :cond_0
    return v1
.end method

.method public prepare()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoRenderingStart:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->hasError:Z

    .line 5
    .line 6
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->firstFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->prepare()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public quickStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->start()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoRenderingStart:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->hasError:Z

    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->firstFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoPath:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public resume()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :catch_0
    :cond_0
    return v1
.end method

.method public seekTo(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMute(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->volume:F

    .line 13
    .line 14
    invoke-virtual {v0, v1, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 15
    .line 16
    .line 17
    :goto_0
    iput-boolean p1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mute:Z

    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setVideo(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoPath:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 4
    .line 5
    new-instance v0, Lcom/momo/xeengine/widget/XUIMediaSource;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/momo/xeengine/widget/XUIMediaSource;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/media/MediaPlayer;->setDataSource(Landroid/media/MediaDataSource;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setVolume(F)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->volume:F

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mute:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public start()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget-boolean v2, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoRenderingStart:Z

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->start()V

    .line 17
    .line 18
    .line 19
    return v3

    .line 20
    :cond_0
    :try_start_0
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 21
    .line 22
    .line 23
    iput-boolean v1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoRenderingStart:Z

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->hasError:Z

    .line 26
    .line 27
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 28
    .line 29
    invoke-direct {v0, v3}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->firstFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->firstFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 40
    .line 41
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 42
    .line 43
    const-wide/16 v4, 0x3e8

    .line 44
    .line 45
    invoke-virtual {v0, v4, v5, v2}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->firstFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 50
    .line 51
    iget-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->videoRenderingStart:Z

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->hasError:Z

    .line 56
    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    move-exception v0

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    move v3, v1

    .line 71
    :goto_0
    if-nez v3, :cond_2

    .line 72
    .line 73
    iget-boolean v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->hasError:Z

    .line 74
    .line 75
    if-nez v0, :cond_2

    .line 76
    .line 77
    const-string v0, "MediaPlayer start timeout"

    .line 78
    .line 79
    iput-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->errorMessage:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    :cond_2
    return v3

    .line 82
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->errorMessage:Ljava/lang/String;

    .line 94
    .line 95
    :cond_3
    return v1
.end method

.method public stop()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/xeengine/widget/MediaPlayerImpl;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :catch_0
    :cond_1
    return v1
.end method
