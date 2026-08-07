.class public Lcom/immomo/moment/mediautils/FFVideoDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FFVideoDecoder"


# instance fields
.field audioFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

.field private decoderHandler:J

.field mAudioPacket:Ll/ad60;

.field mVideoPacket:Ll/ad60;

.field videoFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "cosmosffmpeg"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "mediadecoder"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;-><init>(Lcom/immomo/moment/mediautils/FFVideoDecoder;Lcom/immomo/moment/mediautils/FFVideoDecoder$1;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->videoFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 13
    .line 14
    invoke-direct {v0, p0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;-><init>(Lcom/immomo/moment/mediautils/FFVideoDecoder;Lcom/immomo/moment/mediautils/FFVideoDecoder$1;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->audioFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeCreateNewDecoder()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 28
    .line 29
    new-instance v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 30
    .line 31
    invoke-direct {v0, p0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;-><init>(Lcom/immomo/moment/mediautils/FFVideoDecoder;Lcom/immomo/moment/mediautils/FFVideoDecoder$1;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->videoFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 35
    .line 36
    new-instance v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 37
    .line 38
    invoke-direct {v0, p0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;-><init>(Lcom/immomo/moment/mediautils/FFVideoDecoder;Lcom/immomo/moment/mediautils/FFVideoDecoder$1;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->audioFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 42
    .line 43
    return-void
.end method

.method private native nativeCreateNewDecoder()J
.end method

.method private native nativeDestroyDecoder(J)V
.end method

.method private native nativeGetAudioFrame(JLcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;)I
.end method

.method private native nativeGetAudioFrameCnt(J)I
.end method

.method private native nativeGetBits(J)I
.end method

.method private native nativeGetChannels(J)I
.end method

.method private native nativeGetDuration(J)I
.end method

.method private native nativeGetFPS(J)I
.end method

.method private native nativeGetHeight(J)I
.end method

.method private native nativeGetRotation(J)I
.end method

.method private native nativeGetSampleRate(J)I
.end method

.method private native nativeGetStatus(J)I
.end method

.method private native nativeGetVideoFrame(JLcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;)I
.end method

.method private native nativeGetVideoFrameCnt(J)I
.end method

.method private native nativeGetWidth(J)I
.end method

.method private native nativePause(J)V
.end method

.method private native nativePrepare(J)Z
.end method

.method private native nativeRelease(J)I
.end method

.method private native nativeResume(J)V
.end method

.method private native nativeSeek(JJ)V
.end method

.method private native nativeSelectMeidaTrack(JI)V
.end method

.method private native nativeSetDataSource(JLjava/lang/String;)V
.end method

.method private native nativeSetMediaRange(JJJZ)V
.end method

.method private native nativeSetOutMediaInfo(JIII)V
.end method

.method private native nativeSetOutputAudioInfo(JIII)V
.end method

.method private native nativeSetSeekPauseFlag(JZ)I
.end method

.method private native nativeStart(J)Z
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

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
    const-string v0, "FFVideoDecoder"

    .line 11
    .line 12
    const-string v1, "destroy decoder "

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 18
    .line 19
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeDestroyDecoder(J)V

    .line 20
    .line 21
    .line 22
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

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
    monitor-exit p0

    .line 28
    return-void

    .line 29
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v0
.end method

.method public getAudioBits()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetBits(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getAudioChannel()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetChannels(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public declared-synchronized getAudioFrame()Ll/ad60;
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 3
    .line 4
    iget-object v2, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->audioFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 5
    .line 6
    invoke-direct {p0, v0, v1, v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetAudioFrame(JLcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->audioFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->frame:[B

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mAudioPacket:Ll/ad60;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mAudioPacket:Ll/ad60;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 37
    .line 38
    iget-object v1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->audioFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->frame:[B

    .line 41
    .line 42
    array-length v1, v1

    .line 43
    if-eq v0, v1, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->audioFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->frame:[B

    .line 51
    .line 52
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/ad60;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;)V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mAudioPacket:Ll/ad60;

    .line 62
    .line 63
    :cond_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mAudioPacket:Ll/ad60;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->audioFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 66
    .line 67
    iget v3, v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->size:I

    .line 68
    .line 69
    iget-wide v0, v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->pts:J

    .line 70
    .line 71
    const-wide/16 v4, 0x3e8

    .line 72
    .line 73
    mul-long v6, v0, v4

    .line 74
    .line 75
    const/4 v8, 0x0

    .line 76
    const/4 v4, 0x0

    .line 77
    const/4 v5, 0x0

    .line 78
    invoke-virtual/range {v2 .. v8}, Ll/ad60;->d(IIIJI)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mAudioPacket:Ll/ad60;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    monitor-exit p0

    .line 84
    return-object v0

    .line 85
    :cond_2
    monitor-exit p0

    .line 86
    const/4 p0, 0x0

    .line 87
    return-object p0

    .line 88
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    throw v0
.end method

.method public getAudioFrameCnt()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetAudioFrameCnt(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getFps()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetFPS(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getHeight()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetHeight(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getRotation()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetRotation(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getSampleRate()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetSampleRate(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public declared-synchronized getStatus()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetStatus(J)I

    .line 11
    .line 12
    .line 13
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    monitor-exit p0

    .line 15
    return v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    monitor-exit p0

    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public declared-synchronized getVideoDuration()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetDuration(J)I

    .line 11
    .line 12
    .line 13
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    monitor-exit p0

    .line 15
    return v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    monitor-exit p0

    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public declared-synchronized getVideoFrame()Ll/ad60;
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 3
    .line 4
    iget-object v2, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->videoFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 5
    .line 6
    invoke-direct {p0, v0, v1, v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetVideoFrame(JLcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->videoFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->frame:[B

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mVideoPacket:Ll/ad60;

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/ad60;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mVideoPacket:Ll/ad60;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mVideoPacket:Ll/ad60;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->videoFrame:Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;

    .line 41
    .line 42
    iget v2, v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->size:I

    .line 43
    .line 44
    iget-wide v3, v0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->pts:J

    .line 45
    .line 46
    const-wide/16 v5, 0x3e8

    .line 47
    .line 48
    mul-long/2addr v5, v3

    .line 49
    const/4 v7, 0x0

    .line 50
    const/4 v3, 0x0

    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-virtual/range {v1 .. v7}, Ll/ad60;->d(IIIJI)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->mVideoPacket:Ll/ad60;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-object v0

    .line 59
    :cond_1
    monitor-exit p0

    .line 60
    const/4 p0, 0x0

    .line 61
    return-object p0

    .line 62
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    throw v0
.end method

.method public getVideoFrameCnt()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetVideoFrameCnt(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getWidth()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeGetWidth(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public declared-synchronized pause()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativePause(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public prepare()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativePrepare(J)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public declared-synchronized release()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeRelease(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public resume()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeResume(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public declared-synchronized seek(J)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeSeek(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method public selectMeidaTrack(I)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1, p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeSelectMeidaTrack(JI)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setDataSource(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1, p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeSetDataSource(JLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setDecoderRange(JJZ)V
    .locals 8

    .line 1
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-wide v3, p1

    .line 11
    move-wide v5, p3

    .line 12
    move v7, p5

    .line 13
    invoke-direct/range {v0 .. v7}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeSetMediaRange(JJJZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setOutAudioInfo(III)V
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move v3, p1

    .line 11
    move v4, p2

    .line 12
    move v5, p3

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeSetOutputAudioInfo(JIII)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setOutVideoInfo(III)V
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move v3, p1

    .line 11
    move v4, p2

    .line 12
    move v5, p3

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeSetOutMediaInfo(JIII)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setSeekPauseFlag(Z)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1, p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeSetSeekPauseFlag(JZ)I

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public start()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder;->decoderHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->nativeStart(J)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method
