.class public Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder$VideoEncodeResultCode;
    }
.end annotation


# static fields
.field public static final MIME_TYPE:Ljava/lang/String; = "video/avc"

.field public static final TAG:Ljava/lang/String; = "YtVideoEncoder"

.field public static codecInfo:Landroid/media/MediaCodecInfo; = null

.field public static colorFormat:I = 0x15


# instance fields
.field public addedTrackCount:I

.field public isEncodingStarted:Z

.field public isMediaMuxerStarted:Z

.field public final mFrameSync:Ljava/lang/Object;

.field public mNewFrameLatch:Ljava/util/concurrent/CountDownLatch;

.field public mNoMoreFrames:Z

.field public mOutputFile:Ljava/io/File;

.field public mediaMuxer:Landroid/media/MediaMuxer;

.field public mediaMuxerFormat:Landroid/media/MediaFormat;

.field public final mediaMuxerSync:Ljava/lang/Object;

.field public outputFileString:Ljava/lang/String;

.field public videoEncodeQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/tencent/youtu/sdkkitframework/common/YTImageData;",
            ">;"
        }
    .end annotation
.end field

.field public videoEncoder:Landroid/media/MediaCodec;

.field public videoGenerateIndex:I

.field public videoTrackIndex:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncodeQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isMediaMuxerStarted:Z

    .line 13
    .line 14
    new-instance v1, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mFrameSync:Ljava/lang/Object;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/Object;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxerSync:Ljava/lang/Object;

    .line 27
    .line 28
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoGenerateIndex:I

    .line 29
    .line 30
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->addedTrackCount:I

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNoMoreFrames:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 35
    .line 36
    return-void
.end method

.method private computePresentationTime(JI)J
    .locals 2

    .line 1
    const-wide/32 v0, 0xf4240

    .line 2
    .line 3
    .line 4
    mul-long/2addr p1, v0

    .line 5
    int-to-long v0, p3

    .line 6
    div-long/2addr p1, v0

    .line 7
    const-wide/16 v0, 0x84

    .line 8
    .line 9
    add-long/2addr p1, v0

    .line 10
    return-wide p1
.end method

.method public static findColorFormats(I[I)Z
    .locals 4

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_1

    .line 5
    .line 6
    aget v3, p1, v2

    .line 7
    .line 8
    if-ne v3, p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    return v1
.end method

.method private getInputBuffer(I)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static getMediaCodecInfo()I
    .locals 10

    .line 1
    const/4 v0, -0x1

    .line 2
    :try_start_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x0

    .line 7
    sput-object v2, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->codecInfo:Landroid/media/MediaCodecInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    const-string v4, "video/avc"

    .line 12
    .line 13
    if-ge v3, v1, :cond_4

    .line 14
    .line 15
    :try_start_1
    sget-object v5, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->codecInfo:Landroid/media/MediaCodecInfo;

    .line 16
    .line 17
    if-nez v5, :cond_4

    .line 18
    .line 19
    invoke-static {v3}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    if-nez v6, :cond_0

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    move v7, v2

    .line 35
    move v8, v7

    .line 36
    :goto_1
    array-length v9, v6

    .line 37
    if-ge v7, v9, :cond_2

    .line 38
    .line 39
    if-nez v8, :cond_2

    .line 40
    .line 41
    aget-object v9, v6, v7

    .line 42
    .line 43
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v9

    .line 47
    if-eqz v9, :cond_1

    .line 48
    .line 49
    const/4 v8, 0x1

    .line 50
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :catch_0
    move-exception v1

    .line 54
    goto :goto_3

    .line 55
    :cond_2
    if-nez v8, :cond_3

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_3
    sput-object v5, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->codecInfo:Landroid/media/MediaCodecInfo;

    .line 59
    .line 60
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->codecInfo:Landroid/media/MediaCodecInfo;

    .line 64
    .line 65
    if-nez v1, :cond_5

    .line 66
    .line 67
    return v0

    .line 68
    :cond_5
    invoke-virtual {v1, v4}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 73
    .line 74
    new-instance v4, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v5, "codecInfoName:"

    .line 80
    .line 81
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    sget-object v5, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->codecInfo:Landroid/media/MediaCodecInfo;

    .line 85
    .line 86
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v5, " colorFormat:"

    .line 94
    .line 95
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v5, v1, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 99
    .line 100
    invoke-static {v5}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-static {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    iget-object v3, v1, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 115
    .line 116
    const/16 v4, 0x15

    .line 117
    .line 118
    invoke-static {v4, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->findColorFormats(I[I)Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_6

    .line 123
    .line 124
    sput v4, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->colorFormat:I

    .line 125
    .line 126
    return v2

    .line 127
    :cond_6
    iget-object v1, v1, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 128
    .line 129
    const/16 v3, 0x13

    .line 130
    .line 131
    invoke-static {v3, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->findColorFormats(I[I)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_7

    .line 136
    .line 137
    sput v3, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->colorFormat:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 138
    .line 139
    return v2

    .line 140
    :cond_7
    return v0

    .line 141
    :goto_3
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 142
    .line 143
    const-string v3, "get color format type error"

    .line 144
    .line 145
    invoke-static {v2, v3, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 146
    .line 147
    .line 148
    return v0
.end method

.method private getOutputBuffer(I)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxerSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 10
    .line 11
    const-string v3, "reset media codec"

    .line 12
    .line 13
    invoke-static {v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/media/MediaCodec;->reset()V

    .line 19
    .line 20
    .line 21
    const-string v3, "stop media codec"

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 29
    .line 30
    .line 31
    const-string v3, "Release media codec"

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 39
    .line 40
    .line 41
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 42
    .line 43
    const-string v3, "RELEASE Video CODEC"

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 56
    .line 57
    const-string v3, "Stop media muxer"

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 63
    .line 64
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->stop()V

    .line 65
    .line 66
    .line 67
    const-string v3, "Release media muxer"

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 73
    .line 74
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->release()V

    .line 75
    .line 76
    .line 77
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    iput-boolean v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isMediaMuxerStarted:Z

    .line 81
    .line 82
    const-string v3, "RELEASE MUXER"

    .line 83
    .line 84
    invoke-static {v1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxerFormat:Landroid/media/MediaFormat;

    .line 88
    .line 89
    monitor-exit v0

    .line 90
    return-void

    .line 91
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    throw p0
.end method

.method private startMediaMuxer(Landroid/media/MediaFormat;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxerSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isMediaMuxerStarted:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxerFormat:Landroid/media/MediaFormat;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p1}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_3

    .line 32
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->stop()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-exception v1

    .line 39
    :try_start_2
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 40
    .line 41
    const-string v3, "media muxer stop failed:"

    .line 42
    .line 43
    invoke-static {v2, v3, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->release()V

    .line 49
    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isMediaMuxerStarted:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    .line 57
    :try_start_3
    new-instance v2, Landroid/media/MediaMuxer;

    .line 58
    .line 59
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->outputFileString:Ljava/lang/String;

    .line 60
    .line 61
    invoke-direct {v2, v3, v1}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :catch_1
    move-exception p0

    .line 68
    :try_start_4
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 69
    .line 70
    const-string v1, "Unable to get path for "

    .line 71
    .line 72
    invoke-static {p1, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    monitor-exit v0

    .line 76
    goto :goto_2

    .line 77
    :cond_1
    :goto_1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxerFormat:Landroid/media/MediaFormat;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 80
    .line 81
    invoke-virtual {v1, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoTrackIndex:I

    .line 86
    .line 87
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->addedTrackCount:I

    .line 88
    .line 89
    const/4 v1, 0x1

    .line 90
    add-int/2addr p1, v1

    .line 91
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->addedTrackCount:I

    .line 92
    .line 93
    if-lt p1, v1, :cond_2

    .line 94
    .line 95
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 96
    .line 97
    const-string v2, "Media muxer is starting..."

    .line 98
    .line 99
    invoke-static {p1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/media/MediaMuxer;->start()V

    .line 105
    .line 106
    .line 107
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isMediaMuxerStarted:Z

    .line 108
    .line 109
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxerSync:Ljava/lang/Object;

    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 112
    .line 113
    .line 114
    :cond_2
    monitor-exit v0

    .line 115
    :goto_2
    return-void

    .line 116
    :goto_3
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 117
    throw p0
.end method


# virtual methods
.method public abortEncoding()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mOutputFile:Ljava/io/File;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "Clean up record file"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mOutputFile:Ljava/io/File;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mOutputFile:Ljava/io/File;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 24
    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "Aborting encoding"

    .line 35
    .line 36
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->release()V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNoMoreFrames:Z

    .line 44
    .line 45
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncodeQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mFrameSync:Ljava/lang/Object;

    .line 53
    .line 54
    monitor-enter v0

    .line 55
    :try_start_0
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNewFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    const-wide/16 v3, 0x0

    .line 64
    .line 65
    cmp-long v1, v1, v3

    .line 66
    .line 67
    if-lez v1, :cond_2

    .line 68
    .line 69
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNewFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    :goto_0
    monitor-exit v0

    .line 78
    return-void

    .line 79
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    throw p0

    .line 81
    :cond_3
    :goto_2
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 82
    .line 83
    const-string v0, "Failed to abort encoding since it never started"

    .line 84
    .line 85
    invoke-static {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public clearCache()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mOutputFile:Ljava/io/File;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const-string v2, "Clean up record file"

    .line 9
    .line 10
    invoke-static {v0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mOutputFile:Ljava/io/File;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mOutputFile:Ljava/io/File;

    .line 19
    .line 20
    :cond_0
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    :try_start_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception v0

    .line 36
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 37
    .line 38
    const-string v3, "restart:stop video error"

    .line 39
    .line 40
    invoke-static {v2, v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncodeQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 56
    .line 57
    return-void
.end method

.method public encode(I)V
    .locals 13

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "Encoder started"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNoMoreFrames:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncodeQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncodeQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mFrameSync:Ljava/lang/Object;

    .line 38
    .line 39
    monitor-enter v2

    .line 40
    :try_start_0
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNewFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 46
    .line 47
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :try_start_1
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catch_0
    move-exception v0

    .line 53
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 54
    .line 55
    const-string v3, "Queueing frame"

    .line 56
    .line 57
    invoke-static {v2, v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncodeQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    move-object p0, v0

    .line 71
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    throw p0

    .line 73
    :cond_1
    :goto_1
    const/4 v2, 0x0

    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 77
    .line 78
    const-string p1, "encode data is Null!!: "

    .line 79
    .line 80
    invoke-static {p0, p1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 85
    .line 86
    const-wide/32 v4, 0x30d40

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    iget v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoGenerateIndex:I

    .line 94
    .line 95
    int-to-long v8, v3

    .line 96
    invoke-direct {p0, v8, v9, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->computePresentationTime(JI)J

    .line 97
    .line 98
    .line 99
    move-result-wide v10

    .line 100
    if-ltz v7, :cond_3

    .line 101
    .line 102
    invoke-direct {p0, v7}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 107
    .line 108
    .line 109
    iget-object v3, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 110
    .line 111
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    .line 114
    iget-object v6, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 115
    .line 116
    iget-object p1, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 117
    .line 118
    array-length v9, p1

    .line 119
    const/4 v8, 0x0

    .line 120
    const/4 v12, 0x0

    .line 121
    invoke-virtual/range {v6 .. v12}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 122
    .line 123
    .line 124
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoGenerateIndex:I

    .line 125
    .line 126
    add-int/2addr p1, v1

    .line 127
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoGenerateIndex:I

    .line 128
    .line 129
    :cond_3
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    .line 130
    .line 131
    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 135
    .line 136
    invoke-virtual {v0, p1, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    const/4 v1, -0x1

    .line 141
    if-ne v0, v1, :cond_4

    .line 142
    .line 143
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 144
    .line 145
    const-string p1, "No output from encoder available"

    .line 146
    .line 147
    invoke-static {p0, p1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    goto/16 :goto_2

    .line 151
    .line 152
    :cond_4
    const/4 v1, -0x2

    .line 153
    if-ne v0, v1, :cond_5

    .line 154
    .line 155
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 156
    .line 157
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-direct {p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->startMediaMuxer(Landroid/media/MediaFormat;)V

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_5
    if-gez v0, :cond_6

    .line 166
    .line 167
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 168
    .line 169
    new-instance p1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v1, "unexpected result from encoder.dequeueOutputBuffer: "

    .line 172
    .line 173
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-static {p0, p1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_6
    iget v1, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 188
    .line 189
    if-eqz v1, :cond_8

    .line 190
    .line 191
    invoke-direct {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    if-nez v1, :cond_7

    .line 196
    .line 197
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 198
    .line 199
    new-instance p1, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    const-string v1, "encoderOutputBuffer "

    .line 202
    .line 203
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string v0, " was null"

    .line 210
    .line 211
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-static {p0, p1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 219
    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_7
    iget v2, p1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 223
    .line 224
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 225
    .line 226
    .line 227
    iget v2, p1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 228
    .line 229
    iget v3, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 230
    .line 231
    add-int/2addr v2, v3

    .line 232
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 233
    .line 234
    .line 235
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 236
    .line 237
    new-instance v3, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    const-string v4, "media muxer write video data outputindex "

    .line 240
    .line 241
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoGenerateIndex:I

    .line 245
    .line 246
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v3

    .line 253
    invoke-static {v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 254
    .line 255
    .line 256
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 257
    .line 258
    monitor-enter v2

    .line 259
    :try_start_3
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 260
    .line 261
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoTrackIndex:I

    .line 262
    .line 263
    invoke-virtual {v3, v4, v1, p1}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 264
    .line 265
    .line 266
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 267
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 268
    .line 269
    const/4 p1, 0x0

    .line 270
    invoke-virtual {p0, v0, p1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 271
    .line 272
    .line 273
    goto :goto_2

    .line 274
    :catchall_1
    move-exception v0

    .line 275
    move-object p0, v0

    .line 276
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 277
    throw p0

    .line 278
    :cond_8
    :goto_2
    return-void

    .line 279
    :cond_9
    const-string p0, "encode not started"

    .line 280
    .line 281
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public getCodecInfo()Landroid/media/MediaCodecInfo;
    .locals 0

    .line 1
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->codecInfo:Landroid/media/MediaCodecInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorFormat()I
    .locals 0

    .line 1
    sget p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->colorFormat:I

    .line 2
    .line 3
    return p0
.end method

.method public getSupportCodecJSONStr()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->codecInfo:Landroid/media/MediaCodecInfo;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, "codecInfo null"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    const-string v1, "codec_info:"

    .line 18
    .line 19
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 20
    .line 21
    .line 22
    const-string v0, "color_format:"

    .line 23
    .line 24
    :try_start_2
    sget v1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->colorFormat:I

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :catch_0
    move-exception v0

    .line 31
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "video encode make json error:"

    .line 34
    .line 35
    invoke-static {v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    :goto_1
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public isEncodingStarted()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 2
    .line 3
    return p0
.end method

.method public queueFrame(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 7
    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "Queueing frame"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncodeQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mFrameSync:Ljava/lang/Object;

    .line 28
    .line 29
    monitor-enter p1

    .line 30
    :try_start_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNewFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    const-wide/16 v2, 0x0

    .line 39
    .line 40
    cmp-long v0, v0, v2

    .line 41
    .line 42
    if-lez v0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNewFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    :goto_0
    monitor-exit p1

    .line 53
    return-void

    .line 54
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_3
    :goto_2
    return-void
.end method

.method public startEncoding(IILjava/io/File;IIII)V
    .locals 4

    .line 1
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mOutputFile:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->outputFileString:Ljava/lang/String;

    .line 11
    .line 12
    sget-object p3, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "found codec: "

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->codecInfo:Landroid/media/MediaCodecInfo;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, "|colorFormat:"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget v1, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->colorFormat:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, "|width="

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v1, "|height="

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, "|videoRotation="

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {p3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    const-string v0, "video/avc"

    .line 72
    .line 73
    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget v2, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->colorFormat:I

    .line 78
    .line 79
    const-string v3, "color-format"

    .line 80
    .line 81
    invoke-virtual {v1, v3, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    const-string v2, "frame-rate"

    .line 85
    .line 86
    invoke-virtual {v1, v2, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    const-string p5, "bitrate"

    .line 90
    .line 91
    invoke-virtual {v1, p5, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 92
    .line 93
    .line 94
    const-string p4, "i-frame-interval"

    .line 95
    .line 96
    invoke-virtual {v1, p4, p6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 97
    .line 98
    .line 99
    const-string p4, "width"

    .line 100
    .line 101
    invoke-virtual {v1, p4, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 102
    .line 103
    .line 104
    const-string p1, "height"

    .line 105
    .line 106
    invoke-virtual {v1, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 107
    .line 108
    .line 109
    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 114
    .line 115
    const/4 p2, 0x0

    .line 116
    const/4 p4, 0x1

    .line 117
    invoke-virtual {p1, v1, p2, p2, p4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 121
    .line 122
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 126
    .line 127
    if-nez p1, :cond_1

    .line 128
    .line 129
    new-instance p1, Landroid/media/MediaMuxer;

    .line 130
    .line 131
    iget-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->outputFileString:Ljava/lang/String;

    .line 132
    .line 133
    const/4 p5, 0x0

    .line 134
    invoke-direct {p1, p2, p5}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 135
    .line 136
    .line 137
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 138
    .line 139
    if-nez p7, :cond_0

    .line 140
    .line 141
    const/16 p5, 0x5a

    .line 142
    .line 143
    :cond_0
    invoke-virtual {p1, p5}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 144
    .line 145
    .line 146
    :cond_1
    const-string p1, "Initialization complete. Starting encoder..."

    .line 147
    .line 148
    invoke-static {p3, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iput-boolean p4, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 152
    .line 153
    return-void
.end method

.method public stopEncoding()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->videoEncoder:Landroid/media/MediaCodec;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mediaMuxer:Landroid/media/MediaMuxer;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->TAG:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "Stopping encoding"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNoMoreFrames:Z

    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mFrameSync:Ljava/lang/Object;

    .line 24
    .line 25
    monitor-enter v0

    .line 26
    :try_start_0
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNewFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    const-wide/16 v3, 0x0

    .line 35
    .line 36
    cmp-long v1, v1, v3

    .line 37
    .line 38
    if-lez v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->mNewFrameLatch:Ljava/util/concurrent/CountDownLatch;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->release()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p0

    .line 55
    :cond_2
    :goto_2
    return-void
.end method
