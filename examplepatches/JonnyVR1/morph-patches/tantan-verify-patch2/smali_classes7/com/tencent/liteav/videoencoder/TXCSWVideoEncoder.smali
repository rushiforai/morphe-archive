.class public Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;
.super Lcom/tencent/liteav/videoencoder/c;
.source "SourceFile"


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "TXCSWVideoEncoder"


# instance fields
.field private mBitrate:I

.field private mNativeEncoder:J

.field private mPTS:J

.field private mPopIdx:I

.field private mPushIdx:I

.field private mRawFrameFilter:Lcom/tencent/liteav/basic/c/h;

.field private mRendIdx:I

.field private mResizeFilter:Lcom/tencent/liteav/basic/c/h;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->f()Z

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeClassInit()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/c;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput v2, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mBitrate:I

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mPTS:J

    .line 12
    .line 13
    iput v2, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mPushIdx:I

    .line 14
    .line 15
    iput v2, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mRendIdx:I

    .line 16
    .line 17
    iput v2, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mPopIdx:I

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$100(Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mPTS:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$200(Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;JIIIJ)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeEncodeSync(JIIIJ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$300(Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;JIIIJ)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeEncode(JIIIJ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static getAndIncreaseGopIndex()J
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeGetAndIncreaseGopIndex()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static getAndIncreateSeq()J
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeGetAndIncreaseSeq()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method private static native nativeClassInit()V
.end method

.method private native nativeEnableNearestRPS(JI)V
.end method

.method private native nativeEncode(JIIIJ)I
.end method

.method private native nativeEncodeSync(JIIIJ)I
.end method

.method private static native nativeGetAndIncreaseGopIndex()J
.end method

.method private static native nativeGetAndIncreaseSeq()J
.end method

.method private native nativeGetRealFPS(J)J
.end method

.method private native nativeInit(Ljava/lang/ref/WeakReference;)J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;",
            ">;)J"
        }
    .end annotation
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeRestartIDR(J)V
.end method

.method private native nativeSetBitrate(JI)V
.end method

.method private native nativeSetBitrateFromQos(JII)V
.end method

.method private native nativeSetEncodeIdrFpsFromQos(JI)V
.end method

.method private native nativeSetFPS(JI)V
.end method

.method private native nativeSetID(JLjava/lang/String;)V
.end method

.method private native nativeSetRPSRefBitmap(JIIJ)V
.end method

.method private native nativeSignalEOSAndFlush(J)V
.end method

.method private native nativeStart(JLcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I
.end method

.method private native nativeStop(J)V
.end method

.method private native nativegetRealBitrate(J)J
.end method

.method private static onEncodeFinishedFromNative(Ljava/lang/ref/WeakReference;IJJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;",
            ">;IJJ)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move v1, p1

    .line 11
    move-wide v2, p2

    .line 12
    move-wide v4, p4

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/videoencoder/c;->onEncodeFinished(IJJ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private static postEventFromNative(Ljava/lang/ref/WeakReference;[BIJJJJJJI)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;",
            ">;[BIJJJJJJI)V"
        }
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v1, v0

    .line 6
    check-cast v1, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/16 v17, 0x0

    .line 11
    .line 12
    const/16 v18, 0x0

    .line 13
    .line 14
    move-object/from16 v2, p1

    .line 15
    .line 16
    move/from16 v3, p2

    .line 17
    .line 18
    move-wide/from16 v4, p3

    .line 19
    .line 20
    move-wide/from16 v6, p5

    .line 21
    .line 22
    move-wide/from16 v8, p7

    .line 23
    .line 24
    move-wide/from16 v10, p9

    .line 25
    .line 26
    move-wide/from16 v12, p11

    .line 27
    .line 28
    move-wide/from16 v14, p13

    .line 29
    .line 30
    move/from16 v16, p15

    .line 31
    .line 32
    invoke-virtual/range {v1 .. v18}, Lcom/tencent/liteav/videoencoder/c;->callDelegate([BIJJJJJJILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private pushVideoFrameInternal(IIIJZ)J
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mResizeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mRawFrameFilter:Lcom/tencent/liteav/basic/c/h;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/c;->mGLContextExternal:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz v2, :cond_7

    .line 8
    .line 9
    iput p2, p0, Lcom/tencent/liteav/videoencoder/c;->mInputWidth:I

    .line 10
    .line 11
    iput p3, p0, Lcom/tencent/liteav/videoencoder/c;->mInputHeight:I

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/tencent/liteav/basic/c/h;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mResizeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    move-object v3, v0

    .line 30
    iget v0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 31
    .line 32
    iget v4, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 33
    .line 34
    invoke-virtual {v3, v0, v4}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 38
    .line 39
    iget v4, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 40
    .line 41
    const/4 v11, 0x0

    .line 42
    invoke-static {v11, v11, v0, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 43
    .line 44
    .line 45
    iget v0, p0, Lcom/tencent/liteav/videoencoder/c;->mRotation:I

    .line 46
    .line 47
    rsub-int v0, v0, 0x2d0

    .line 48
    .line 49
    rem-int/lit16 v6, v0, 0x168

    .line 50
    .line 51
    const/16 v0, 0x10e

    .line 52
    .line 53
    const/16 v4, 0x5a

    .line 54
    .line 55
    if-eq v6, v4, :cond_2

    .line 56
    .line 57
    if-ne v6, v0, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget v7, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    :goto_0
    iget v7, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 64
    .line 65
    :goto_1
    if-eq v6, v4, :cond_4

    .line 66
    .line 67
    if-ne v6, v0, :cond_3

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_3
    iget v0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_4
    :goto_2
    iget v0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 74
    .line 75
    :goto_3
    int-to-float v4, v7

    .line 76
    int-to-float v0, v0

    .line 77
    div-float v8, v4, v0

    .line 78
    .line 79
    iget-boolean v9, p0, Lcom/tencent/liteav/videoencoder/c;->mEnableXMirror:Z

    .line 80
    .line 81
    const/4 v10, 0x0

    .line 82
    const/4 v7, 0x0

    .line 83
    move v4, p2

    .line 84
    move v5, p3

    .line 85
    invoke-virtual/range {v3 .. v10}, Lcom/tencent/liteav/basic/c/h;->a(III[FFZZ)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3}, Lcom/tencent/liteav/basic/c/h;->l()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    new-array p2, v2, [I

    .line 96
    .line 97
    move-wide/from16 v3, p4

    .line 98
    .line 99
    iput-wide v3, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mPTS:J

    .line 100
    .line 101
    if-nez v1, :cond_6

    .line 102
    .line 103
    sget-object v0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->TAG:Ljava/lang/String;

    .line 104
    .line 105
    const-string v1, "pushVideoFrameInternal->create mRawFrameFilter"

    .line 106
    .line 107
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    new-instance v1, Lcom/tencent/liteav/beauty/b/p;

    .line 111
    .line 112
    invoke-direct {v1, v2}, Lcom/tencent/liteav/beauty/b/p;-><init>(I)V

    .line 113
    .line 114
    .line 115
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mRawFrameFilter:Lcom/tencent/liteav/basic/c/h;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-nez v2, :cond_5

    .line 125
    .line 126
    const-string p1, "pushVideoFrameInternal->destroy mRawFrameFilter, init failed!"

    .line 127
    .line 128
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    const/4 p1, 0x0

    .line 132
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mRawFrameFilter:Lcom/tencent/liteav/basic/c/h;

    .line 133
    .line 134
    const-wide/32 p0, 0x989684

    .line 135
    .line 136
    .line 137
    return-wide p0

    .line 138
    :cond_5
    iget v0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 139
    .line 140
    iget v2, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 141
    .line 142
    invoke-virtual {v1, v0, v2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 143
    .line 144
    .line 145
    new-instance v0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder$1;

    .line 146
    .line 147
    move/from16 v2, p6

    .line 148
    .line 149
    invoke-direct {v0, p0, v2, p1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder$1;-><init>(Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;ZI)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/basic/c/h;->a(Lcom/tencent/liteav/basic/c/h$a;)V

    .line 153
    .line 154
    .line 155
    :cond_6
    iget v0, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 156
    .line 157
    iget v2, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 158
    .line 159
    invoke-static {v11, v11, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 163
    .line 164
    .line 165
    aget p1, p2, v11

    .line 166
    .line 167
    if-eqz p1, :cond_7

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/c;->callDelegate(I)V

    .line 170
    .line 171
    .line 172
    :cond_7
    const-wide/16 p0, 0x0

    .line 173
    .line 174
    return-wide p0
.end method


# virtual methods
.method public enableNearestRPS(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 3
    .line 4
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeEnableNearestRPS(JI)V

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p1
.end method

.method public getRealBitrate()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 3
    .line 4
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativegetRealBitrate(J)J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    monitor-exit p0

    .line 9
    return-wide v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw v0
.end method

.method public getRealFPS()D
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 3
    .line 4
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeGetRealFPS(J)J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    long-to-double v0, v0

    .line 9
    monitor-exit p0

    .line 10
    return-wide v0

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw v0
.end method

.method public pushVideoFrame(IIIJ)J
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move-wide v4, p4

    .line 7
    invoke-direct/range {v0 .. v6}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->pushVideoFrameInternal(IIIJZ)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public pushVideoFrameAsync(IIIJ)J
    .locals 7

    .line 1
    const/4 v6, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move-wide v4, p4

    .line 7
    invoke-direct/range {v0 .. v6}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->pushVideoFrameInternal(IIIJZ)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public pushVideoFrameSync(IIIJ)J
    .locals 7

    .line 1
    const/4 v6, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move-wide v4, p4

    .line 7
    invoke-direct/range {v0 .. v6}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->pushVideoFrameInternal(IIIJZ)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public restartIDR()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 3
    .line 4
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeRestartIDR(J)V

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw v0
.end method

.method public setBitrate(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mBitrate:I

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 5
    .line 6
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSetBitrate(JI)V

    .line 7
    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p1
.end method

.method public setBitrateFromQos(II)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mBitrate:I

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 5
    .line 6
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSetBitrateFromQos(JII)V

    .line 7
    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p1
.end method

.method public setEncodeIdrFpsFromQos(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 3
    .line 4
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSetEncodeIdrFpsFromQos(JI)V

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p1
.end method

.method public setFPS(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 3
    .line 4
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSetFPS(JI)V

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p1
.end method

.method public setID(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/basic/module/a;->setID(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 6
    .line 7
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSetID(JLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p1
.end method

.method public setRPSRefBitmap(IIJ)V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v2, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    .line 4
    move-object v1, p0

    .line 5
    move v4, p1

    .line 6
    move v5, p2

    .line 7
    move-wide v6, p3

    .line 8
    :try_start_1
    invoke-direct/range {v1 .. v7}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSetRPSRefBitmap(JIIJ)V

    .line 9
    .line 10
    .line 11
    monitor-exit v1

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    :goto_0
    move-object p0, v0

    .line 15
    goto :goto_1

    .line 16
    :catchall_1
    move-exception v0

    .line 17
    move-object v1, p0

    .line 18
    goto :goto_0

    .line 19
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p0
.end method

.method public signalEOSAndFlush()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 3
    .line 4
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSignalEOSAndFlush(J)V

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw v0
.end method

.method public start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I
    .locals 5

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/videoencoder/c;->start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 5
    .line 6
    add-int/lit8 v1, v0, 0x7

    .line 7
    .line 8
    div-int/lit8 v1, v1, 0x8

    .line 9
    .line 10
    mul-int/lit8 v1, v1, 0x8

    .line 11
    .line 12
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 13
    .line 14
    add-int/lit8 v3, v2, 0x1

    .line 15
    .line 16
    div-int/lit8 v3, v3, 0x2

    .line 17
    .line 18
    mul-int/lit8 v3, v3, 0x2

    .line 19
    .line 20
    if-ne v1, v0, :cond_0

    .line 21
    .line 22
    if-eq v3, v2, :cond_1

    .line 23
    .line 24
    :cond_0
    sget-object v0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->TAG:Ljava/lang/String;

    .line 25
    .line 26
    const-string v2, "Encode Resolution not supportted, transforming..."

    .line 27
    .line 28
    invoke-static {v0, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    iget v4, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 37
    .line 38
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v4, "x"

    .line 42
    .line 43
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v4, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 47
    .line 48
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v4, "-> "

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v4, "x"

    .line 60
    .line 61
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v0, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iput v1, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 75
    .line 76
    iput v3, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 77
    .line 78
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 79
    .line 80
    iput v3, p0, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 81
    .line 82
    iput v1, p0, Lcom/tencent/liteav/videoencoder/c;->mInputWidth:I

    .line 83
    .line 84
    iput v3, p0, Lcom/tencent/liteav/videoencoder/c;->mInputHeight:I

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mRawFrameFilter:Lcom/tencent/liteav/basic/c/h;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mResizeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 90
    .line 91
    monitor-enter p0

    .line 92
    :try_start_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-direct {p0, v0}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeInit(Ljava/lang/ref/WeakReference;)J

    .line 98
    .line 99
    .line 100
    move-result-wide v0

    .line 101
    iput-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 102
    .line 103
    iget v2, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mBitrate:I

    .line 104
    .line 105
    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSetBitrate(JI)V

    .line 106
    .line 107
    .line 108
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeSetID(JLjava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-wide v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 118
    .line 119
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeStart(JLcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I

    .line 120
    .line 121
    .line 122
    monitor-exit p0

    .line 123
    const/4 p0, 0x0

    .line 124
    return p0

    .line 125
    :catchall_0
    move-exception p1

    .line 126
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    throw p1
.end method

.method public stop()V
    .locals 5

    .line 1
    sget-object v0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "stop->enter with mRawFrameFilter:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mRawFrameFilter:Lcom/tencent/liteav/basic/c/h;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/c;->mGLContextExternal:Ljava/lang/Object;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    iget-wide v1, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    iput-wide v3, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mNativeEncoder:J

    .line 31
    .line 32
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    invoke-direct {p0, v1, v2}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeStop(J)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, v1, v2}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->nativeRelease(J)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mRawFrameFilter:Lcom/tencent/liteav/basic/c/h;

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mRawFrameFilter:Lcom/tencent/liteav/basic/c/h;

    .line 47
    .line 48
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mResizeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;->mResizeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 56
    .line 57
    :cond_1
    invoke-super {p0}, Lcom/tencent/liteav/videoencoder/c;->stop()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catchall_0
    move-exception v0

    .line 62
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    throw v0
.end method
