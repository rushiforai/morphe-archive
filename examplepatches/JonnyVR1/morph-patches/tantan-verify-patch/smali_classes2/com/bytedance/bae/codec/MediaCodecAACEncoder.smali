.class public Lcom/bytedance/bae/codec/MediaCodecAACEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final MAX_WAITING_TIME:I = 0x12c

.field private static final TAG:Ljava/lang/String; = "MediaCodecAACEncoder"


# instance fields
.field private mAACEncoder:Landroid/media/MediaCodec;

.field private mBitrate:I

.field private mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mChannels:I

.field private mEncodedData:[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mFrameSize:I

.field private mInputBuffers:[Ljava/nio/ByteBuffer;

.field private mMimeType:Ljava/lang/String;

.field private mOutputBuffers:[Ljava/nio/ByteBuffer;

.field private mProfile:I

.field private mSampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 1
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
    iput-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mMimeType:Ljava/lang/String;

    .line 7
    .line 8
    const v0, 0xac44

    .line 9
    .line 10
    .line 11
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mSampleRate:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mChannels:I

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mProfile:I

    .line 18
    .line 19
    const v0, 0xfa00

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mBitrate:I

    .line 23
    .line 24
    const/16 v0, 0x400

    .line 25
    .line 26
    iput v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mFrameSize:I

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 30
    .line 31
    const-string p0, "MediaCodecAACEncoder"

    .line 32
    .line 33
    const-string v0, "MediaCodecAAC Encoder Created"

    .line 34
    .line 35
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public closeEncoder()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "MediaCodecAACEncoder"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/media/MediaCodec;->stop()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 17
    .line 18
    const-string p0, "close AAC encoder success"

    .line 19
    .line 20
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 28
    .line 29
    .line 30
    const-string p0, "close AAC encoder failed"

    .line 31
    .line 32
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public configAndStartEncoder()Z
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "MediaCodecAACEncoder"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mMimeType:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mSampleRate:I

    .line 6
    .line 7
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mChannels:I

    .line 8
    .line 9
    invoke-static {v1, v2, v3}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "bitrate"

    .line 14
    .line 15
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mBitrate:I

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    const-string v2, "aac-profile"

    .line 21
    .line 22
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mProfile:I

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    const-string v2, "profile"

    .line 28
    .line 29
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mProfile:I

    .line 30
    .line 31
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    const-string v2, "max-input-size"

    .line 35
    .line 36
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mChannels:I

    .line 37
    .line 38
    iget v4, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mFrameSize:I

    .line 39
    .line 40
    mul-int/2addr v3, v4

    .line 41
    mul-int/lit8 v3, v3, 0x64

    .line 42
    .line 43
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 47
    .line 48
    const/4 v3, 0x1

    .line 49
    const/4 v4, 0x0

    .line 50
    invoke-virtual {v2, v1, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

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
    iput-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 64
    .line 65
    const-string p0, "config AAC encoder success"

    .line 66
    .line 67
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    return v3

    .line 71
    :catch_0
    move-exception p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 73
    .line 74
    .line 75
    const-string p0, "Config and Start Encoder Error"

    .line 76
    .line 77
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const/4 p0, 0x0

    .line 81
    return p0
.end method

.method public encodeProcess([B)Z
    .locals 11
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const/4 v1, 0x0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

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
    iput-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mEncodedData:[B

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
    if-ltz v5, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 19
    .line 20
    invoke-virtual {v0, v5}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    iget-object v4, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 31
    .line 32
    array-length v7, p1

    .line 33
    const-wide/16 v8, 0x0

    .line 34
    .line 35
    const/4 v10, 0x0

    .line 36
    const/4 v6, 0x0

    .line 37
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    goto :goto_2

    .line 44
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 47
    .line 48
    const-wide/16 v2, 0x0

    .line 49
    .line 50
    invoke-virtual {p1, v0, v2, v3}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object v0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 55
    .line 56
    iget v2, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 57
    .line 58
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    const/4 v3, 0x2

    .line 61
    and-int/2addr v0, v3

    .line 62
    const/4 v4, 0x1

    .line 63
    if-lez v2, :cond_4

    .line 64
    .line 65
    if-gez p1, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    iget-object v5, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 69
    .line 70
    if-ne v0, v3, :cond_3

    .line 71
    .line 72
    :try_start_1
    invoke-virtual {v5, p1, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 73
    .line 74
    .line 75
    return v4

    .line 76
    :cond_3
    invoke-virtual {v5, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-array v3, v2, [B

    .line 81
    .line 82
    iput-object v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mEncodedData:[B

    .line 83
    .line 84
    iget-object v5, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 85
    .line 86
    iget v5, v5, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 87
    .line 88
    invoke-virtual {v0, v3, v5, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 95
    .line 96
    invoke-virtual {p0, p1, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_1
    return v4

    .line 100
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 101
    .line 102
    .line 103
    const-string p0, "MediaCodecAACEncoder"

    .line 104
    .line 105
    const-string p1, "AAC Encoder Encode failed"

    .line 106
    .line 107
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return v1
.end method

.method public getEncodedData()[B
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mEncodedData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrameSize()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mFrameSize:I

    .line 2
    .line 3
    return p0
.end method

.method public openEncoder()Z
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "MediaCodecAACEncoder"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mMimeType:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v2}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    iput-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 11
    .line 12
    const-string v2, "open AAC encoder success"

    .line 13
    .line 14
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    return v1

    .line 24
    :catch_0
    move-exception v2

    .line 25
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    iput-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 30
    .line 31
    const-string p0, "Open AAC encoder failed"

    .line 32
    .line 33
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return v1
.end method

.method public setBitRateValue(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mBitrate:I

    .line 2
    .line 3
    return-void
.end method

.method public setBitrate(I)Z
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {v1}, Landroid/media/MediaCodec;->stop()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mMimeType:Ljava/lang/String;

    .line 11
    .line 12
    iget v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mSampleRate:I

    .line 13
    .line 14
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mChannels:I

    .line 15
    .line 16
    invoke-static {v1, v2, v3}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "bitrate"

    .line 21
    .line 22
    invoke-virtual {v1, v2, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    const-string v2, "aac-profile"

    .line 26
    .line 27
    iget v3, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mProfile:I

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-virtual {v2, v1, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mAACEncoder:Landroid/media/MediaCodec;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/media/MediaCodec;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mBitrate:I

    .line 45
    .line 46
    return v3

    .line 47
    :catch_0
    move-exception p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    const-string p0, "MediaCodecAACEncoder"

    .line 52
    .line 53
    const-string p1, "Config and Start Encoder Error"

    .line 54
    .line 55
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return v0
.end method

.method public setChannelsValue(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mChannels:I

    .line 2
    .line 3
    return-void
.end method

.method public setProfileValue(Ljava/lang/String;)V
    .locals 2
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
    const/16 v1, 0x800

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x5

    .line 12
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mProfile:I

    .line 13
    .line 14
    iput v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mFrameSize:I

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "he_aac_v2"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const/16 p1, 0x1d

    .line 26
    .line 27
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mProfile:I

    .line 28
    .line 29
    iput v1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mFrameSize:I

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 p1, 0x2

    .line 33
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mProfile:I

    .line 34
    .line 35
    const/16 p1, 0x400

    .line 36
    .line 37
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mFrameSize:I

    .line 38
    .line 39
    return-void
.end method

.method public setSampeRateValue(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/bytedance/bae/codec/MediaCodecAACEncoder;->mSampleRate:I

    .line 2
    .line 3
    return-void
.end method
