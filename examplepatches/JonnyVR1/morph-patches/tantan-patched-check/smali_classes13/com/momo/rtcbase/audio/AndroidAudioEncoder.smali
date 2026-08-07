.class public Lcom/momo/rtcbase/audio/AndroidAudioEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MEDIA_TRACK_AUDIO:I = 0x1


# instance fields
.field private final AUDIO_MIME:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private TIME_OUT_US:J

.field private mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mCodecName:Ljava/lang/String;

.field private mLastMeidaOutputPTSUs:J

.field private mMediaCodec:Landroid/media/MediaCodec;

.field private mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

.field private mMediaCodecSync:Ljava/lang/Object;

.field private mMediaType:I

.field private mPassedTime:J

.field private mSampleCnt:I

.field private shouldQuit:Z


# direct methods
.method public constructor <init>(III)V
    .locals 4
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AndroidAudioEncoder"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "audio/mp4a-latm"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->AUDIO_MIME:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    iput v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaType:I

    .line 14
    .line 15
    new-instance v1, Ljava/lang/Object;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodecSync:Ljava/lang/Object;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mCodecName:Ljava/lang/String;

    .line 26
    .line 27
    const-wide/16 v1, 0x2710

    .line 28
    .line 29
    iput-wide v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->TIME_OUT_US:J

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    iput-boolean v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->shouldQuit:Z

    .line 33
    .line 34
    const-wide/16 v2, 0x0

    .line 35
    .line 36
    iput-wide v2, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mPassedTime:J

    .line 37
    .line 38
    iput v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mSampleCnt:I

    .line 39
    .line 40
    iput-wide v2, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mLastMeidaOutputPTSUs:J

    .line 41
    .line 42
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 43
    .line 44
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 48
    .line 49
    new-instance v1, Landroid/media/MediaFormat;

    .line 50
    .line 51
    invoke-direct {v1}, Landroid/media/MediaFormat;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v2, "mime"

    .line 55
    .line 56
    invoke-virtual {v1, v2, v0}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string v0, "bitrate"

    .line 60
    .line 61
    invoke-virtual {v1, v0, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    const-string p3, "channel-count"

    .line 65
    .line 66
    invoke-virtual {v1, p3, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    const-string p3, "sample-rate"

    .line 70
    .line 71
    invoke-virtual {v1, p3, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 72
    .line 73
    .line 74
    const-string p1, "aac-profile"

    .line 75
    .line 76
    const/4 p3, 0x2

    .line 77
    invoke-virtual {v1, p1, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    mul-int/lit16 p2, p2, 0x400

    .line 81
    .line 82
    const-string p1, "max-input-size"

    .line 83
    .line 84
    invoke-virtual {v1, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 85
    .line 86
    .line 87
    iget p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaType:I

    .line 88
    .line 89
    or-int/lit8 p1, p1, 0x1

    .line 90
    .line 91
    iput p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaType:I

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->createMediaCodec(Landroid/media/MediaFormat;)Z

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private getPTSUs()J
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    iget-wide v2, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mLastMeidaOutputPTSUs:J

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-gez p0, :cond_0

    .line 13
    .line 14
    sub-long/2addr v2, v0

    .line 15
    add-long/2addr v2, v0

    .line 16
    return-wide v2

    .line 17
    :cond_0
    return-wide v0
.end method


# virtual methods
.method public createMediaCodec(Landroid/media/MediaFormat;)Z
    .locals 5

    .line 1
    const-string v0, "CreateMediaCodec error:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodecSync:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    :try_start_0
    const-string p0, "AndroidAudioEncoder"

    .line 10
    .line 11
    const-string p1, "Media format is null"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    return v2

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :try_start_1
    const-string v3, "mime"

    .line 21
    .line 22
    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iput-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mCodecName:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    const-string p0, "AndroidAudioEncoder"

    .line 31
    .line 32
    const-string p1, "Media codec name is null"

    .line 33
    .line 34
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    .line 37
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    return v2

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    :try_start_3
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 42
    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mCodecName:Ljava/lang/String;

    .line 54
    .line 55
    const-string v4, "audio/mp4a-latm"

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    const/4 v4, 0x1

    .line 62
    if-eqz v3, :cond_3

    .line 63
    .line 64
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mCodecName:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v3}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iput-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 71
    .line 72
    iput v4, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaType:I

    .line 73
    .line 74
    :cond_3
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 75
    .line 76
    if-eqz v3, :cond_4

    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    invoke-virtual {v3, p1, v0, v0, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 94
    .line 95
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 96
    return v4

    .line 97
    :cond_4
    :try_start_5
    const-string p1, "AndroidAudioEncoder"

    .line 98
    .line 99
    new-instance v3, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mCodecName:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 114
    .line 115
    .line 116
    :try_start_6
    monitor-exit v1

    .line 117
    return v2

    .line 118
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 119
    .line 120
    .line 121
    monitor-exit v1

    .line 122
    return v2

    .line 123
    :goto_1
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 124
    throw p0
.end method

.method public encode(Ljava/nio/ByteBuffer;J)[B
    .locals 9
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    const/4 p2, 0x0

    .line 2
    :try_start_0
    iget-object p3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->TIME_OUT_US:J

    .line 5
    .line 6
    invoke-virtual {p3, v0, v1}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    if-ltz v3, :cond_1

    .line 11
    .line 12
    iget-object p3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    aget-object p3, p3, v3

    .line 15
    .line 16
    invoke-virtual {p3, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    .line 19
    iget-object p3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    aget-object p3, p3, v3

    .line 22
    .line 23
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    iget-object v2, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->getPTSUs()J

    .line 33
    .line 34
    .line 35
    move-result-wide v6

    .line 36
    const/4 v8, 0x0

    .line 37
    const/4 v4, 0x0

    .line 38
    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 42
    .line 43
    iget-object p3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 44
    .line 45
    iget-wide v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->TIME_OUT_US:J

    .line 46
    .line 47
    invoke-virtual {p1, p3, v0, v1}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    const/4 p3, -0x3

    .line 52
    if-eq p1, p3, :cond_1

    .line 53
    .line 54
    const/4 p3, -0x2

    .line 55
    if-eq p1, p3, :cond_1

    .line 56
    .line 57
    const/4 p3, -0x1

    .line 58
    if-eq p1, p3, :cond_1

    .line 59
    .line 60
    iget p3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mSampleCnt:I

    .line 61
    .line 62
    add-int/lit8 p3, p3, 0x1

    .line 63
    .line 64
    iput p3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mSampleCnt:I

    .line 65
    .line 66
    iget-object p3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 67
    .line 68
    invoke-virtual {p3}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    aget-object p3, p3, p1

    .line 73
    .line 74
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 75
    .line 76
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 77
    .line 78
    new-array v1, v0, [B

    .line 79
    .line 80
    const/4 v2, 0x0

    .line 81
    invoke-virtual {p3, v1, v2, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 85
    .line 86
    iget v3, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 87
    .line 88
    const/4 v4, 0x2

    .line 89
    if-eq v3, v4, :cond_0

    .line 90
    .line 91
    iget v3, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 92
    .line 93
    if-eqz v3, :cond_0

    .line 94
    .line 95
    invoke-direct {p0}, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->getPTSUs()J

    .line 96
    .line 97
    .line 98
    move-result-wide v3

    .line 99
    iput-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 100
    .line 101
    iget-object p3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 102
    .line 103
    iget-wide v3, p3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 104
    .line 105
    iput-wide v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mLastMeidaOutputPTSUs:J

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :catch_0
    move-exception v0

    .line 109
    move-object p0, v0

    .line 110
    goto :goto_1

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputFormat()Landroid/media/MediaFormat;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v3, "csd-0"

    .line 118
    .line 119
    invoke-virtual {v0, v3, p3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 120
    .line 121
    .line 122
    :goto_0
    iget-object p0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 123
    .line 124
    invoke-virtual {p0, p1, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .line 126
    .line 127
    return-object v1

    .line 128
    :cond_1
    return-object p2

    .line 129
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 130
    .line 131
    .line 132
    return-object p2
.end method

.method public stop()V
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/rtcbase/audio/AndroidAudioEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/media/MediaCodec;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
