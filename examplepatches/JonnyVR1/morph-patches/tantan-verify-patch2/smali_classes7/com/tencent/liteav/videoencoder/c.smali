.class public Lcom/tencent/liteav/videoencoder/c;
.super Lcom/tencent/liteav/basic/module/a;
.source "SourceFile"


# instance fields
.field protected mEnableXMirror:Z

.field protected mEncFmt:Lorg/json/JSONArray;

.field protected mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

.field private mEncodeFirstGOP:Z

.field protected mGLContextExternal:Ljava/lang/Object;

.field protected mInit:Z

.field protected mInputFilter:Lcom/tencent/liteav/basic/c/h;

.field protected mInputHeight:I

.field protected mInputTextureID:I

.field protected mInputWidth:I

.field protected mListener:Lcom/tencent/liteav/videoencoder/d;

.field protected mOutputHeight:I

.field protected mOutputWidth:I

.field protected mRotation:I

.field protected mStreamType:I

.field private mVideoGOPEncode:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/module/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mInputWidth:I

    .line 9
    .line 10
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mInputHeight:I

    .line 11
    .line 12
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 13
    .line 14
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 15
    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, p0, Lcom/tencent/liteav/videoencoder/c;->mInputTextureID:I

    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/c;->mGLContextExternal:Ljava/lang/Object;

    .line 20
    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    iput-wide v2, p0, Lcom/tencent/liteav/videoencoder/c;->mVideoGOPEncode:J

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFirstGOP:Z

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    iput v2, p0, Lcom/tencent/liteav/videoencoder/c;->mStreamType:I

    .line 29
    .line 30
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mRotation:I

    .line 31
    .line 32
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/c;->mEncFmt:Lorg/json/JSONArray;

    .line 33
    .line 34
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/c;->mEnableXMirror:Z

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public callDelegate(I)V
    .locals 18

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    move-object/from16 v0, p0

    move/from16 v15, p1

    .line 125
    invoke-virtual/range {v0 .. v17}, Lcom/tencent/liteav/videoencoder/c;->callDelegate([BIJJJJJJILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    return-void
.end method

.method public callDelegate(Landroid/media/MediaFormat;)V
    .locals 0

    .line 126
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    if-eqz p0, :cond_0

    .line 127
    invoke-interface {p0, p1}, Lcom/tencent/liteav/videoencoder/d;->a(Landroid/media/MediaFormat;)V

    :cond_0
    return-void
.end method

.method public callDelegate([BIJJJJJJILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 9

    .line 1
    move-object/from16 v0, p17

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p16, :cond_0

    .line 5
    .line 6
    move-object v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual/range {p16 .. p16}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    :goto_0
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_1
    move-object v3, v1

    .line 15
    goto :goto_2

    .line 16
    :cond_1
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 17
    .line 18
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :goto_2
    if-eqz v3, :cond_2

    .line 23
    .line 24
    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 25
    .line 26
    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 27
    .line 28
    iget-wide v6, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 29
    .line 30
    iget v8, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 31
    .line 32
    invoke-virtual/range {v3 .. v8}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 36
    .line 37
    if-eqz v0, :cond_6

    .line 38
    .line 39
    new-instance v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;

    .line 40
    .line 41
    invoke-direct {v1}, Lcom/tencent/liteav/basic/structs/TXSNALPacket;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 45
    .line 46
    iput p2, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 47
    .line 48
    iput-wide p3, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->gopIndex:J

    .line 49
    .line 50
    iput-wide p5, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->gopFrameIndex:J

    .line 51
    .line 52
    move-wide/from16 p3, p7

    .line 53
    .line 54
    iput-wide p3, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->frameIndex:J

    .line 55
    .line 56
    move-wide/from16 p3, p9

    .line 57
    .line 58
    iput-wide p3, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->refFremeIndex:J

    .line 59
    .line 60
    move-wide/from16 p3, p11

    .line 61
    .line 62
    iput-wide p3, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 63
    .line 64
    move-wide/from16 p3, p13

    .line 65
    .line 66
    iput-wide p3, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 67
    .line 68
    iput-object v2, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->buffer:Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    iget p1, p0, Lcom/tencent/liteav/videoencoder/c;->mStreamType:I

    .line 71
    .line 72
    iput p1, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->streamType:I

    .line 73
    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    iput-object v3, v1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->info:Landroid/media/MediaCodec$BufferInfo;

    .line 77
    .line 78
    :cond_3
    move/from16 p1, p15

    .line 79
    .line 80
    invoke-interface {v0, v1, p1}, Lcom/tencent/liteav/videoencoder/d;->a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;I)V

    .line 81
    .line 82
    .line 83
    iget-wide p3, p0, Lcom/tencent/liteav/videoencoder/c;->mVideoGOPEncode:J

    .line 84
    .line 85
    const-wide/16 v0, 0x1

    .line 86
    .line 87
    const/16 p1, 0xfa6

    .line 88
    .line 89
    if-nez p2, :cond_5

    .line 90
    .line 91
    const-wide/16 v2, 0x0

    .line 92
    .line 93
    cmp-long p2, p3, v2

    .line 94
    .line 95
    if-eqz p2, :cond_4

    .line 96
    .line 97
    const/4 p2, 0x1

    .line 98
    iput-boolean p2, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFirstGOP:Z

    .line 99
    .line 100
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    :cond_4
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/c;->mVideoGOPEncode:J

    .line 108
    .line 109
    return-void

    .line 110
    :cond_5
    add-long/2addr p3, v0

    .line 111
    iput-wide p3, p0, Lcom/tencent/liteav/videoencoder/c;->mVideoGOPEncode:J

    .line 112
    .line 113
    iget-boolean p2, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFirstGOP:Z

    .line 114
    .line 115
    if-nez p2, :cond_6

    .line 116
    .line 117
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :cond_6
    return-void
.end method

.method public enableNearestRPS(I)V
    .locals 0

    return-void
.end method

.method public getEncodeCost()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getRealBitrate()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getRealFPS()D
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public onEncodeFinished(IJJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p5}, Lcom/tencent/liteav/videoencoder/d;->a(IJJ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pushVideoFrame(IIIJ)J
    .locals 0

    const-wide/32 p0, 0x989682

    return-wide p0
.end method

.method public pushVideoFrameAsync(IIIJ)J
    .locals 0

    const-wide/32 p0, 0x989682

    return-wide p0
.end method

.method public pushVideoFrameSync(IIIJ)J
    .locals 0

    const-wide/32 p0, 0x989682

    return-wide p0
.end method

.method public restartIDR()V
    .locals 0

    return-void
.end method

.method public setBitrate(I)V
    .locals 0

    return-void
.end method

.method public setBitrateFromQos(II)V
    .locals 0

    return-void
.end method

.method public setEncodeIdrFpsFromQos(I)V
    .locals 0

    return-void
.end method

.method public setFPS(I)V
    .locals 0

    return-void
.end method

.method public setListener(Lcom/tencent/liteav/videoencoder/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 2
    .line 3
    return-void
.end method

.method public setRPSRefBitmap(IIJ)V
    .locals 0

    return-void
.end method

.method public setRotation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/videoencoder/c;->mRotation:I

    .line 2
    .line 3
    return-void
.end method

.method public setXMirror(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/videoencoder/c;->mEnableXMirror:Z

    .line 2
    .line 3
    return-void
.end method

.method public signalEOSAndFlush()V
    .locals 0

    return-void
.end method

.method public start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 4
    .line 5
    iput v0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 6
    .line 7
    iget v1, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 8
    .line 9
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/videoencoder/c;->mInputWidth:I

    .line 12
    .line 13
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mInputHeight:I

    .line 14
    .line 15
    iget-object v0, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->glContext:Ljava/lang/Object;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/c;->mGLContextExternal:Ljava/lang/Object;

    .line 18
    .line 19
    iget v0, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->streamType:I

    .line 20
    .line 21
    iput v0, p0, Lcom/tencent/liteav/videoencoder/c;->mStreamType:I

    .line 22
    .line 23
    iget-object p1, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encFmt:Lorg/json/JSONArray;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/c;->mEncFmt:Lorg/json/JSONArray;

    .line 26
    .line 27
    :cond_0
    const-wide/16 v0, 0x0

    .line 28
    .line 29
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/c;->mVideoGOPEncode:J

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/tencent/liteav/videoencoder/c;->mEncodeFirstGOP:Z

    .line 33
    .line 34
    const p0, 0x989682

    .line 35
    .line 36
    .line 37
    return p0
.end method

.method public stop()V
    .locals 0

    return-void
.end method
