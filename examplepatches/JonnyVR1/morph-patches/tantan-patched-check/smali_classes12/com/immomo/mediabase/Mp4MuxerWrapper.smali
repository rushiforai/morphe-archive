.class public Lcom/immomo/mediabase/Mp4MuxerWrapper;
.super Lcom/immomo/mediabase/MuxerBase;
.source "SourceFile"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mAudioTrackIndex:I

.field private mIsRunning:Z

.field private mMediaMuxer:Landroid/media/MediaMuxer;

.field private mMuxerLock:Ljava/lang/Object;

.field private mVideoTrackIndex:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediabase/MuxerBase;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Mp4MuxerWrapper"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mAudioTrackIndex:I

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mVideoTrackIndex:I

    .line 12
    .line 13
    new-instance v0, Ljava/lang/Object;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-boolean v1, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mIsRunning:Z

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    if-lt p2, v2, :cond_0

    .line 30
    .line 31
    const/4 v2, 0x3

    .line 32
    if-gt p2, v2, :cond_0

    .line 33
    .line 34
    new-instance v0, Landroid/media/MediaMuxer;

    .line 35
    .line 36
    invoke-direct {v0, p1, v1}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 40
    .line 41
    iput p2, p0, Lcom/immomo/mediabase/MuxerBase;->mMediaTrackInfo:I

    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const-string p0, "Invalid file path or media track info"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw v0
.end method

.method private getCurStringInfo()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/MuxerBase;->mAddedMediaTrack:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const-string p0, "audio"

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 v0, 0x2

    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    const-string p0, "video"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "audio/video"

    .line 16
    .line 17
    return-object p0
.end method


# virtual methods
.method public addMediaTrack(Landroid/media/MediaFormat;I)I
    .locals 4

    .line 1
    const-string v0, "Add track info "

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-lt p2, v2, :cond_2

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-le p2, v2, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    iget-object v2, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 14
    .line 15
    monitor-enter v2

    .line 16
    :try_start_0
    iget-object v3, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {v3, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget p1, p0, Lcom/immomo/mediabase/MuxerBase;->mAddedMediaTrack:I

    .line 25
    .line 26
    or-int/2addr p1, p2

    .line 27
    iput p1, p0, Lcom/immomo/mediabase/MuxerBase;->mAddedMediaTrack:I

    .line 28
    .line 29
    const-string p1, "Mp4MuxerWrapper"

    .line 30
    .line 31
    new-instance p2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Lcom/immomo/mediabase/Mp4MuxerWrapper;->getCurStringInfo()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p1, p0}, Lcom/immomo/mediabase/Log4Cam;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    :goto_0
    monitor-exit v2

    .line 54
    return v1

    .line 55
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0

    .line 57
    :cond_2
    :goto_2
    const-string p0, "Mp4MuxerWrapper"

    .line 58
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v2, "Add media track error ! Invalid parameter ! format="

    .line 62
    .line 63
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p1, " and track="

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p0, p1}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    return v1
.end method

.method public getAudiotrackIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mAudioTrackIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoTrackIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mVideoTrackIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public isStarting()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mIsRunning:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAudioInfo(Ljava/lang/String;IIIII)V
    .locals 0

    .line 1
    new-instance p1, Landroid/media/MediaFormat;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/media/MediaFormat;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p4, "mime"

    .line 7
    .line 8
    const-string p6, "audio/mp4a-latm"

    .line 9
    .line 10
    invoke-virtual {p1, p4, p6}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string p4, "bitrate"

    .line 14
    .line 15
    invoke-virtual {p1, p4, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    const-string p4, "channel-count"

    .line 19
    .line 20
    invoke-virtual {p1, p4, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    const-string p3, "sample-rate"

    .line 24
    .line 25
    invoke-virtual {p1, p3, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const-string p2, "aac-profile"

    .line 29
    .line 30
    const/4 p3, 0x2

    .line 31
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediabase/Mp4MuxerWrapper;->addMediaTrack(Landroid/media/MediaFormat;I)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mAudioTrackIndex:I

    .line 40
    .line 41
    return-void
.end method

.method public setVideoInfo(IIII)V
    .locals 1

    .line 1
    const-string v0, "video/avc"

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string p2, "bitrate"

    .line 8
    .line 9
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    const-string p2, "frame-rate"

    .line 13
    .line 14
    invoke-virtual {p1, p2, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    const-string p2, "i-frame-interval"

    .line 18
    .line 19
    const/4 p3, 0x1

    .line 20
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    const/4 p2, 0x2

    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediabase/Mp4MuxerWrapper;->addMediaTrack(Landroid/media/MediaFormat;I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mVideoTrackIndex:I

    .line 29
    .line 30
    return-void
.end method

.method public setVideoOrientation(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startMuxing()V
    .locals 5

    .line 1
    const-string v0, "Meida info not enough , need waitting, already have "

    .line 2
    .line 3
    const-string v1, "Start Media muxing !!"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-boolean v3, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mIsRunning:Z

    .line 9
    .line 10
    if-nez v3, :cond_2

    .line 11
    .line 12
    iget v3, p0, Lcom/immomo/mediabase/MuxerBase;->mMediaTrackInfo:I

    .line 13
    .line 14
    iget v4, p0, Lcom/immomo/mediabase/MuxerBase;->mAddedMediaTrack:I

    .line 15
    .line 16
    if-eq v3, v4, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->start()V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mIsRunning:Z

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_2

    .line 32
    :cond_1
    :goto_0
    const-string v0, "Mp4MuxerWrapper"

    .line 33
    .line 34
    new-instance v3, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/immomo/mediabase/Mp4MuxerWrapper;->getCurStringInfo()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {v0, p0}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    monitor-exit v2

    .line 54
    return-void

    .line 55
    :cond_2
    :goto_1
    const-string v1, "Mp4MuxerWrapper"

    .line 56
    .line 57
    new-instance v3, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0}, Lcom/immomo/mediabase/Mp4MuxerWrapper;->getCurStringInfo()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {v1, p0}, Lcom/immomo/mediabase/Log4Cam;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    monitor-exit v2

    .line 77
    return-void

    .line 78
    :goto_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw p0
.end method

.method public stopMuxing()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-boolean v2, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mIsRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    :try_start_1
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->stop()V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :catch_0
    move-exception v1

    .line 24
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    :goto_0
    const/4 v1, 0x0

    .line 28
    iput-object v1, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mIsRunning:Z

    .line 32
    .line 33
    :cond_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    const-string v0, "Mp4MuxerWrapper"

    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v2, "Stop media muxing !"

    .line 39
    .line 40
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget p0, p0, Lcom/immomo/mediabase/MuxerBase;->mMediaTrackInfo:I

    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v0, p0}, Lcom/immomo/mediabase/Log4Cam;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    throw p0
.end method

.method public writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 4

    .line 1
    const-string v0, "Media muxer not started !!, already have media type:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz p2, :cond_3

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    :try_start_0
    iget-boolean v3, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mIsRunning:Z

    .line 13
    .line 14
    if-nez v3, :cond_1

    .line 15
    .line 16
    const-string p1, "Mp4MuxerWrapper"

    .line 17
    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/immomo/mediabase/Mp4MuxerWrapper;->getCurStringInfo()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p1, p0}, Lcom/immomo/mediabase/Log4Cam;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    monitor-exit v1

    .line 38
    return v2

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object p0, p0, Lcom/immomo/mediabase/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2, p3}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    monitor-exit v1

    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_3
    :goto_0
    const-string p0, "Mp4MuxerWrapper"

    .line 52
    .line 53
    const-string p1, "[writeSampleData] Invalid Parameter !! ByteBuffer or BufferInfo is null"

    .line 54
    .line 55
    invoke-static {p0, p1}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    monitor-exit v1

    .line 59
    return v2

    .line 60
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    throw p0
.end method
