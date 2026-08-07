.class Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xengine/media/MediacodecEncoderWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoEncodecThread"
.end annotation


# instance fields
.field private config:Lcom/momo/xengine/media/EncodeConfig;

.field private encoder:Landroid/media/MediaCodec;

.field private isExit:Z

.field private mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

.field private videoTrackIndex:I


# direct methods
.method public constructor <init>(Landroid/media/MediaCodec;Lcom/momo/xengine/media/EncodeConfig;Lcom/momo/xengine/media/Mp4MuxerWrapper;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->isExit:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->config:Lcom/momo/xengine/media/EncodeConfig;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public exit()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->isExit:Z

    .line 3
    .line 4
    return-void
.end method

.method public run()V
    .locals 10

    .line 1
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 5
    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 9
    .line 10
    if-eqz v1, :cond_5

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    iput v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->videoTrackIndex:I

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-boolean v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->isExit:Z

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 19
    .line 20
    .line 21
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v2, Lcom/momo/xengine/media/EncodeTimestampCalculator;

    .line 27
    .line 28
    invoke-direct {v2}, Lcom/momo/xengine/media/EncodeTimestampCalculator;-><init>()V

    .line 29
    .line 30
    .line 31
    :cond_0
    :goto_0
    iget-boolean v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->isExit:Z

    .line 32
    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->release()V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->config:Lcom/momo/xengine/media/EncodeConfig;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/media/MediaCodec;->stop()V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iget-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 57
    .line 58
    const-wide/16 v4, 0x2710

    .line 59
    .line 60
    invoke-virtual {v3, v0, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    const/4 v6, -0x2

    .line 65
    if-ne v3, v6, :cond_3

    .line 66
    .line 67
    iget-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 68
    .line 69
    iget-object v4, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 70
    .line 71
    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const/4 v5, 0x2

    .line 76
    invoke-virtual {v3, v4, v5}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->addMediaTrack(Landroid/media/MediaFormat;I)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    iput v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->videoTrackIndex:I

    .line 81
    .line 82
    iget-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 83
    .line 84
    invoke-virtual {v3}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->startMuxing()V

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 88
    .line 89
    invoke-virtual {v3}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->isStarting()Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-nez v3, :cond_0

    .line 94
    .line 95
    iget-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 96
    .line 97
    invoke-virtual {v3}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->isStarting()Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-eqz v3, :cond_2

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    :goto_1
    if-ltz v3, :cond_0

    .line 105
    .line 106
    iget-object v6, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 107
    .line 108
    invoke-virtual {v6, v3}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    iget v7, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 113
    .line 114
    new-array v7, v7, [B

    .line 115
    .line 116
    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->isInit()Z

    .line 120
    .line 121
    .line 122
    move-result v7

    .line 123
    if-nez v7, :cond_4

    .line 124
    .line 125
    iget-wide v7, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 126
    .line 127
    invoke-virtual {v2, v7, v8}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->init(J)Z

    .line 128
    .line 129
    .line 130
    :cond_4
    invoke-virtual {v2}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->isInit()Z

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    if-eqz v7, :cond_3

    .line 135
    .line 136
    iget-wide v7, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 137
    .line 138
    iget-object v9, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->config:Lcom/momo/xengine/media/EncodeConfig;

    .line 139
    .line 140
    invoke-virtual {v9}, Lcom/momo/xengine/media/EncodeConfig;->getSpeed()F

    .line 141
    .line 142
    .line 143
    move-result v9

    .line 144
    invoke-virtual {v2, v7, v8, v9}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->calculateTimestamp(JF)J

    .line 145
    .line 146
    .line 147
    move-result-wide v7

    .line 148
    iput-wide v7, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 149
    .line 150
    iget-object v7, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->mediaMuxer:Lcom/momo/xengine/media/Mp4MuxerWrapper;

    .line 151
    .line 152
    iget v8, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->videoTrackIndex:I

    .line 153
    .line 154
    invoke-virtual {v7, v8, v6, v0}, Lcom/momo/xengine/media/Mp4MuxerWrapper;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 155
    .line 156
    .line 157
    iget-object v6, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 158
    .line 159
    invoke-virtual {v6, v3, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 160
    .line 161
    .line 162
    iget-object v3, p0, Lcom/momo/xengine/media/MediacodecEncoderWrapper$VideoEncodecThread;->encoder:Landroid/media/MediaCodec;

    .line 163
    .line 164
    invoke-virtual {v3, v0, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    goto :goto_1

    .line 169
    :cond_5
    return-void
.end method
