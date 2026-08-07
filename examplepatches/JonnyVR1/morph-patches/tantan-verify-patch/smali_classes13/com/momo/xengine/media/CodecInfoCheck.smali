.class public Lcom/momo/xengine/media/CodecInfoCheck;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final mimetype:Ljava/lang/String; = "video/avc"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static couldHardwareEncode()Z
    .locals 18

    .line 1
    const v0, 0xbdd80

    .line 2
    .line 3
    .line 4
    new-array v1, v0, [B

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    move v3, v2

    .line 8
    :goto_0
    const/16 v4, 0xf0

    .line 9
    .line 10
    const/16 v5, 0x2d0

    .line 11
    .line 12
    if-ge v3, v0, :cond_3

    .line 13
    .line 14
    div-int/lit16 v6, v3, 0x2d0

    .line 15
    .line 16
    if-lt v6, v5, :cond_0

    .line 17
    .line 18
    aput-byte v2, v1, v3

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    rem-int/lit16 v5, v3, 0x2d0

    .line 22
    .line 23
    if-ge v5, v4, :cond_1

    .line 24
    .line 25
    const/16 v4, -0x80

    .line 26
    .line 27
    aput-byte v4, v1, v3

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const/16 v4, 0x1e0

    .line 31
    .line 32
    if-ge v5, v4, :cond_2

    .line 33
    .line 34
    aput-byte v2, v1, v3

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    const/16 v4, 0x7f

    .line 38
    .line 39
    aput-byte v4, v1, v3

    .line 40
    .line 41
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    invoke-static {v1, v0}, Lcom/momo/xengine/media/CodecInfoCheck;->encodeYUV([BI)[B

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_6

    .line 49
    .line 50
    invoke-static {v0}, Lcom/momo/xengine/media/CodecInfoCheck;->decodeFrame([B)[B

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_6

    .line 55
    .line 56
    const/16 v3, 0x40

    .line 57
    .line 58
    new-array v6, v3, [B

    .line 59
    .line 60
    new-array v7, v3, [B

    .line 61
    .line 62
    new-array v8, v3, [B

    .line 63
    .line 64
    new-array v9, v3, [B

    .line 65
    .line 66
    new-array v10, v3, [B

    .line 67
    .line 68
    new-array v11, v3, [B

    .line 69
    .line 70
    move v12, v2

    .line 71
    :goto_2
    if-ge v12, v3, :cond_4

    .line 72
    .line 73
    div-int/lit8 v13, v12, 0x8

    .line 74
    .line 75
    mul-int/lit16 v14, v13, 0x2d0

    .line 76
    .line 77
    rem-int/lit8 v15, v12, 0x8

    .line 78
    .line 79
    add-int/2addr v14, v15

    .line 80
    aget-byte v16, v1, v14

    .line 81
    .line 82
    aput-byte v16, v6, v12

    .line 83
    .line 84
    move/from16 v16, v2

    .line 85
    .line 86
    add-int/lit16 v2, v13, 0x168

    .line 87
    .line 88
    mul-int/2addr v2, v5

    .line 89
    add-int/2addr v2, v4

    .line 90
    add-int/2addr v2, v15

    .line 91
    aget-byte v17, v1, v2

    .line 92
    .line 93
    aput-byte v17, v8, v12

    .line 94
    .line 95
    add-int/lit16 v13, v13, 0x2c8

    .line 96
    .line 97
    mul-int/2addr v13, v5

    .line 98
    add-int/lit16 v13, v13, 0x2c8

    .line 99
    .line 100
    add-int/2addr v13, v15

    .line 101
    aget-byte v15, v1, v13

    .line 102
    .line 103
    aput-byte v15, v10, v12

    .line 104
    .line 105
    aget-byte v14, v0, v14

    .line 106
    .line 107
    aput-byte v14, v7, v12

    .line 108
    .line 109
    aget-byte v2, v0, v2

    .line 110
    .line 111
    aput-byte v2, v9, v12

    .line 112
    .line 113
    aget-byte v2, v0, v13

    .line 114
    .line 115
    aput-byte v2, v11, v12

    .line 116
    .line 117
    add-int/lit8 v12, v12, 0x1

    .line 118
    .line 119
    move/from16 v2, v16

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_4
    move/from16 v16, v2

    .line 123
    .line 124
    new-instance v0, Lcom/momo/xengine/media/PictureDiffenceUtil;

    .line 125
    .line 126
    invoke-direct {v0}, Lcom/momo/xengine/media/PictureDiffenceUtil;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v6, v7}, Lcom/momo/xengine/media/PictureDiffenceUtil;->isTwoPictureSame([B[B)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_5

    .line 134
    .line 135
    invoke-virtual {v0, v8, v9}, Lcom/momo/xengine/media/PictureDiffenceUtil;->isTwoPictureSame([B[B)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_5

    .line 140
    .line 141
    invoke-virtual {v0, v10, v11}, Lcom/momo/xengine/media/PictureDiffenceUtil;->isTwoPictureSame([B[B)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_5

    .line 146
    .line 147
    const/4 v0, 0x1

    .line 148
    return v0

    .line 149
    :cond_5
    return v16

    .line 150
    :cond_6
    move/from16 v16, v2

    .line 151
    .line 152
    return v16
.end method

.method private static decodeFrame([B)[B
    .locals 10

    .line 1
    const-string v1, "video/avc"

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :try_start_0
    invoke-static {v1}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 5
    .line 6
    .line 7
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    move-object v3, v0

    .line 9
    goto :goto_0

    .line 10
    :catch_0
    move-exception v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    move-object v3, v2

    .line 15
    :goto_0
    if-eqz v3, :cond_3

    .line 16
    .line 17
    const/16 v0, 0x2d0

    .line 18
    .line 19
    invoke-static {v1, v0, v0}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "color-format"

    .line 24
    .line 25
    const/16 v4, 0x15

    .line 26
    .line 27
    invoke-virtual {v0, v1, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v3, v0, v2, v2, v1}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/media/MediaCodec;->start()V

    .line 35
    .line 36
    .line 37
    const-wide/16 v4, -0x1

    .line 38
    .line 39
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-ltz v4, :cond_3

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    array-length v6, p0

    .line 55
    const-wide/16 v7, 0x0

    .line 56
    .line 57
    const/4 v9, 0x0

    .line 58
    const/4 v5, 0x0

    .line 59
    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 63
    .line 64
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 65
    .line 66
    .line 67
    const-wide/16 v4, 0x7530

    .line 68
    .line 69
    invoke-virtual {v3, v0, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-gez v6, :cond_0

    .line 74
    .line 75
    invoke-virtual {v3, v0, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    :cond_0
    if-ltz v6, :cond_2

    .line 80
    .line 81
    :goto_1
    if-ltz v6, :cond_1

    .line 82
    .line 83
    invoke-virtual {v3, v6}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget v2, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 88
    .line 89
    new-array v2, v2, [B

    .line 90
    .line 91
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3, v6, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 95
    .line 96
    .line 97
    const-wide/16 v4, 0x0

    .line 98
    .line 99
    invoke-virtual {v3, v0, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    goto :goto_1

    .line 104
    :cond_1
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 108
    .line 109
    .line 110
    return-object v2

    .line 111
    :cond_2
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 115
    .line 116
    .line 117
    new-instance v0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;

    .line 118
    .line 119
    invoke-direct {v0}, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->init()Z

    .line 123
    .line 124
    .line 125
    array-length v1, p0

    .line 126
    invoke-virtual {v0, p0, v1}, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->decodeOneFrameToYUV([BI)[B

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {v0}, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->release()V

    .line 131
    .line 132
    .line 133
    return-object p0

    .line 134
    :cond_3
    return-object v2
.end method

.method private static encodeYUV([BI)[B
    .locals 11

    .line 1
    const-string v1, "video/avc"

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :try_start_0
    invoke-static {v1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 5
    .line 6
    .line 7
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    move-object v3, v0

    .line 9
    goto :goto_0

    .line 10
    :catch_0
    move-exception v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    move-object v3, v2

    .line 15
    :goto_0
    if-eqz v3, :cond_6

    .line 16
    .line 17
    const/16 v0, 0x2d0

    .line 18
    .line 19
    invoke-static {v1, v0, v0}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "bitrate"

    .line 24
    .line 25
    const v4, 0x1fa400

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    const-string v1, "frame-rate"

    .line 32
    .line 33
    const/16 v4, 0x1e

    .line 34
    .line 35
    invoke-virtual {v0, v1, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    const-string v1, "color-format"

    .line 39
    .line 40
    const/16 v4, 0x15

    .line 41
    .line 42
    invoke-virtual {v0, v1, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    const-string v1, "i-frame-interval"

    .line 46
    .line 47
    const/4 v10, 0x1

    .line 48
    invoke-virtual {v0, v1, v10}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v0, v2, v2, v10}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Landroid/media/MediaCodec;->start()V

    .line 55
    .line 56
    .line 57
    const-wide/16 v0, -0x1

    .line 58
    .line 59
    invoke-virtual {v3, v0, v1}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-ltz v4, :cond_5

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    const-wide/16 v7, 0x0

    .line 73
    .line 74
    const/4 v9, 0x0

    .line 75
    const/4 v5, 0x0

    .line 76
    move v6, p1

    .line 77
    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 78
    .line 79
    .line 80
    new-instance p0, Landroid/media/MediaCodec$BufferInfo;

    .line 81
    .line 82
    invoke-direct {p0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 83
    .line 84
    .line 85
    const-wide/16 v0, 0x7530

    .line 86
    .line 87
    invoke-virtual {v3, p0, v0, v1}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-gez p1, :cond_0

    .line 92
    .line 93
    invoke-virtual {v3, p0, v0, v1}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    :cond_0
    move-object v0, v2

    .line 98
    move-object v1, v0

    .line 99
    :goto_1
    if-ltz p1, :cond_4

    .line 100
    .line 101
    invoke-virtual {v3, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    iget v5, p0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 106
    .line 107
    new-array v6, v5, [B

    .line 108
    .line 109
    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 110
    .line 111
    .line 112
    iget v4, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 113
    .line 114
    const/4 v7, 0x2

    .line 115
    const/4 v8, 0x0

    .line 116
    if-ne v4, v7, :cond_1

    .line 117
    .line 118
    iget v1, p0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 119
    .line 120
    new-array v1, v1, [B

    .line 121
    .line 122
    move-object v1, v6

    .line 123
    goto :goto_2

    .line 124
    :cond_1
    if-ne v4, v10, :cond_3

    .line 125
    .line 126
    if-eqz v1, :cond_2

    .line 127
    .line 128
    iget v0, p0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 129
    .line 130
    array-length v4, v1

    .line 131
    add-int/2addr v0, v4

    .line 132
    new-array v0, v0, [B

    .line 133
    .line 134
    array-length v4, v1

    .line 135
    invoke-static {v1, v8, v0, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 136
    .line 137
    .line 138
    array-length v4, v1

    .line 139
    invoke-static {v6, v8, v0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_2
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 147
    .line 148
    .line 149
    return-object v2

    .line 150
    :cond_3
    iget v0, p0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 151
    .line 152
    new-array v0, v0, [B

    .line 153
    .line 154
    invoke-static {v6, v8, v0, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 155
    .line 156
    .line 157
    :goto_2
    invoke-virtual {v3, p1, v8}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 158
    .line 159
    .line 160
    const-wide/16 v4, 0x2710

    .line 161
    .line 162
    invoke-virtual {v3, p0, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    goto :goto_1

    .line 167
    :cond_4
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 171
    .line 172
    .line 173
    return-object v0

    .line 174
    :cond_5
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 178
    .line 179
    .line 180
    :cond_6
    return-object v2
.end method

.method public static getEncoderMaxSupportBitrate(Ljava/lang/String;)I
    .locals 6
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/media/MediaCodecList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/media/MediaCodecList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    array-length v1, v0

    .line 12
    const/4 v2, 0x0

    .line 13
    move v3, v2

    .line 14
    :goto_0
    if-ge v3, v1, :cond_2

    .line 15
    .line 16
    aget-object v4, v0, v3

    .line 17
    .line 18
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-nez v5, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    aget-object v5, v5, v2

    .line 30
    .line 31
    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-eqz v5, :cond_1

    .line 36
    .line 37
    invoke-virtual {v4, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getBitrateRange()Landroid/util/Range;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0

    .line 60
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const/4 p0, -0x1

    .line 64
    return p0
.end method

.method public static getSupportMaxWidth(ILjava/lang/String;Z)I
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gtz p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    new-instance v1, Landroid/media/MediaCodecList;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v1, v2}, Landroid/media/MediaCodecList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    array-length v2, v1

    .line 16
    move v3, v0

    .line 17
    :goto_0
    if-ge v3, v2, :cond_3

    .line 18
    .line 19
    aget-object v4, v1, v3

    .line 20
    .line 21
    if-eqz p2, :cond_3

    .line 22
    .line 23
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-nez v5, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    aget-object v5, v5, v0

    .line 35
    .line 36
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-eqz v5, :cond_2

    .line 41
    .line 42
    invoke-virtual {v4, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1, p0}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedWidthsFor(I)Landroid/util/Range;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Ljava/lang/Integer;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0

    .line 65
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    return v0
.end method

.method public static isSupportHWEncoding(IIIZLandroid/content/Context;)Z
    .locals 7

    .line 1
    const-string v0, "video/avc"

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Lcom/momo/xengine/media/SharePreferenceUtils;

    .line 5
    .line 6
    invoke-direct {v1}, Lcom/momo/xengine/media/SharePreferenceUtils;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v2, "video/avc"

    .line 10
    .line 11
    invoke-static {v2}, Lcom/momo/xengine/media/CodecInfoCheck;->isSupportNV12(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x1

    .line 17
    if-eqz p4, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1, p4}, Lcom/momo/xengine/media/SharePreferenceUtils;->init(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    move p4, v4

    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto/16 :goto_6

    .line 26
    .line 27
    :cond_0
    move p4, v3

    .line 28
    :goto_0
    if-eqz v2, :cond_4

    .line 29
    .line 30
    if-eqz p4, :cond_1

    .line 31
    .line 32
    const-string v5, "couldHardWareEncode"

    .line 33
    .line 34
    invoke-virtual {v1, v5}, Lcom/momo/xengine/media/SharePreferenceUtils;->getInt(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v5, v3

    .line 40
    :goto_1
    if-eq v5, v4, :cond_3

    .line 41
    .line 42
    const/4 v6, -0x1

    .line 43
    if-eq v5, v6, :cond_3

    .line 44
    .line 45
    invoke-static {}, Lcom/momo/xengine/media/CodecInfoCheck;->couldHardwareEncode()Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    if-eqz v5, :cond_2

    .line 50
    .line 51
    move v5, v4

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move v5, v6

    .line 54
    :cond_3
    :goto_2
    if-eqz p4, :cond_5

    .line 55
    .line 56
    const-string p4, "couldHardWareEncode"

    .line 57
    .line 58
    invoke-virtual {v1, p4, v5}, Lcom/momo/xengine/media/SharePreferenceUtils;->putInt(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_4
    move v5, v3

    .line 63
    :cond_5
    :goto_3
    const-string p4, "video/avc"

    .line 64
    .line 65
    invoke-static {p4}, Lcom/momo/xengine/media/CodecInfoCheck;->getEncoderMaxSupportBitrate(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result p4

    .line 69
    if-lez p4, :cond_6

    .line 70
    .line 71
    if-gt p0, p4, :cond_6

    .line 72
    .line 73
    move p0, v4

    .line 74
    goto :goto_4

    .line 75
    :cond_6
    move p0, v3

    .line 76
    :goto_4
    const-string p4, "video/avc"

    .line 77
    .line 78
    invoke-static {p4, p3}, Lcom/momo/xengine/media/CodecInfoCheck;->isSupportHeight(Ljava/lang/String;Z)I

    .line 79
    .line 80
    .line 81
    move-result p4

    .line 82
    if-lez p4, :cond_7

    .line 83
    .line 84
    if-gt p2, p4, :cond_7

    .line 85
    .line 86
    const-string p4, "video/avc"

    .line 87
    .line 88
    invoke-static {p2, p4, p3}, Lcom/momo/xengine/media/CodecInfoCheck;->getSupportMaxWidth(ILjava/lang/String;Z)I

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-lez p2, :cond_7

    .line 93
    .line 94
    if-gt p1, p2, :cond_7

    .line 95
    .line 96
    move p1, v4

    .line 97
    goto :goto_5

    .line 98
    :cond_7
    move p1, v3

    .line 99
    :goto_5
    if-eqz p0, :cond_8

    .line 100
    .line 101
    if-eqz v2, :cond_8

    .line 102
    .line 103
    if-eqz p1, :cond_8

    .line 104
    .line 105
    if-ne v5, v4, :cond_8

    .line 106
    .line 107
    move v3, v4

    .line 108
    :cond_8
    monitor-exit v0

    .line 109
    return v3

    .line 110
    :goto_6
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    throw p0
.end method

.method public static isSupportHeight(Ljava/lang/String;Z)I
    .locals 6
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/media/MediaCodecList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/media/MediaCodecList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    array-length v1, v0

    .line 12
    const/4 v2, 0x0

    .line 13
    move v3, v2

    .line 14
    :goto_0
    if-ge v3, v1, :cond_2

    .line 15
    .line 16
    aget-object v4, v0, v3

    .line 17
    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-nez v5, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    aget-object v5, v5, v2

    .line 32
    .line 33
    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-eqz v5, :cond_1

    .line 38
    .line 39
    invoke-virtual {v4, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedHeights()Landroid/util/Range;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0

    .line 62
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    return v2
.end method

.method public static isSupportNV12(Ljava/lang/String;)Z
    .locals 9
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/media/MediaCodecList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/media/MediaCodecList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    array-length v2, v0

    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_0
    if-ge v4, v2, :cond_3

    .line 15
    .line 16
    aget-object v5, v0, v4

    .line 17
    .line 18
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    if-nez v6, :cond_0

    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_0
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    aget-object v6, v6, v3

    .line 30
    .line 31
    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    if-eqz v6, :cond_2

    .line 36
    .line 37
    invoke-virtual {v5, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    move v6, v3

    .line 42
    :goto_1
    iget-object v7, v5, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 43
    .line 44
    array-length v8, v7

    .line 45
    if-ge v6, v8, :cond_2

    .line 46
    .line 47
    aget v7, v7, v6

    .line 48
    .line 49
    const/16 v8, 0x15

    .line 50
    .line 51
    if-ne v7, v8, :cond_1

    .line 52
    .line 53
    return v1

    .line 54
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    return v3
.end method
