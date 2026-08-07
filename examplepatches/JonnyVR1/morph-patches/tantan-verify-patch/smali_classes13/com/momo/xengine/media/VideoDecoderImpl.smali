.class final Lcom/momo/xengine/media/VideoDecoderImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IVideoDecoder;


# instance fields
.field private pointer:J

.field private final sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;


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
    iput-wide v0, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->pointer:J

    .line 7
    .line 8
    new-instance v0, Lcom/momo/xengine/media/types/VideoFrame;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/momo/xengine/media/types/VideoFrame;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 14
    .line 15
    return-void
.end method

.method private static isFileExists(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private native nativeGetVideoFrameAt(JLcom/momo/xengine/media/types/VideoFrame;JI)Z
.end method

.method private native nativeGetVideoFrameInMicrosecond(JLcom/momo/xengine/media/types/VideoFrame;J)Z
.end method

.method private native nativeInit(Ljava/lang/String;I)J
.end method

.method private native nativeRelease(J)V
.end method


# virtual methods
.method public getFrameAt(JI)Lcom/momo/xengine/media/types/VideoFrame;
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v2, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->pointer:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, v2, v0

    .line 7
    .line 8
    const/4 v8, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    return-object v8

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    move-object p1, v0

    .line 15
    move-object v1, p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :try_start_2
    iget-object v4, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 18
    .line 19
    move-object v1, p0

    .line 20
    move-wide v5, p1

    .line 21
    move v7, p3

    .line 22
    :try_start_3
    invoke-direct/range {v1 .. v7}, Lcom/momo/xengine/media/VideoDecoderImpl;->nativeGetVideoFrameAt(JLcom/momo/xengine/media/types/VideoFrame;JI)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    iget-object p0, v1, Lcom/momo/xengine/media/VideoDecoderImpl;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 29
    .line 30
    monitor-exit v1

    .line 31
    return-object p0

    .line 32
    :catchall_1
    move-exception v0

    .line 33
    :goto_0
    move-object p1, v0

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    monitor-exit v1

    .line 36
    return-object v8

    .line 37
    :catchall_2
    move-exception v0

    .line 38
    move-object v1, p0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 41
    throw p1
.end method

.method public getFrameInMicrosecond(J)Lcom/momo/xengine/media/types/VideoFrame;
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v2, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->pointer:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, v2, v0

    .line 7
    .line 8
    const/4 v7, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    return-object v7

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    move-object p1, v0

    .line 15
    move-object v1, p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :try_start_2
    iget-object v4, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 18
    .line 19
    move-object v1, p0

    .line 20
    move-wide v5, p1

    .line 21
    :try_start_3
    invoke-direct/range {v1 .. v6}, Lcom/momo/xengine/media/VideoDecoderImpl;->nativeGetVideoFrameInMicrosecond(JLcom/momo/xengine/media/types/VideoFrame;J)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    iget-object p0, v1, Lcom/momo/xengine/media/VideoDecoderImpl;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 28
    .line 29
    monitor-exit v1

    .line 30
    return-object p0

    .line 31
    :catchall_1
    move-exception v0

    .line 32
    :goto_0
    move-object p1, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    monitor-exit v1

    .line 35
    return-object v7

    .line 36
    :catchall_2
    move-exception v0

    .line 37
    move-object v1, p0

    .line 38
    goto :goto_0

    .line 39
    :goto_1
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 40
    throw p1
.end method

.method public init(Lcom/momo/xengine/media/DecodeConfig;)V
    .locals 4
    .param p1    # Lcom/momo/xengine/media/DecodeConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getPath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/momo/xengine/media/VideoDecoderImpl;->isFileExists(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    monitor-enter p0

    .line 13
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->pointer:J

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto :goto_3

    .line 25
    :cond_1
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getScale_format()Lcom/momo/xengine/media/types/PixelFormat;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_RGBA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 30
    .line 31
    if-eq v0, v1, :cond_5

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getScale_format()Lcom/momo/xengine/media/types/PixelFormat;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_BGRA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 38
    .line 39
    if-ne v0, v1, :cond_2

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getScale_format()Lcom/momo/xengine/media/types/PixelFormat;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I420:Lcom/momo/xengine/media/types/PixelFormat;

    .line 47
    .line 48
    if-eq v0, v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getScale_format()Lcom/momo/xengine/media/types/PixelFormat;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV12:Lcom/momo/xengine/media/types/PixelFormat;

    .line 55
    .line 56
    if-eq v0, v1, :cond_4

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getScale_format()Lcom/momo/xengine/media/types/PixelFormat;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV21:Lcom/momo/xengine/media/types/PixelFormat;

    .line 63
    .line 64
    if-ne v0, v1, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    iput-wide v2, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->pointer:J

    .line 68
    .line 69
    monitor-exit p0

    .line 70
    return-void

    .line 71
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getWidth()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    mul-int/2addr v1, v2

    .line 82
    mul-int/lit8 v1, v1, 0x3

    .line 83
    .line 84
    div-int/lit8 v1, v1, 0x2

    .line 85
    .line 86
    new-array v1, v1, [B

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/momo/xengine/media/types/VideoFrame;->setData([B)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getHeight()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    mul-int/2addr v1, v2

    .line 103
    mul-int/lit8 v1, v1, 0x4

    .line 104
    .line 105
    new-array v1, v1, [B

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lcom/momo/xengine/media/types/VideoFrame;->setData([B)V

    .line 108
    .line 109
    .line 110
    :goto_2
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getPath()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1}, Lcom/momo/xengine/media/DecodeConfig;->getScale_format()Lcom/momo/xengine/media/types/PixelFormat;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/PixelFormat;->getValue()I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    invoke-direct {p0, v0, p1}, Lcom/momo/xengine/media/VideoDecoderImpl;->nativeInit(Ljava/lang/String;I)J

    .line 123
    .line 124
    .line 125
    move-result-wide v0

    .line 126
    iput-wide v0, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->pointer:J

    .line 127
    .line 128
    monitor-exit p0

    .line 129
    return-void

    .line 130
    :goto_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    throw p1
.end method

.method public release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->pointer:J

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
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoDecoderImpl;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momo/xengine/media/VideoDecoderImpl;->pointer:J

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
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw v0
.end method
