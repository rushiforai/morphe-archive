.class public Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaCodecDecoder"


# instance fields
.field private mAACDecBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mAudioAACDecoder:Landroid/media/MediaCodec;

.field private mChannels:I

.field private mDecInBuffer:Ljava/nio/ByteBuffer;

.field private mDecOutBuffer:Ljava/nio/ByteBuffer;

.field mInputBuffer:Ljava/nio/ByteBuffer;

.field mOutputBuffer:Ljava/nio/ByteBuffer;

.field private mSampleRate:I

.field private mTempBufDec:[B


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mChannels:I

    .line 9
    .line 10
    const v1, 0xac44

    .line 11
    .line 12
    .line 13
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mSampleRate:I

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAACDecBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 20
    .line 21
    const/16 v0, 0x4000

    .line 22
    .line 23
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mDecInBuffer:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mDecOutBuffer:Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    new-array v0, v0, [B

    .line 36
    .line 37
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mTempBufDec:[B

    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public createAACDecoder(II)I
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    const-string v0, "audio/mp4a-latm"

    .line 2
    .line 3
    const-string v1, "createAACDecoder succeed!!! : ("

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    :try_start_0
    invoke-static {v0}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    iput-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 11
    .line 12
    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v3, "sample-rate"

    .line 17
    .line 18
    invoke-virtual {v0, v3, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    const-string v3, "channel-count"

    .line 22
    .line 23
    invoke-virtual {v0, v3, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    const-string v3, "aac-profile"

    .line 27
    .line 28
    invoke-virtual {v0, v3, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    new-array v3, v2, [B

    .line 32
    .line 33
    fill-array-data v3, :array_0

    .line 34
    .line 35
    .line 36
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const-string v4, "csd-0"

    .line 41
    .line 42
    invoke-virtual {v0, v4, v3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-virtual {v3, v0, v5, v5, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 53
    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 57
    .line 58
    .line 59
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 60
    .line 61
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAACDecBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 65
    .line 66
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_0

    .line 71
    .line 72
    const-string p0, "MediaCodecDecoder"

    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string p1, ", "

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string p1, ")"

    .line 91
    .line 92
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-static {p0, v2, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    :cond_0
    return v4

    .line 103
    :catch_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_1

    .line 108
    .line 109
    const-string p0, "TRAE"

    .line 110
    .line 111
    const-string p1, "Error when creating aac decode stream"

    .line 112
    .line 113
    invoke-static {p0, v2, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    const/4 p0, -0x1

    .line 117
    return p0

    .line 118
    nop

    .line 119
    :array_0
    .array-data 1
        0x11t
        -0x70t
    .end array-data
.end method

.method public decodeAACFrame(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mDecInBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mTempBufDec:[B

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->decodeInternalAACFrame(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mDecOutBuffer:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 16
    .line 17
    .line 18
    if-lez p1, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mDecOutBuffer:Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mTempBufDec:[B

    .line 23
    .line 24
    invoke-virtual {v0, p0, v2, p1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    .line 27
    return p1

    .line 28
    :cond_0
    return v2
.end method

.method public decodeInternalAACFrame(I)I
    .locals 13
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    const-string v0, "TRAE"

    .line 2
    .line 3
    :goto_0
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    :try_start_0
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 6
    .line 7
    const-wide/16 v4, 0xc8

    .line 8
    .line 9
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    if-ltz v7, :cond_0

    .line 14
    .line 15
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 16
    .line 17
    invoke-virtual {v3, v7}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iput-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mTempBufDec:[B

    .line 29
    .line 30
    invoke-virtual {v3, v4, v2, p1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mDecInBuffer:Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 36
    .line 37
    .line 38
    iget-object v6, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 39
    .line 40
    const-wide/16 v10, 0x0

    .line 41
    .line 42
    const/4 v12, 0x0

    .line 43
    const/4 v8, 0x0

    .line 44
    move v9, p1

    .line 45
    invoke-virtual/range {v6 .. v12}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    move v9, p1

    .line 50
    :goto_1
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 51
    .line 52
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAACDecBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 53
    .line 54
    const-wide/16 v4, 0x2710

    .line 55
    .line 56
    invoke-virtual {p1, v3, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-gez p1, :cond_1

    .line 61
    .line 62
    return v2

    .line 63
    :cond_1
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 64
    .line 65
    invoke-virtual {v3, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    iput-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAACDecBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 72
    .line 73
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 74
    .line 75
    :try_start_1
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 76
    .line 77
    .line 78
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mTempBufDec:[B

    .line 81
    .line 82
    invoke-virtual {v3, v5, v2, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 91
    .line 92
    invoke-virtual {v3, p1, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 93
    .line 94
    .line 95
    return v4

    .line 96
    :catch_0
    :try_start_2
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    const-string p1, "Error when decoding aac stream"

    .line 103
    .line 104
    invoke-static {v0, v1, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 105
    .line 106
    .line 107
    :cond_2
    move p1, v9

    .line 108
    goto :goto_0

    .line 109
    :catch_1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_3

    .line 114
    .line 115
    const-string p0, "decode failed."

    .line 116
    .line 117
    invoke-static {v0, v1, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_3
    return v2
.end method

.method public releaseAACDecoder()I
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    const-string v0, "TRAE"

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 5
    .line 6
    if-eqz v2, :cond_1

    .line 7
    .line 8
    invoke-virtual {v2}, Landroid/media/MediaCodec;->stop()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecDecoder;->mAudioAACDecoder:Landroid/media/MediaCodec;

    .line 18
    .line 19
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const-string p0, "MediaCodecDecoder"

    .line 26
    .line 27
    const-string v2, "releaseAACDecoder, release aac decode stream succeed!!"

    .line 28
    .line 29
    invoke-static {p0, v1, v2}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :catch_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const-string p0, "release aac decoder failed."

    .line 41
    .line 42
    invoke-static {v0, v1, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    const-string p0, "releaseAACDecoder, Error when releasing aac decode stream"

    .line 52
    .line 53
    invoke-static {v0, v1, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    const/4 p0, -0x1

    .line 57
    return p0
.end method
