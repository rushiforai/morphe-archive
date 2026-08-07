.class final Lcom/momo/xengine/media/VideoEncoderImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IVideoEncoder;


# instance fields
.field private calculator:Lcom/momo/xengine/media/EncodeTimestampCalculator;

.field private encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

.field private pointer:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/xengine/media/EncodeTimestampCalculator;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momo/xengine/media/EncodeTimestampCalculator;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->calculator:Lcom/momo/xengine/media/EncodeTimestampCalculator;

    .line 17
    .line 18
    return-void
.end method

.method private native nativeAppendAudioSamples(J[BIJ)Z
.end method

.method private native nativeAppendVideoFrame(J[BIZJIIF)Z
.end method

.method private native nativeInit(Ljava/lang/String;IIIFFJIIII)J
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeStart(J)Z
.end method

.method private native nativeStop(J)V
.end method


# virtual methods
.method public appendAudioSamples(Lcom/momo/xengine/media/AudioSamples;)Z
    .locals 8
    .param p1    # Lcom/momo/xengine/media/AudioSamples;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/momo/xengine/media/AudioSamples;->getData()[B

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    :cond_0
    move-object v1, p0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    iget-wide v2, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/momo/xengine/media/AudioSamples;->getData()[B

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {p1}, Lcom/momo/xengine/media/AudioSamples;->getSamples()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    invoke-virtual {p1}, Lcom/momo/xengine/media/AudioSamples;->getTimestamp()J

    .line 29
    .line 30
    .line 31
    move-result-wide v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    move-object v1, p0

    .line 33
    :try_start_1
    invoke-direct/range {v1 .. v7}, Lcom/momo/xengine/media/VideoEncoderImpl;->nativeAppendAudioSamples(J[BIJ)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    monitor-exit v1

    .line 38
    return p0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    :goto_0
    move-object p0, v0

    .line 41
    goto :goto_2

    .line 42
    :catchall_1
    move-exception v0

    .line 43
    move-object v1, p0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    const/4 p0, 0x0

    .line 46
    monitor-exit v1

    .line 47
    return p0

    .line 48
    :goto_2
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw p0
.end method

.method public appendVideoFrame(Lcom/momo/xengine/media/types/VideoFrame;)Z
    .locals 13
    .param p1    # Lcom/momo/xengine/media/types/VideoFrame;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getData()[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/momo/xengine/media/EncodeConfig;->getSize()Landroid/util/Size;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/momo/xengine/media/EncodeConfig;->getSize()Landroid/util/Size;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getFormat()Lcom/momo/xengine/media/types/PixelFormat;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v2, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NONE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 48
    .line 49
    if-ne v0, v2, :cond_1

    .line 50
    .line 51
    :cond_0
    move-object v2, p0

    .line 52
    goto/16 :goto_2

    .line 53
    .line 54
    :cond_1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->calculator:Lcom/momo/xengine/media/EncodeTimestampCalculator;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->isInit()Z

    .line 57
    .line 58
    .line 59
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    :try_start_1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->calculator:Lcom/momo/xengine/media/EncodeTimestampCalculator;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getTimestamp()J

    .line 65
    .line 66
    .line 67
    move-result-wide v2

    .line 68
    invoke-virtual {v0, v2, v3}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->init(J)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catchall_0
    move-exception v0

    .line 73
    move-object p1, v0

    .line 74
    move-object v2, p0

    .line 75
    goto :goto_3

    .line 76
    :cond_2
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->calculator:Lcom/momo/xengine/media/EncodeTimestampCalculator;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->isInit()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    iget-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->calculator:Lcom/momo/xengine/media/EncodeTimestampCalculator;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getTimestamp()J

    .line 87
    .line 88
    .line 89
    move-result-wide v1

    .line 90
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getSpeed()F

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-virtual {v0, v1, v2, v3}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->calculateTimestamp(JF)J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    invoke-virtual {p1, v0, v1}, Lcom/momo/xengine/media/types/VideoFrame;->setTimestamp(J)V

    .line 99
    .line 100
    .line 101
    iget-wide v3, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getData()[B

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getLineSize()I

    .line 108
    .line 109
    .line 110
    move-result v6

    .line 111
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->isFlipY()Z

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getTimestamp()J

    .line 116
    .line 117
    .line 118
    move-result-wide v8

    .line 119
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getFormat()Lcom/momo/xengine/media/types/PixelFormat;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lcom/momo/xengine/media/types/PixelFormat;->getValue()I

    .line 124
    .line 125
    .line 126
    move-result v10

    .line 127
    iget-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/momo/xengine/media/EncodeConfig;->getSize()Landroid/util/Size;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    .line 134
    .line 135
    .line 136
    move-result v11

    .line 137
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/VideoFrame;->getSpeed()F

    .line 138
    .line 139
    .line 140
    move-result v12
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 141
    move-object v2, p0

    .line 142
    :try_start_3
    invoke-direct/range {v2 .. v12}, Lcom/momo/xengine/media/VideoEncoderImpl;->nativeAppendVideoFrame(J[BIZJIIF)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    monitor-exit v2

    .line 147
    return p0

    .line 148
    :catchall_1
    move-exception v0

    .line 149
    :goto_1
    move-object p1, v0

    .line 150
    goto :goto_3

    .line 151
    :catchall_2
    move-exception v0

    .line 152
    move-object v2, p0

    .line 153
    goto :goto_1

    .line 154
    :cond_3
    move-object v2, p0

    .line 155
    monitor-exit v2

    .line 156
    return v1

    .line 157
    :goto_2
    monitor-exit v2

    .line 158
    return v1

    .line 159
    :goto_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 160
    throw p1
.end method

.method public init(Lcom/momo/xengine/media/EncodeConfig;)V
    .locals 14
    .param p1    # Lcom/momo/xengine/media/EncodeConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getSize()Landroid/util/Size;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iput-object p1, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->encodeConfig:Lcom/momo/xengine/media/EncodeConfig;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioFormat()Lcom/momo/xengine/media/types/SampleFormat;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    invoke-virtual {v3}, Lcom/momo/xengine/media/types/SampleFormat;->getValue()I

    .line 13
    .line 14
    .line 15
    move-result v10

    .line 16
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getPath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getFrameRate()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getRotation()F

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getSpeed()F

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getBitrate()J

    .line 41
    .line 42
    .line 43
    move-result-wide v8

    .line 44
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioBitrate()I

    .line 45
    .line 46
    .line 47
    move-result v11

    .line 48
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioChannels()Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/momo/xengine/media/types/AudioChannelLayout;->getValue()I

    .line 53
    .line 54
    .line 55
    move-result v12

    .line 56
    invoke-virtual {p1}, Lcom/momo/xengine/media/EncodeConfig;->getAudioSamplesRate()I

    .line 57
    .line 58
    .line 59
    move-result v13

    .line 60
    move-object v1, p0

    .line 61
    invoke-direct/range {v1 .. v13}, Lcom/momo/xengine/media/VideoEncoderImpl;->nativeInit(Ljava/lang/String;IIIFFJIIII)J

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    iput-wide v2, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 66
    .line 67
    monitor-exit p0

    .line 68
    return-void

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    throw v0
.end method

.method public release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v4, v0, v2

    .line 7
    .line 8
    if-eqz v4, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoEncoderImpl;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->calculator:Lcom/momo/xengine/media/EncodeTimestampCalculator;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->release()V

    .line 21
    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw v0
.end method

.method public start()Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    monitor-exit p0

    .line 12
    return v0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoEncoderImpl;->nativeStart(J)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    monitor-exit p0

    .line 20
    return v0

    .line 21
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw v0
.end method

.method public stop()Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoEncoderImpl;->pointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    monitor-exit p0

    .line 12
    return v0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoEncoderImpl;->nativeStop(J)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    monitor-exit p0

    .line 20
    return v0

    .line 21
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw v0
.end method
