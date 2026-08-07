.class public Lcom/bytedance/bae/codec/MediaCodecAACDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final MAX_WAITING_TIME:I = 0x12c

.field private static final TAG:Ljava/lang/String; = "MediaCodecAACDecoder"


# instance fields
.field private input_ts:J

.field private mAACDecoder:Landroid/media/MediaCodec;

.field private mAsc:[B

.field private mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mChannels:I

.field private mDecodedData:[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mHasADTS:I

.field private mInputBuffers:[Ljava/nio/ByteBuffer;

.field private mMimeType:Ljava/lang/String;

.field private mOutputBuffers:[Ljava/nio/ByteBuffer;

.field private mOutputFormat:Landroid/media/MediaFormat;

.field private mProfile:I

.field private mSampleRate:I

.field private output_ts:J


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "audio/mp4a-latm"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mMimeType:Ljava/lang/String;

    .line 7
    .line 8
    const v0, 0xac44

    .line 9
    .line 10
    .line 11
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mSampleRate:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mChannels:I

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mProfile:I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mHasADTS:I

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->input_ts:J

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->output_ts:J

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 30
    .line 31
    const-string p0, "MediaCodecAACDecoder"

    .line 32
    .line 33
    const-string v0, "MediaCodecAAC Decoder Created"

    .line 34
    .line 35
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private genAsc()V
    .locals 12
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mProfile:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x2

    .line 5
    if-ne v0, v2, :cond_0

    .line 6
    .line 7
    new-array v3, v2, [B

    .line 8
    .line 9
    iput-object v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAsc:[B

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-array v3, v1, [B

    .line 13
    .line 14
    iput-object v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAsc:[B

    .line 15
    .line 16
    :goto_0
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mSampleRate:I

    .line 17
    .line 18
    const/4 v4, 0x5

    .line 19
    const/16 v5, 0x8

    .line 20
    .line 21
    const/4 v6, 0x7

    .line 22
    const/4 v7, 0x3

    .line 23
    const/4 v8, 0x0

    .line 24
    const v9, 0xbb80

    .line 25
    .line 26
    .line 27
    if-ne v9, v3, :cond_1

    .line 28
    .line 29
    const/4 v1, 0x6

    .line 30
    move v3, v1

    .line 31
    move v1, v7

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const v9, 0xac44

    .line 34
    .line 35
    .line 36
    if-ne v9, v3, :cond_2

    .line 37
    .line 38
    move v3, v6

    .line 39
    goto :goto_1

    .line 40
    :cond_2
    const/16 v1, 0x7d00

    .line 41
    .line 42
    if-ne v1, v3, :cond_3

    .line 43
    .line 44
    move v1, v4

    .line 45
    move v3, v5

    .line 46
    goto :goto_1

    .line 47
    :cond_3
    move v1, v8

    .line 48
    move v3, v1

    .line 49
    :goto_1
    iget v9, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mChannels:I

    .line 50
    .line 51
    const/4 v10, 0x1

    .line 52
    if-ne v10, v9, :cond_4

    .line 53
    .line 54
    move v9, v10

    .line 55
    goto :goto_2

    .line 56
    :cond_4
    if-ne v2, v9, :cond_5

    .line 57
    .line 58
    move v9, v2

    .line 59
    goto :goto_2

    .line 60
    :cond_5
    move v9, v8

    .line 61
    :goto_2
    int-to-byte v11, v0

    .line 62
    if-ne v2, v0, :cond_6

    .line 63
    .line 64
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAsc:[B

    .line 65
    .line 66
    shl-int/lit8 v0, v11, 0x3

    .line 67
    .line 68
    shr-int/lit8 v2, v1, 0x1

    .line 69
    .line 70
    or-int/2addr v0, v2

    .line 71
    int-to-byte v0, v0

    .line 72
    aput-byte v0, p0, v8

    .line 73
    .line 74
    shl-int/lit8 v0, v1, 0x7

    .line 75
    .line 76
    shl-int/lit8 v1, v9, 0x3

    .line 77
    .line 78
    or-int/2addr v0, v1

    .line 79
    int-to-byte v0, v0

    .line 80
    aput-byte v0, p0, v10

    .line 81
    .line 82
    return-void

    .line 83
    :cond_6
    if-ne v4, v0, :cond_7

    .line 84
    .line 85
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAsc:[B

    .line 86
    .line 87
    shl-int/lit8 v0, v11, 0x3

    .line 88
    .line 89
    shr-int/lit8 v4, v3, 0x1

    .line 90
    .line 91
    or-int/2addr v0, v4

    .line 92
    int-to-byte v0, v0

    .line 93
    aput-byte v0, p0, v8

    .line 94
    .line 95
    shl-int/lit8 v0, v3, 0x7

    .line 96
    .line 97
    shl-int/lit8 v3, v9, 0x3

    .line 98
    .line 99
    or-int/2addr v0, v3

    .line 100
    shr-int/lit8 v3, v1, 0x1

    .line 101
    .line 102
    or-int/2addr v0, v3

    .line 103
    int-to-byte v0, v0

    .line 104
    aput-byte v0, p0, v10

    .line 105
    .line 106
    shl-int/lit8 v0, v1, 0x7

    .line 107
    .line 108
    or-int/2addr v0, v5

    .line 109
    int-to-byte v0, v0

    .line 110
    aput-byte v0, p0, v2

    .line 111
    .line 112
    aput-byte v8, p0, v7

    .line 113
    .line 114
    return-void

    .line 115
    :cond_7
    const/16 v4, 0x1d

    .line 116
    .line 117
    if-ne v4, v0, :cond_8

    .line 118
    .line 119
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAsc:[B

    .line 120
    .line 121
    shl-int/lit8 v0, v11, 0x3

    .line 122
    .line 123
    shr-int/lit8 v4, v3, 0x1

    .line 124
    .line 125
    or-int/2addr v0, v4

    .line 126
    int-to-byte v0, v0

    .line 127
    aput-byte v0, p0, v8

    .line 128
    .line 129
    shl-int/lit8 v0, v3, 0x7

    .line 130
    .line 131
    or-int/2addr v0, v5

    .line 132
    shr-int/lit8 v3, v1, 0x1

    .line 133
    .line 134
    or-int/2addr v0, v3

    .line 135
    int-to-byte v0, v0

    .line 136
    aput-byte v0, p0, v10

    .line 137
    .line 138
    shl-int/lit8 v0, v1, 0x7

    .line 139
    .line 140
    or-int/2addr v0, v5

    .line 141
    int-to-byte v0, v0

    .line 142
    aput-byte v0, p0, v2

    .line 143
    .line 144
    aput-byte v8, p0, v7

    .line 145
    .line 146
    :cond_8
    return-void
.end method


# virtual methods
.method public closeDecoder()V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    const-string p0, "MediaCodecAACDecoder"

    .line 22
    .line 23
    const-string v0, "close AAC decoder failed"

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public configAndStartDecoder()Z
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mMimeType:Ljava/lang/String;

    .line 3
    .line 4
    iget v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mSampleRate:I

    .line 5
    .line 6
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mChannels:I

    .line 7
    .line 8
    invoke-static {v1, v2, v3}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "aac-profile"

    .line 13
    .line 14
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mProfile:I

    .line 15
    .line 16
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    const-string v2, "is-adts"

    .line 20
    .line 21
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mHasADTS:I

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    const-string v2, "aac-max-output-channel_count"

    .line 27
    .line 28
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mChannels:I

    .line 29
    .line 30
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->genAsc()V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAsc:[B

    .line 37
    .line 38
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "csd-0"

    .line 43
    .line 44
    invoke-virtual {v1, v3, v2}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    invoke-virtual {v2, v1, v3, v3, v0}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/media/MediaCodec;->start()V

    .line 56
    .line 57
    .line 58
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 59
    .line 60
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :catch_0
    move-exception v1

    .line 68
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->closeDecoder()V

    .line 72
    .line 73
    .line 74
    const-string p0, "MediaCodecAACDecoder"

    .line 75
    .line 76
    const-string v1, "Config and Start Decoder Error"

    .line 77
    .line 78
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return v0
.end method

.method public decodeProcess([B)Z
    .locals 12
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const/4 v1, 0x0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v2, 0x0

    .line 8
    iput-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mDecodedData:[B

    .line 9
    .line 10
    const-wide/16 v2, 0x12c

    .line 11
    .line 12
    invoke-virtual {v0, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    const-wide/32 v2, 0xf4240

    .line 17
    .line 18
    .line 19
    if-ltz v5, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 22
    .line 23
    invoke-virtual {v0, v5}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    iget-object v4, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 34
    .line 35
    array-length v7, p1

    .line 36
    iget-wide v8, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->input_ts:J

    .line 37
    .line 38
    mul-long/2addr v8, v2

    .line 39
    iget p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mSampleRate:I

    .line 40
    .line 41
    int-to-long v10, p1

    .line 42
    div-long/2addr v8, v10

    .line 43
    const/4 v10, 0x0

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    move-object p0, v0

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 55
    .line 56
    const-wide/16 v4, 0x0

    .line 57
    .line 58
    invoke-virtual {p1, v0, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 63
    .line 64
    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 65
    .line 66
    const/4 v5, 0x1

    .line 67
    if-lez v4, :cond_3

    .line 68
    .line 69
    if-gez p1, :cond_2

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    iget-wide v6, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 73
    .line 74
    iget v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mSampleRate:I

    .line 75
    .line 76
    int-to-long v8, v0

    .line 77
    mul-long/2addr v6, v8

    .line 78
    div-long/2addr v6, v2

    .line 79
    iput-wide v6, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->output_ts:J

    .line 80
    .line 81
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 82
    .line 83
    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-array v2, v4, [B

    .line 88
    .line 89
    iput-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mDecodedData:[B

    .line 90
    .line 91
    iget-object v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 92
    .line 93
    iget v4, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 94
    .line 95
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 96
    .line 97
    invoke-virtual {v0, v2, v4, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 104
    .line 105
    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getOutputFormat(I)Landroid/media/MediaFormat;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mOutputFormat:Landroid/media/MediaFormat;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 112
    .line 113
    invoke-virtual {p0, p1, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    :cond_3
    :goto_1
    return v5

    .line 117
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 118
    .line 119
    .line 120
    const-string p0, "MediaCodecAACDecoder"

    .line 121
    .line 122
    const-string p1, "AAC Decoder Decode failed"

    .line 123
    .line 124
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return v1
.end method

.method public getDecodedData()[B
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mDecodedData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getOutputChannels()I
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mOutputFormat:Landroid/media/MediaFormat;

    .line 2
    .line 3
    const-string v0, "channel-count"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getOutputSampleRate()I
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mOutputFormat:Landroid/media/MediaFormat;

    .line 2
    .line 3
    const-string v0, "sample-rate"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getOutputTs()J
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->output_ts:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public openEncoder()Z
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mMimeType:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {v1}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iput-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    return v0

    .line 15
    :catch_0
    move-exception v1

    .line 16
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mAACDecoder:Landroid/media/MediaCodec;

    .line 21
    .line 22
    const-string p0, "MediaCodecAACDecoder"

    .line 23
    .line 24
    const-string v1, "Open AAC Decoder failed"

    .line 25
    .line 26
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return v0
.end method

.method public setADTSValue(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mHasADTS:I

    .line 2
    .line 3
    return-void
.end method

.method public setChannelsValue(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mChannels:I

    .line 2
    .line 3
    return-void
.end method

.method public setInputTs(J)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->input_ts:J

    .line 2
    .line 3
    return-void
.end method

.method public setProfileValue(Ljava/lang/String;)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "he_aac"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x5

    .line 10
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mProfile:I

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string v0, "he_aac_v2"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const/16 p1, 0x1d

    .line 22
    .line 23
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mProfile:I

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const/4 p1, 0x2

    .line 27
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mProfile:I

    .line 28
    .line 29
    return-void
.end method

.method public setSampeRateValue(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACDecoder;->mSampleRate:I

    .line 2
    .line 3
    return-void
.end method
