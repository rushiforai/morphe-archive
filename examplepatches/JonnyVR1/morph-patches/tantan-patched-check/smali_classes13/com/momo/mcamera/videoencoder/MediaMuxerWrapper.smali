.class public Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DEBUG:Z = false

.field private static final DIR_NAME:Ljava/lang/String; = "AVRecSample"

.field private static final TAG:Ljava/lang/String; = "MediaMuxerWrapper"

.field private static final mDateTimeFormat:Ljava/text/SimpleDateFormat;


# instance fields
.field private mAudioEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

.field private mEncoderCount:I

.field private mIsStarted:Z

.field private final mMediaMuxer:Landroid/media/MediaMuxer;

.field private mOutputPath:Ljava/lang/String;

.field private mStatredCount:I

.field private mVideoEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyy-MM-dd-HH-mm-ss"

    .line 4
    .line 5
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mDateTimeFormat:Ljava/text/SimpleDateFormat;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

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
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mOutputPath:Ljava/lang/String;

    .line 5
    .line 6
    new-instance p1, Landroid/media/MediaMuxer;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mOutputPath:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {p1, v0, v1}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 15
    .line 16
    iput v1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mStatredCount:I

    .line 17
    .line 18
    iput v1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mEncoderCount:I

    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mIsStarted:Z

    .line 21
    .line 22
    return-void
.end method

.method public static final getCaptureFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "AVRecSample"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    new-instance p0, Ljava/io/File;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->getDateTimeString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_0
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method private static final getDateTimeString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/GregorianCalendar;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mDateTimeFormat:Ljava/text/SimpleDateFormat;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method


# virtual methods
.method public addEncoder(Lcom/momo/mcamera/videoencoder/MediaEncoder;)V
    .locals 2

    .line 1
    const-string v0, "mediaMuxer"

    .line 2
    .line 3
    const-string v1, "MediaMuxerWrapper addEncoder"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    move p1, v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    :goto_0
    add-int/2addr v0, p1

    .line 27
    iput v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mEncoderCount:I

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    const-string p0, "Video encoder already added."

    .line 31
    .line 32
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    const-string p0, "unsupported encoder"

    .line 37
    .line 38
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public declared-synchronized addTrack(Landroid/media/MediaFormat;)I
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mIsStarted:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 9
    .line 10
    .line 11
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    monitor-exit p0

    .line 13
    return p1

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 17
    .line 18
    const-string v0, "muxer already started"

    .line 19
    .line 20
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p1

    .line 24
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1
.end method

.method public getOutputPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mOutputPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public declared-synchronized isStarted()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mIsStarted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public prepare(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "mediaMuxer"

    .line 2
    .line 3
    const-string v1, "MediaMuxerWrapper prepare"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->prepare(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->prepare(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public prepareAudio(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p1, "mediaMuxer"

    .line 2
    .line 3
    const-string v0, "MediaMuxerWrapper prepareAudio"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->prepare(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public prepareVideo(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "mediaMuxer"

    .line 2
    .line 3
    const-string v1, "MediaMuxerWrapper prepareVideo"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->prepare(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public declared-synchronized start()Z
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mStatredCount:I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    add-int/2addr v0, v1

    .line 6
    iput v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mStatredCount:I

    .line 7
    .line 8
    iget v2, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mEncoderCount:I

    .line 9
    .line 10
    if-lez v2, :cond_0

    .line 11
    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->start()V

    .line 17
    .line 18
    .line 19
    iput-boolean v1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mIsStarted:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mIsStarted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return v0

    .line 31
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw v0
.end method

.method public startRecording()V
    .locals 2

    .line 1
    const-string v0, "mediaMuxer"

    .line 2
    .line 3
    const-string v1, "MediaMuxerWrapper startRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->startRecording()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->startRecording()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public declared-synchronized stop()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mStatredCount:I

    .line 3
    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mStatredCount:I

    .line 7
    .line 8
    iget v1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mEncoderCount:I

    .line 9
    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->stop()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->release()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mIsStarted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw v0
.end method

.method public stopRecording()V
    .locals 2

    .line 1
    const-string v0, "mediaMuxer"

    .line 2
    .line 3
    const-string v1, "MediaMuxerWrapper stopRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->stopRecording()V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mVideoEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->stopRecording()V

    .line 23
    .line 24
    .line 25
    :cond_1
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mAudioEncoder:Lcom/momo/mcamera/videoencoder/MediaEncoder;

    .line 26
    .line 27
    return-void
.end method

.method public declared-synchronized writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mStatredCount:I

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method
