.class public Lcom/momo/rtcbase/audio/AndroidAudioDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final AUDIO_MIME:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private TIME_OUT_US:J

.field private mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mCodecName:Ljava/lang/String;

.field private mLastMeidaOutputPTSUs:J

.field private mMediaCodec:Landroid/media/MediaCodec;

.field private mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

.field private final mMediaCodecSync:Ljava/lang/Object;

.field private outBytes:[B


# direct methods
.method public constructor <init>(II)V
    .locals 3
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AndroidAudioDecoder"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "audio/mp4a-latm"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->AUDIO_MIME:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/Object;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodecSync:Ljava/lang/Object;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mCodecName:Ljava/lang/String;

    .line 23
    .line 24
    const-wide/16 v1, 0x2710

    .line 25
    .line 26
    iput-wide v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->TIME_OUT_US:J

    .line 27
    .line 28
    const-wide/16 v1, 0x0

    .line 29
    .line 30
    iput-wide v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mLastMeidaOutputPTSUs:J

    .line 31
    .line 32
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 38
    .line 39
    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "mime"

    .line 44
    .line 45
    invoke-virtual {v1, v2, v0}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string v0, "sample-rate"

    .line 49
    .line 50
    invoke-virtual {v1, v0, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    const-string p1, "channel-count"

    .line 54
    .line 55
    invoke-virtual {v1, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    const-string p1, "bitrate"

    .line 59
    .line 60
    const v0, 0xfa00

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    const-string p1, "aac-profile"

    .line 67
    .line 68
    const/4 v0, 0x2

    .line 69
    invoke-virtual {v1, p1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    const-string p1, "is-adts"

    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    invoke-virtual {v1, p1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    new-array p1, v0, [B

    .line 79
    .line 80
    fill-array-data p1, :array_0

    .line 81
    .line 82
    .line 83
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v0, "csd-0"

    .line 88
    .line 89
    invoke-virtual {v1, v0, p1}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0, v1}, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->createMediaCodec(Landroid/media/MediaFormat;)Z

    .line 93
    .line 94
    .line 95
    mul-int/lit16 p2, p2, 0x800

    .line 96
    .line 97
    new-array p1, p2, [B

    .line 98
    .line 99
    iput-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->outBytes:[B

    .line 100
    .line 101
    return-void

    .line 102
    nop

    .line 103
    :array_0
    .array-data 1
        0x11t
        -0x78t
    .end array-data
.end method

.method private addADTStoPacket([BI)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, -0x1

    .line 3
    aput-byte v0, p1, p0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    const/16 v0, -0xf

    .line 7
    .line 8
    aput-byte v0, p1, p0

    .line 9
    .line 10
    const/4 p0, 0x2

    .line 11
    const/16 v0, 0x4c

    .line 12
    .line 13
    aput-byte v0, p1, p0

    .line 14
    .line 15
    shr-int/lit8 p0, p2, 0xb

    .line 16
    .line 17
    const/16 v0, 0x40

    .line 18
    .line 19
    add-int/2addr v0, p0

    .line 20
    int-to-byte p0, v0

    .line 21
    const/4 v0, 0x3

    .line 22
    aput-byte p0, p1, v0

    .line 23
    .line 24
    and-int/lit16 p0, p2, 0x7ff

    .line 25
    .line 26
    shr-int/2addr p0, v0

    .line 27
    int-to-byte p0, p0

    .line 28
    const/4 v0, 0x4

    .line 29
    aput-byte p0, p1, v0

    .line 30
    .line 31
    and-int/lit8 p0, p2, 0x7

    .line 32
    .line 33
    const/4 p2, 0x5

    .line 34
    shl-int/2addr p0, p2

    .line 35
    add-int/lit8 p0, p0, 0x1f

    .line 36
    .line 37
    int-to-byte p0, p0

    .line 38
    aput-byte p0, p1, p2

    .line 39
    .line 40
    const/4 p0, 0x6

    .line 41
    const/4 p2, -0x4

    .line 42
    aput-byte p2, p1, p0

    .line 43
    .line 44
    return-void
.end method

.method private createMediaCodec(Landroid/media/MediaFormat;)Z
    .locals 5

    .line 1
    const-string v0, "CreateMediaCodec error:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodecSync:Ljava/lang/Object;

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
    const-string p0, "AndroidAudioDecoder"

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
    iput-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mCodecName:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    const-string p0, "AndroidAudioDecoder"

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
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 42
    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mCodecName:Ljava/lang/String;

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
    if-eqz v3, :cond_3

    .line 62
    .line 63
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mCodecName:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v3}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    iput-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 70
    .line 71
    :cond_3
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 72
    .line 73
    if-eqz v3, :cond_4

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    invoke-virtual {v3, p1, v0, v0, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    .line 92
    const/4 p0, 0x1

    .line 93
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 94
    return p0

    .line 95
    :cond_4
    :try_start_5
    const-string p1, "AndroidAudioDecoder"

    .line 96
    .line 97
    new-instance v3, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mCodecName:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 112
    .line 113
    .line 114
    :try_start_6
    monitor-exit v1

    .line 115
    return v2

    .line 116
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 117
    .line 118
    .line 119
    monitor-exit v1

    .line 120
    return v2

    .line 121
    :goto_1
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 122
    throw p0
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
    iget-wide v2, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mLastMeidaOutputPTSUs:J

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
.method public decode(Ljava/nio/ByteBuffer;II)[B
    .locals 11
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    const/4 p3, 0x0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 3
    .line 4
    iget-wide v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->TIME_OUT_US:J

    .line 5
    .line 6
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    if-ltz v4, :cond_1

    .line 11
    .line 12
    add-int/lit8 v0, p2, 0x7

    .line 13
    .line 14
    new-array v1, v0, [B

    .line 15
    .line 16
    invoke-direct {p0, v1, v0}, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->addADTStoPacket([BI)V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x7

    .line 20
    invoke-virtual {p1, v1, v2, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    aget-object p2, p2, v4

    .line 26
    .line 27
    const/4 v10, 0x0

    .line 28
    invoke-virtual {p2, v1, v10, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    aget-object p2, p2, v4

    .line 34
    .line 35
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    add-int/lit8 v6, p1, 0x7

    .line 43
    .line 44
    iget-object v3, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->getPTSUs()J

    .line 47
    .line 48
    .line 49
    move-result-wide v7

    .line 50
    const/4 v9, 0x0

    .line 51
    const/4 v5, 0x0

    .line 52
    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 56
    .line 57
    iget-object p2, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 58
    .line 59
    iget-wide v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->TIME_OUT_US:J

    .line 60
    .line 61
    invoke-virtual {p1, p2, v0, v1}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    move-object p2, p3

    .line 66
    :goto_0
    if-ltz p1, :cond_0

    .line 67
    .line 68
    iget-object p2, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 69
    .line 70
    invoke-virtual {p2}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    aget-object p2, p2, p1

    .line 75
    .line 76
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->outBytes:[B

    .line 77
    .line 78
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->outBytes:[B

    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 87
    .line 88
    invoke-virtual {v0, p1, v10}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 92
    .line 93
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 94
    .line 95
    iget-wide v1, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->TIME_OUT_US:J

    .line 96
    .line 97
    invoke-virtual {p1, v0, v1, v2}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 98
    .line 99
    .line 100
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    goto :goto_0

    .line 102
    :catch_0
    move-exception v0

    .line 103
    move-object p0, v0

    .line 104
    goto :goto_1

    .line 105
    :cond_0
    return-object p2

    .line 106
    :cond_1
    return-object p3

    .line 107
    :goto_1
    const-string p1, "AndroidAudioDecoder"

    .line 108
    .line 109
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 117
    .line 118
    .line 119
    return-object p3
.end method

.method public stop()V
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/rtcbase/audio/AndroidAudioDecoder;->mMediaCodec:Landroid/media/MediaCodec;

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
