.class public Lcom/momo/xengine/media/MediacodecEncoderWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IMediacodecSurfaceEncoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;,
        Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;
    }
.end annotation


# instance fields
.field private audioEncoder:Landroid/media/MediaCodec;

.field private audioThread:Ljava/lang/Thread;

.field private audioTrackIndex:I

.field private encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

.field private encodeThread:Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

.field private isStopped:Z

.field private mAudioDataQueue:Ljava/util/concurrent/LinkedBlockingDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingDeque<",
            "Lcom/momo/xengine/media/AudioSamples;",
            ">;"
        }
    .end annotation
.end field

.field private mSampleCnt:I

.field private mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

.field private surface:Landroid/view/Surface;

.field private videoEncoder:Landroid/media/MediaCodec;


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
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->videoEncoder:Landroid/media/MediaCodec;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->surface:Landroid/view/Surface;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeThread:Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioThread:Ljava/lang/Thread;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    iput v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioTrackIndex:I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mSampleCnt:I

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->isStopped:Z

    .line 26
    .line 27
    new-instance v0, Ljava/util/concurrent/LinkedBlockingDeque;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mAudioDataQueue:Ljava/util/concurrent/LinkedBlockingDeque;

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$002(Lcom/momo/xengine/media/MediacodecEncoderWrapper;Landroid/media/MediaCodec;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$100(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Lcom/momo/xengine/media/Mp4MuxerWrapper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->isStopped:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Ljava/util/concurrent/LinkedBlockingDeque;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mAudioDataQueue:Ljava/util/concurrent/LinkedBlockingDeque;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->feedData()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$500(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioTrackIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$502(Lcom/momo/xengine/media/MediacodecEncoderWrapper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioTrackIndex:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$600(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mSampleCnt:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$612(Lcom/momo/xengine/media/MediacodecEncoderWrapper;I)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mSampleCnt:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iput v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mSampleCnt:I

    .line 5
    .line 6
    return v0
.end method

.method public static synthetic access$700(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)Lcom/momo/xengine/media/EncodeConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method private feedData()I
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mAudioDataQueue:Ljava/util/concurrent/LinkedBlockingDeque;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mAudioDataQueue:Ljava/util/concurrent/LinkedBlockingDeque;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingDeque;->take()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/momo/xengine/media/AudioSamples;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    move-object v1, v0

    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :catch_0
    move-exception v0

    .line 24
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/momo/xengine/media/AudioSamples;->getData()[B

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/momo/xengine/media/AudioSamples;->getData()[B

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    array-length v5, v0

    .line 40
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/momo/xengine/media/EncodeConfig;->getAudioFormat()Lcom/momo/xengine/media/types/SampleFormat;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/momo/xengine/media/types/SampleFormat;->getSampleBit()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 51
    .line 52
    const-wide/16 v3, 0x2710

    .line 53
    .line 54
    invoke-virtual {v2, v3, v4}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-ltz v3, :cond_1

    .line 59
    .line 60
    iget-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/momo/xengine/media/AudioSamples;->getData()[B

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/momo/xengine/media/AudioSamples;->getTimestamp()J

    .line 79
    .line 80
    .line 81
    move-result-wide v6

    .line 82
    const/4 v8, 0x0

    .line 83
    const/4 v4, 0x0

    .line 84
    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 85
    .line 86
    .line 87
    div-int/2addr v5, v0

    .line 88
    monitor-exit p0

    .line 89
    return v5

    .line 90
    :cond_1
    monitor-exit p0

    .line 91
    const/4 p0, -0x1

    .line 92
    return p0

    .line 93
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    throw v0
.end method

.method private isFinished()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mAudioDataQueue:Ljava/util/concurrent/LinkedBlockingDeque;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private waitFinish()Z
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :goto_0
    invoke-direct {p0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->isFinished()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    sub-long/2addr v2, v0

    .line 16
    const-wide/16 v4, 0x2710

    .line 17
    .line 18
    cmp-long v2, v2, v4

    .line 19
    .line 20
    if-lez v2, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    const-wide/16 v2, 0xa

    .line 25
    .line 26
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception v2

    .line 31
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p0, 0x1

    .line 36
    :goto_1
    return p0
.end method


# virtual methods
.method public getEncoderSurface()Landroid/view/Surface;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->videoEncoder:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->surface:Landroid/view/Surface;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public init(Lcom/momo/xengine/media/EncodeConfig;)Z
    .locals 8

    .line 1
    const-string v0, "audio/mp4a-latm"

    .line 2
    .line 3
    const-string v1, "bitrate"

    .line 4
    .line 5
    const-string v2, "video/avc"

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    :try_start_0
    new-instance v4, Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getPath()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    const/4 v6, 0x3

    .line 17
    invoke-direct {v4, v5, v6}, Lcom/momo/xengine/media/Mp4MuxerWrapper;-><init>(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    iput-object v4, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getRotation()F

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    float-to-int v5, v5

    .line 27
    invoke-virtual {v4, v5}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->setVideoOrientation(I)V

    .line 28
    .line 29
    .line 30
    invoke-static {v2}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    iput-object v4, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->videoEncoder:Landroid/media/MediaCodec;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getSize()Landroid/util/Size;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getSize()Landroid/util/Size;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-static {v2, v4, v5}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v4, "color-format"

    .line 57
    .line 58
    const v5, 0x7f000789

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    const-string v4, "i-frame-interval"

    .line 65
    .line 66
    const/4 v5, 0x1

    .line 67
    invoke-virtual {v2, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    const-string v4, "frame-rate"

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getFrameRate()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    invoke-virtual {v2, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getBitrate()J

    .line 80
    .line 81
    .line 82
    move-result-wide v6

    .line 83
    long-to-int v4, v6

    .line 84
    invoke-virtual {v2, v1, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 85
    .line 86
    .line 87
    iget-object v4, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->videoEncoder:Landroid/media/MediaCodec;

    .line 88
    .line 89
    invoke-virtual {v4, v2, v3, v3, v5}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    iput-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioSamplesRate()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioChannels()Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v4}, Lcom/momo/xengine/media/types/AudioChannelLayout;->getChannelNum()I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    invoke-static {v0, v2, v4}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioBitrate()I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    const-string v1, "aac-profile"

    .line 122
    .line 123
    const/4 v2, 0x2

    .line 124
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 125
    .line 126
    .line 127
    const-string v1, "max-input-size"

    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioChannels()Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v2}, Lcom/momo/xengine/media/types/AudioChannelLayout;->getChannelNum()I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    mul-int/lit16 v2, v2, 0x400

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioFormat()Lcom/momo/xengine/media/types/SampleFormat;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/SampleFormat;->getSampleBit()I

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    mul-int/2addr v2, p1

    .line 148
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 152
    .line 153
    invoke-virtual {p1, v0, v3, v3, v5}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    .line 155
    .line 156
    return v5

    .line 157
    :catch_0
    move-exception p1

    .line 158
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 159
    .line 160
    .line 161
    iput-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->videoEncoder:Landroid/media/MediaCodec;

    .line 162
    .line 163
    iput-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 164
    .line 165
    const/4 p0, 0x0

    .line 166
    return p0
.end method

.method public putAudioData(Lcom/momo/xengine/media/AudioSamples;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mAudioDataQueue:Ljava/util/concurrent/LinkedBlockingDeque;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingDeque;->offer(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 0

    return-void
.end method

.method public start()Z
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->videoEncoder:Landroid/media/MediaCodec;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->surface:Landroid/view/Surface;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->videoEncoder:Landroid/media/MediaCodec;

    .line 18
    .line 19
    iget-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 20
    .line 21
    iget-object v4, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 22
    .line 23
    invoke-direct {v0, v2, v3, v4}, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;-><init>(Landroid/media/MediaCodec;Lcom/momo/xengine/media/EncodeConfig;Lcom/momo/xengine/media/Mp4MuxerWrapper;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeThread:Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

    .line 27
    .line 28
    new-instance v0, Ljava/lang/Thread;

    .line 29
    .line 30
    new-instance v2, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper$AudioRunnable;-><init>(Lcom/momo/xengine/media/MediacodecEncoderWrapper;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioThread:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    :try_start_1
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeThread:Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioThread:Ljava/lang/Thread;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    :try_start_2
    monitor-exit p0

    .line 57
    return v0

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    goto :goto_0

    .line 60
    :catch_0
    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioEncoder:Landroid/media/MediaCodec;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeThread:Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->exit()V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeThread:Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

    .line 69
    .line 70
    monitor-exit p0

    .line 71
    return v1

    .line 72
    :cond_0
    monitor-exit p0

    .line 73
    return v1

    .line 74
    :goto_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 75
    throw v0
.end method

.method public stop()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->waitFinish()Z

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeThread:Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->exit()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->encodeThread:Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;

    .line 13
    .line 14
    :cond_0
    monitor-enter p0

    .line 15
    :try_start_0
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioThread:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    :try_start_1
    iput-boolean v2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->isStopped:Z

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :catch_0
    move-exception v0

    .line 29
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    :goto_0
    iput-object v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->audioThread:Ljava/lang/Thread;

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->stopMuxing()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 42
    .line 43
    :cond_2
    monitor-exit p0

    .line 44
    return-void

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    throw v0
.end method
