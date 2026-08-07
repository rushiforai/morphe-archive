.class public Lcom/momo/xengine/media/Mp4MuxerWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MEDIA_TRACK_AUDIO:I = 0x1

.field public static final MEDIA_TRACK_AV:I = 0x3

.field public static final MEDIA_TRACK_VIDEO:I = 0x2


# instance fields
.field private final TAG:Ljava/lang/String;

.field protected mAddedMediaTrack:I

.field private mAudioTrackIndex:I

.field private mIsRunning:Z

.field private mMediaMuxer:Landroid/media/MediaMuxer;

.field protected mMediaTrackInfo:I

.field private mMuxerLock:Ljava/lang/Object;

.field private mVideoTrackIndex:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Mp4MuxerWrapper"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mAudioTrackIndex:I

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mVideoTrackIndex:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mAddedMediaTrack:I

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    iput v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaTrackInfo:I

    .line 18
    .line 19
    new-instance v2, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    iput-object v2, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mIsRunning:Z

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-lt p2, v3, :cond_0

    .line 35
    .line 36
    if-gt p2, v1, :cond_0

    .line 37
    .line 38
    new-instance v1, Landroid/media/MediaMuxer;

    .line 39
    .line 40
    invoke-direct {v1, p1, v0}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 44
    .line 45
    iput p2, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaTrackInfo:I

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    const-string p0, "Invalid file path or media track info"

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw v2
.end method

.method private getCurStringInfo()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mAddedMediaTrack:I

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
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-lt p2, v1, :cond_2

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-le p2, v1, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v1

    .line 14
    :try_start_0
    iget-object v2, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 15
    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-virtual {v2, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget p1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mAddedMediaTrack:I

    .line 23
    .line 24
    or-int/2addr p1, p2

    .line 25
    iput p1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mAddedMediaTrack:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    monitor-exit v1

    .line 31
    return v0

    .line 32
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0

    .line 34
    :cond_2
    :goto_2
    return v0
.end method

.method public isStarting()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mIsRunning:Z

    .line 2
    .line 3
    return p0
.end method

.method public setVideoOrientation(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mIsRunning:Z

    .line 5
    .line 6
    if-nez v1, :cond_2

    .line 7
    .line 8
    iget v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaTrackInfo:I

    .line 9
    .line 10
    iget v2, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mAddedMediaTrack:I

    .line 11
    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->start()V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    iput-boolean v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mIsRunning:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_2

    .line 28
    :cond_1
    :goto_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :cond_2
    :goto_1
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public stopMuxing()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-boolean v2, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mIsRunning:Z
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
    iget-object v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

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
    iput-object v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mIsRunning:Z

    .line 32
    .line 33
    :cond_0
    monitor-exit v0

    .line 34
    return-void

    .line 35
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    throw p0
.end method

.method public writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMuxerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    iget-boolean v2, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mIsRunning:Z

    .line 11
    .line 12
    if-nez v2, :cond_1

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return v1

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    iget-object p0, p0, Lcom/momo/xengine/media/Mp4MuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 19
    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2, p3}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    monitor-exit v0

    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_3
    :goto_0
    monitor-exit v0

    .line 29
    return v1

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method
