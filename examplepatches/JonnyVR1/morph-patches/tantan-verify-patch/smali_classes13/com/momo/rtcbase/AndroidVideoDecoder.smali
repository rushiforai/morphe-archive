.class Lcom/momo/rtcbase/AndroidVideoDecoder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoDecoder;
.implements Lcom/momo/rtcbase/VideoSink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;,
        Lcom/momo/rtcbase/AndroidVideoDecoder$FrameInfo;
    }
.end annotation


# static fields
.field private static final DEQUEUE_INPUT_TIMEOUT_US:I = 0x7a120

.field private static final DEQUEUE_OUTPUT_BUFFER_TIMEOUT_US:I = 0x186a0

.field private static final MEDIA_CODEC_RELEASE_TIMEOUT_MS:I = 0x1388

.field private static final MEDIA_FORMAT_KEY_CROP_BOTTOM:Ljava/lang/String; = "crop-bottom"

.field private static final MEDIA_FORMAT_KEY_CROP_LEFT:Ljava/lang/String; = "crop-left"

.field private static final MEDIA_FORMAT_KEY_CROP_RIGHT:Ljava/lang/String; = "crop-right"

.field private static final MEDIA_FORMAT_KEY_CROP_TOP:Ljava/lang/String; = "crop-top"

.field private static final MEDIA_FORMAT_KEY_SLICE_HEIGHT:Ljava/lang/String; = "slice-height"

.field private static final MEDIA_FORMAT_KEY_STRIDE:Ljava/lang/String; = "stride"

.field private static final TAG:Ljava/lang/String; = "AndroidVideoDecoder"


# instance fields
.field private callback:Lcom/momo/rtcbase/VideoDecoder$Callback;

.field private codec:Lcom/momo/rtcbase/MediaCodecWrapper;

.field private final codecName:Ljava/lang/String;

.field private final codecType:Lcom/momo/rtcbase/VideoCodecType;

.field private colorFormat:I

.field private decoderThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

.field private final dimensionLock:Ljava/lang/Object;

.field private final frameInfos:Ljava/util/concurrent/BlockingDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingDeque<",
            "Lcom/momo/rtcbase/AndroidVideoDecoder$FrameInfo;",
            ">;"
        }
    .end annotation
.end field

.field private hasDecodedFirstFrame:Z

.field private height:I

.field private keyFrameRequired:Z

.field private final mediaCodecWrapperFactory:Lcom/momo/rtcbase/MediaCodecWrapperFactory;

.field private outputThread:Ljava/lang/Thread;

.field private outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

.field private renderedTextureMetadata:Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;

.field private final renderedTextureMetadataLock:Ljava/lang/Object;

.field private volatile running:Z

.field private final sharedContext:Lcom/momo/rtcbase/EglBase$Context;

.field private volatile shutdownException:Ljava/lang/Exception;

.field private sliceHeight:I

.field private stride:I

.field private surface:Landroid/view/Surface;

.field private surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

.field private width:I


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/momo/rtcbase/VideoCodecType;ILcom/momo/rtcbase/EglBase$Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-direct {p0, p4}, Lcom/momo/rtcbase/AndroidVideoDecoder;->isSupportedColorFormat(I)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "ctor name: "

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, " type: "

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " color format: "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, " context: "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "AndroidVideoDecoder"

    .line 63
    .line 64
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->mediaCodecWrapperFactory:Lcom/momo/rtcbase/MediaCodecWrapperFactory;

    .line 68
    .line 69
    iput-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 70
    .line 71
    iput-object p3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 72
    .line 73
    iput p4, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->colorFormat:I

    .line 74
    .line 75
    iput-object p5, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 76
    .line 77
    new-instance p1, Ljava/util/concurrent/LinkedBlockingDeque;

    .line 78
    .line 79
    invoke-direct {p1}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->frameInfos:Ljava/util/concurrent/BlockingDeque;

    .line 83
    .line 84
    return-void

    .line 85
    :cond_0
    const-string p0, "Unsupported color format: "

    .line 86
    .line 87
    invoke-static {p0, p4}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    const/4 p0, 0x0

    .line 91
    throw p0
.end method

.method public static synthetic access$002(Lcom/momo/rtcbase/AndroidVideoDecoder;Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;)Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/AndroidVideoDecoder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->running:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/AndroidVideoDecoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/AndroidVideoDecoder;->releaseCodecOnOutputThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private copyI420Buffer(Ljava/nio/ByteBuffer;IIII)Lcom/momo/rtcbase/VideoFrame$Buffer;
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v6, p4

    .line 4
    .line 5
    move/from16 v7, p5

    .line 6
    .line 7
    rem-int/lit8 v1, p2, 0x2

    .line 8
    .line 9
    if-nez v1, :cond_3

    .line 10
    .line 11
    add-int/lit8 v1, v6, 0x1

    .line 12
    .line 13
    div-int/lit8 v8, v1, 0x2

    .line 14
    .line 15
    rem-int/lit8 v9, p3, 0x2

    .line 16
    .line 17
    if-nez v9, :cond_0

    .line 18
    .line 19
    add-int/lit8 v1, v7, 0x1

    .line 20
    .line 21
    div-int/lit8 v1, v1, 0x2

    .line 22
    .line 23
    :goto_0
    move v10, v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    div-int/lit8 v1, v7, 0x2

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    div-int/lit8 v11, p2, 0x2

    .line 29
    .line 30
    mul-int v1, p2, v7

    .line 31
    .line 32
    mul-int v12, p2, p3

    .line 33
    .line 34
    mul-int v2, v11, v10

    .line 35
    .line 36
    add-int v13, v12, v2

    .line 37
    .line 38
    mul-int v3, v11, p3

    .line 39
    .line 40
    div-int/lit8 v3, v3, 0x2

    .line 41
    .line 42
    add-int v14, v12, v3

    .line 43
    .line 44
    add-int v15, v14, v2

    .line 45
    .line 46
    move-object/from16 v2, p0

    .line 47
    .line 48
    invoke-virtual {v2, v6, v7}, Lcom/momo/rtcbase/AndroidVideoDecoder;->allocateI420Buffer(II)Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    .line 49
    .line 50
    .line 51
    move-result-object v16

    .line 52
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 53
    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideY()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    move-object/from16 v1, p0

    .line 72
    .line 73
    move/from16 v3, p2

    .line 74
    .line 75
    invoke-virtual/range {v1 .. v7}, Lcom/momo/rtcbase/AndroidVideoDecoder;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v13}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideU()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    move-object/from16 v2, p0

    .line 97
    .line 98
    move v7, v8

    .line 99
    move v8, v10

    .line 100
    move v4, v11

    .line 101
    invoke-virtual/range {v2 .. v8}, Lcom/momo/rtcbase/AndroidVideoDecoder;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 102
    .line 103
    .line 104
    const/4 v1, 0x1

    .line 105
    if-ne v9, v1, :cond_1

    .line 106
    .line 107
    add-int/lit8 v10, v8, -0x1

    .line 108
    .line 109
    mul-int v11, v4, v10

    .line 110
    .line 111
    add-int/2addr v12, v11

    .line 112
    invoke-virtual {v0, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 113
    .line 114
    .line 115
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideU()I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    mul-int/2addr v3, v8

    .line 124
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    .line 130
    :cond_1
    invoke-virtual {v0, v15}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v14}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideV()I

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    move-object/from16 v2, p0

    .line 149
    .line 150
    invoke-virtual/range {v2 .. v8}, Lcom/momo/rtcbase/AndroidVideoDecoder;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 151
    .line 152
    .line 153
    if-ne v9, v1, :cond_2

    .line 154
    .line 155
    add-int/lit8 v10, v8, -0x1

    .line 156
    .line 157
    mul-int v11, v4, v10

    .line 158
    .line 159
    add-int/2addr v14, v11

    .line 160
    invoke-virtual {v0, v14}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 161
    .line 162
    .line 163
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-interface/range {v16 .. v16}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideV()I

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    mul-int/2addr v2, v8

    .line 172
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 176
    .line 177
    .line 178
    :cond_2
    return-object v16

    .line 179
    :cond_3
    move/from16 v3, p2

    .line 180
    .line 181
    new-instance v0, Ljava/lang/AssertionError;

    .line 182
    .line 183
    new-instance v1, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    const-string v2, "Stride is not divisible by two: "

    .line 186
    .line 187
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    throw v0
.end method

.method private copyNV12ToI420Buffer(Ljava/nio/ByteBuffer;IIII)Lcom/momo/rtcbase/VideoFrame$Buffer;
    .locals 7

    .line 1
    new-instance v0, Lcom/momo/rtcbase/NV12Buffer;

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    move-object v5, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v1, p4

    .line 8
    move v2, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/momo/rtcbase/NV12Buffer;-><init>(IIIILjava/nio/ByteBuffer;Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/rtcbase/NV12Buffer;->toI420()Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private createOutputThread()Ljava/lang/Thread;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/AndroidVideoDecoder$1;

    .line 2
    .line 3
    const-string v1, "AndroidVideoDecoder.outputThread"

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/momo/rtcbase/AndroidVideoDecoder$1;-><init>(Lcom/momo/rtcbase/AndroidVideoDecoder;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method private deliverByteFrame(ILandroid/media/MediaCodec$BufferInfo;ILjava/lang/Integer;)V
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget v6, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->width:I

    .line 5
    .line 6
    iget v7, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->height:I

    .line 7
    .line 8
    iget v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->stride:I

    .line 9
    .line 10
    iget v5, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sliceHeight:I

    .line 11
    .line 12
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 14
    .line 15
    mul-int v2, v6, v7

    .line 16
    .line 17
    mul-int/lit8 v2, v2, 0x3

    .line 18
    .line 19
    div-int/lit8 v2, v2, 0x2

    .line 20
    .line 21
    if-ge v1, v2, :cond_0

    .line 22
    .line 23
    const-string p0, "AndroidVideoDecoder"

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string p3, "Insufficient output buffer size: "

    .line 28
    .line 29
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget p2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    mul-int v2, v0, v7

    .line 46
    .line 47
    mul-int/lit8 v2, v2, 0x3

    .line 48
    .line 49
    div-int/lit8 v2, v2, 0x2

    .line 50
    .line 51
    if-ge v1, v2, :cond_1

    .line 52
    .line 53
    if-ne v5, v7, :cond_1

    .line 54
    .line 55
    if-le v0, v6, :cond_1

    .line 56
    .line 57
    mul-int/lit8 v1, v1, 0x2

    .line 58
    .line 59
    mul-int/lit8 v0, v7, 0x3

    .line 60
    .line 61
    div-int v0, v1, v0

    .line 62
    .line 63
    :cond_1
    move v4, v0

    .line 64
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 65
    .line 66
    invoke-interface {v0}, Lcom/momo/rtcbase/MediaCodecWrapper;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    aget-object v0, v0, p1

    .line 71
    .line 72
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 75
    .line 76
    .line 77
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 78
    .line 79
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 80
    .line 81
    add-int/2addr v1, v2

    .line 82
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    iget v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->colorFormat:I

    .line 90
    .line 91
    const/16 v1, 0x13

    .line 92
    .line 93
    if-ne v0, v1, :cond_2

    .line 94
    .line 95
    move-object v2, p0

    .line 96
    invoke-direct/range {v2 .. v7}, Lcom/momo/rtcbase/AndroidVideoDecoder;->copyI420Buffer(Ljava/nio/ByteBuffer;IIII)Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    goto :goto_0

    .line 101
    :cond_2
    move-object v2, p0

    .line 102
    invoke-direct/range {v2 .. v7}, Lcom/momo/rtcbase/AndroidVideoDecoder;->copyNV12ToI420Buffer(Ljava/nio/ByteBuffer;IIII)Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    :goto_0
    iget-object v0, v2, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 107
    .line 108
    const/4 v1, 0x0

    .line 109
    invoke-interface {v0, p1, v1}, Lcom/momo/rtcbase/MediaCodecWrapper;->releaseOutputBuffer(IZ)V

    .line 110
    .line 111
    .line 112
    iget-wide p1, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 113
    .line 114
    const-wide/16 v0, 0x3e8

    .line 115
    .line 116
    mul-long/2addr p1, v0

    .line 117
    new-instance v0, Lcom/momo/rtcbase/VideoFrame;

    .line 118
    .line 119
    invoke-direct {v0, p0, p3, p1, p2}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 120
    .line 121
    .line 122
    iget-object p0, v2, Lcom/momo/rtcbase/AndroidVideoDecoder;->callback:Lcom/momo/rtcbase/VideoDecoder$Callback;

    .line 123
    .line 124
    const/4 p1, 0x0

    .line 125
    invoke-interface {p0, v0, p4, p1}, Lcom/momo/rtcbase/VideoDecoder$Callback;->onDecodedFrame(Lcom/momo/rtcbase/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :catchall_0
    move-exception v0

    .line 133
    move-object p0, v0

    .line 134
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    throw p0
.end method

.method private deliverTextureFrame(ILandroid/media/MediaCodec$BufferInfo;ILjava/lang/Integer;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->width:I

    .line 5
    .line 6
    iget v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->height:I

    .line 7
    .line 8
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    iget-object v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v3

    .line 12
    :try_start_1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-interface {p0, p1, p2}, Lcom/momo/rtcbase/MediaCodecWrapper;->releaseOutputBuffer(IZ)V

    .line 20
    .line 21
    .line 22
    monitor-exit v3

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Lcom/momo/rtcbase/SurfaceTextureHelper;->setTextureSize(II)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 32
    .line 33
    invoke-virtual {v0, p3}, Lcom/momo/rtcbase/SurfaceTextureHelper;->setFrameRotation(I)V

    .line 34
    .line 35
    .line 36
    new-instance p3, Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 37
    .line 38
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 39
    .line 40
    invoke-direct {p3, v0, v1, p4}, Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;-><init>(JLjava/lang/Integer;)V

    .line 41
    .line 42
    .line 43
    iput-object p3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 46
    .line 47
    const/4 p2, 0x1

    .line 48
    invoke-interface {p0, p1, p2}, Lcom/momo/rtcbase/MediaCodecWrapper;->releaseOutputBuffer(IZ)V

    .line 49
    .line 50
    .line 51
    monitor-exit v3

    .line 52
    return-void

    .line 53
    :goto_0
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p0

    .line 55
    :catchall_1
    move-exception p0

    .line 56
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 57
    throw p0
.end method

.method private initDecodeInternal(II)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->decoderThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "initDecodeInternal name: "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " type: "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, " width: "

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, " height: "

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "AndroidVideoDecoder"

    .line 49
    .line 50
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 54
    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    const-string p0, "initDecodeInternal called while the codec is already running"

    .line 58
    .line 59
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_0
    iput p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->width:I

    .line 66
    .line 67
    iput p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->height:I

    .line 68
    .line 69
    iput p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->stride:I

    .line 70
    .line 71
    iput p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sliceHeight:I

    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    iput-boolean v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 75
    .line 76
    const/4 v2, 0x1

    .line 77
    iput-boolean v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->keyFrameRequired:Z

    .line 78
    .line 79
    :try_start_0
    iget-object v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->mediaCodecWrapperFactory:Lcom/momo/rtcbase/MediaCodecWrapperFactory;

    .line 80
    .line 81
    iget-object v4, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 82
    .line 83
    invoke-interface {v3, v4}, Lcom/momo/rtcbase/MediaCodecWrapperFactory;->createByCodecName(Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    iput-object v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 88
    .line 89
    :try_start_1
    iget-object v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 90
    .line 91
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-static {v3, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 100
    .line 101
    if-nez p2, :cond_1

    .line 102
    .line 103
    const-string p2, "color-format"

    .line 104
    .line 105
    iget v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->colorFormat:I

    .line 106
    .line 107
    invoke-virtual {p1, p2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :catch_0
    move-exception p1

    .line 112
    goto :goto_1

    .line 113
    :cond_1
    :goto_0
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 114
    .line 115
    iget-object v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 116
    .line 117
    const/4 v4, 0x0

    .line 118
    invoke-interface {p2, p1, v3, v4, v0}, Lcom/momo/rtcbase/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 122
    .line 123
    invoke-interface {p1}, Lcom/momo/rtcbase/MediaCodecWrapper;->start()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 124
    .line 125
    .line 126
    iput-boolean v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->running:Z

    .line 127
    .line 128
    invoke-direct {p0}, Lcom/momo/rtcbase/AndroidVideoDecoder;->createOutputThread()Ljava/lang/Thread;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 133
    .line 134
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 135
    .line 136
    .line 137
    const-string p0, "initDecodeInternal done"

    .line 138
    .line 139
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 143
    .line 144
    return-object p0

    .line 145
    :goto_1
    const-string p2, "initDecode failed"

    .line 146
    .line 147
    invoke-static {v1, p2, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Lcom/momo/rtcbase/AndroidVideoDecoder;->release()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 151
    .line 152
    .line 153
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 154
    .line 155
    return-object p0

    .line 156
    :catch_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    const-string p2, "Cannot create media decoder "

    .line 159
    .line 160
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 176
    .line 177
    return-object p0
.end method

.method private isSupportedColorFormat(I)Z
    .locals 4

    .line 1
    sget-object p0, Lcom/momo/rtcbase/MediaCodecUtils;->DECODER_COLOR_FORMATS:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    aget v3, p0, v2

    .line 9
    .line 10
    if-ne v3, p1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return v1
.end method

.method private reformat(Landroid/media/MediaFormat;)V
    .locals 6

    .line 1
    const-string v0, "Frame stride and slice height: "

    .line 2
    .line 3
    const-string v1, "Unexpected size change. Configured "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    const-string v2, "AndroidVideoDecoder"

    .line 11
    .line 12
    new-instance v3, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v4, "Decoder format changed: "

    .line 15
    .line 16
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v2, v3}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string v2, "crop-left"

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    const-string v2, "crop-right"

    .line 42
    .line 43
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    const-string v2, "crop-bottom"

    .line 50
    .line 51
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    const-string v2, "crop-top"

    .line 58
    .line 59
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    const-string v2, "crop-right"

    .line 66
    .line 67
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    add-int/lit8 v2, v2, 0x1

    .line 72
    .line 73
    const-string v3, "crop-left"

    .line 74
    .line 75
    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    sub-int/2addr v2, v3

    .line 80
    const-string v3, "crop-bottom"

    .line 81
    .line 82
    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    add-int/lit8 v3, v3, 0x1

    .line 87
    .line 88
    const-string v4, "crop-top"

    .line 89
    .line 90
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    sub-int/2addr v3, v4

    .line 95
    goto :goto_0

    .line 96
    :cond_0
    const-string v2, "width"

    .line 97
    .line 98
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    const-string v3, "height"

    .line 103
    .line 104
    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    :goto_0
    iget-object v4, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 109
    .line 110
    monitor-enter v4

    .line 111
    :try_start_0
    iget-boolean v5, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 112
    .line 113
    if-eqz v5, :cond_2

    .line 114
    .line 115
    iget v5, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->width:I

    .line 116
    .line 117
    if-ne v5, v2, :cond_1

    .line 118
    .line 119
    iget v5, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->height:I

    .line 120
    .line 121
    if-eq v5, v3, :cond_2

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :catchall_0
    move-exception p0

    .line 125
    goto/16 :goto_4

    .line 126
    .line 127
    :cond_1
    :goto_1
    new-instance p1, Ljava/lang/RuntimeException;

    .line 128
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->width:I

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v1, "*"

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->height:I

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v1, ". New "

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v1, "*"

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/AndroidVideoDecoder;->stopOnOutputThread(Ljava/lang/Exception;)V

    .line 173
    .line 174
    .line 175
    monitor-exit v4

    .line 176
    return-void

    .line 177
    :cond_2
    iput v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->width:I

    .line 178
    .line 179
    iput v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->height:I

    .line 180
    .line 181
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 182
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 183
    .line 184
    if-nez v1, :cond_3

    .line 185
    .line 186
    const-string v1, "color-format"

    .line 187
    .line 188
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-eqz v1, :cond_3

    .line 193
    .line 194
    const-string v1, "color-format"

    .line 195
    .line 196
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    iput v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->colorFormat:I

    .line 201
    .line 202
    const-string v1, "AndroidVideoDecoder"

    .line 203
    .line 204
    new-instance v2, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    const-string v3, "Color: 0x"

    .line 207
    .line 208
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->colorFormat:I

    .line 212
    .line 213
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    iget v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->colorFormat:I

    .line 228
    .line 229
    invoke-direct {p0, v1}, Lcom/momo/rtcbase/AndroidVideoDecoder;->isSupportedColorFormat(I)Z

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    if-nez v1, :cond_3

    .line 234
    .line 235
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 236
    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    const-string v1, "Unsupported color format: "

    .line 240
    .line 241
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    iget v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->colorFormat:I

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/AndroidVideoDecoder;->stopOnOutputThread(Ljava/lang/Exception;)V

    .line 257
    .line 258
    .line 259
    return-void

    .line 260
    :cond_3
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 261
    .line 262
    monitor-enter v1

    .line 263
    :try_start_1
    const-string v2, "stride"

    .line 264
    .line 265
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 266
    .line 267
    .line 268
    move-result v2

    .line 269
    if-eqz v2, :cond_4

    .line 270
    .line 271
    const-string v2, "stride"

    .line 272
    .line 273
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    iput v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->stride:I

    .line 278
    .line 279
    goto :goto_2

    .line 280
    :catchall_1
    move-exception p0

    .line 281
    goto :goto_3

    .line 282
    :cond_4
    :goto_2
    const-string v2, "slice-height"

    .line 283
    .line 284
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    if-eqz v2, :cond_5

    .line 289
    .line 290
    const-string v2, "slice-height"

    .line 291
    .line 292
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    iput p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sliceHeight:I

    .line 297
    .line 298
    :cond_5
    const-string p1, "AndroidVideoDecoder"

    .line 299
    .line 300
    new-instance v2, Ljava/lang/StringBuilder;

    .line 301
    .line 302
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    iget v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->stride:I

    .line 306
    .line 307
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    const-string v0, " x "

    .line 311
    .line 312
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    iget v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sliceHeight:I

    .line 316
    .line 317
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-static {p1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    iget p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->width:I

    .line 328
    .line 329
    iget v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->stride:I

    .line 330
    .line 331
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    iput p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->stride:I

    .line 336
    .line 337
    iget p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->height:I

    .line 338
    .line 339
    iget v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sliceHeight:I

    .line 340
    .line 341
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 342
    .line 343
    .line 344
    move-result p1

    .line 345
    iput p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sliceHeight:I

    .line 346
    .line 347
    monitor-exit v1

    .line 348
    return-void

    .line 349
    :goto_3
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 350
    throw p0

    .line 351
    :goto_4
    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 352
    throw p0
.end method

.method private reinitDecode(II)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->decoderThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/momo/rtcbase/AndroidVideoDecoder;->releaseInternal()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 11
    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/AndroidVideoDecoder;->initDecodeInternal(II)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method private releaseCodecOnOutputThread()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "Releasing MediaCodec on output thread"

    .line 7
    .line 8
    const-string v1, "AndroidVideoDecoder"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/momo/rtcbase/MediaCodecWrapper;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    const-string v2, "Media decoder stop failed"

    .line 21
    .line 22
    invoke-static {v1, v2, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 26
    .line 27
    invoke-interface {v0}, Lcom/momo/rtcbase/MediaCodecWrapper;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :catch_1
    move-exception v0

    .line 32
    const-string v2, "Media decoder release failed"

    .line 33
    .line 34
    invoke-static {v1, v2, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 38
    .line 39
    :goto_1
    const-string p0, "Release on output thread done"

    .line 40
    .line 41
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private releaseInternal()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->running:Z

    .line 2
    .line 3
    const-string v1, "AndroidVideoDecoder"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "release: Decoder is not running."

    .line 8
    .line 9
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    const/4 v2, 0x0

    .line 17
    :try_start_0
    iput-boolean v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->running:Z

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 20
    .line 21
    const-wide/16 v3, 0x1388

    .line 22
    .line 23
    invoke-static {v0, v3, v4}, Lcom/momo/rtcbase/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    const-string v0, "Media decoder release timeout"

    .line 30
    .line 31
    new-instance v3, Ljava/lang/RuntimeException;

    .line 32
    .line 33
    invoke-direct {v3}, Ljava/lang/RuntimeException;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v0, v3}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 40
    .line 41
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 42
    .line 43
    sget-object v0, Lcom/momo/rtcbase/VideoCodecStatus;->TIMEOUT:Lcom/momo/rtcbase/VideoCodecStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    :goto_0
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 46
    .line 47
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 48
    .line 49
    return-object v0

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    const-string v0, "Media decoder release error"

    .line 57
    .line 58
    new-instance v3, Ljava/lang/RuntimeException;

    .line 59
    .line 60
    iget-object v4, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 61
    .line 62
    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v0, v3}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 69
    .line 70
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 71
    .line 72
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 73
    .line 74
    sget-object v0, Lcom/momo/rtcbase/VideoCodecStatus;->ERROR:Lcom/momo/rtcbase/VideoCodecStatus;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 78
    .line 79
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 80
    .line 81
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 82
    .line 83
    return-object p0

    .line 84
    :goto_1
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 85
    .line 86
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 87
    .line 88
    throw v0
.end method

.method private stopOnOutputThread(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->running:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public allocateI420Buffer(II)Lcom/momo/rtcbase/VideoFrame$I420Buffer;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/momo/rtcbase/JavaI420Buffer;->allocate(II)Lcom/momo/rtcbase/JavaI420Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/momo/rtcbase/YuvHelper;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public createSurfaceTextureHelper()Lcom/momo/rtcbase/SurfaceTextureHelper;
    .locals 1

    .line 1
    const-string v0, "decoder-texture-thread"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/momo/rtcbase/EglBase$Context;)Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public decode(Lcom/momo/rtcbase/EncodedImage;Lcom/momo/rtcbase/VideoDecoder$DecodeInfo;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 8

    .line 1
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->decoderThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p2, :cond_a

    .line 10
    .line 11
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->callback:Lcom/momo/rtcbase/VideoDecoder$Callback;

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    iget-object p2, p1, Lcom/momo/rtcbase/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    const-string p0, "AndroidVideoDecoder"

    .line 22
    .line 23
    const-string p1, "decode() - no input data"

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->ERR_PARAMETER:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    invoke-virtual {p2}, Ljava/nio/Buffer;->remaining()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-nez v4, :cond_2

    .line 36
    .line 37
    const-string p0, "AndroidVideoDecoder"

    .line 38
    .line 39
    const-string p1, "decode() - input buffer empty"

    .line 40
    .line 41
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->ERR_PARAMETER:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_2
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 48
    .line 49
    monitor-enter p2

    .line 50
    :try_start_0
    iget v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->width:I

    .line 51
    .line 52
    iget v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->height:I

    .line 53
    .line 54
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    iget p2, p1, Lcom/momo/rtcbase/EncodedImage;->encodedWidth:I

    .line 56
    .line 57
    iget v3, p1, Lcom/momo/rtcbase/EncodedImage;->encodedHeight:I

    .line 58
    .line 59
    mul-int v5, p2, v3

    .line 60
    .line 61
    if-lez v5, :cond_4

    .line 62
    .line 63
    if-ne p2, v1, :cond_3

    .line 64
    .line 65
    if-eq v3, v2, :cond_4

    .line 66
    .line 67
    :cond_3
    invoke-direct {p0, p2, v3}, Lcom/momo/rtcbase/AndroidVideoDecoder;->reinitDecode(II)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    sget-object v1, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 72
    .line 73
    if-eq p2, v1, :cond_4

    .line 74
    .line 75
    return-object p2

    .line 76
    :cond_4
    iget-boolean p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->keyFrameRequired:Z

    .line 77
    .line 78
    if-eqz p2, :cond_6

    .line 79
    .line 80
    iget-object p2, p1, Lcom/momo/rtcbase/EncodedImage;->frameType:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 81
    .line 82
    sget-object v1, Lcom/momo/rtcbase/EncodedImage$FrameType;->VideoFrameKey:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 83
    .line 84
    if-eq p2, v1, :cond_5

    .line 85
    .line 86
    const-string p0, "AndroidVideoDecoder"

    .line 87
    .line 88
    const-string p1, "decode() - key frame required first"

    .line 89
    .line 90
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_5
    iget-boolean p2, p1, Lcom/momo/rtcbase/EncodedImage;->completeFrame:Z

    .line 97
    .line 98
    if-nez p2, :cond_6

    .line 99
    .line 100
    const-string p0, "AndroidVideoDecoder"

    .line 101
    .line 102
    const-string p1, "decode() - complete frame required first"

    .line 103
    .line 104
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 108
    .line 109
    return-object p0

    .line 110
    :cond_6
    :try_start_1
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 111
    .line 112
    const-wide/32 v1, 0x7a120

    .line 113
    .line 114
    .line 115
    invoke-interface {p2, v1, v2}, Lcom/momo/rtcbase/MediaCodecWrapper;->dequeueInputBuffer(J)I

    .line 116
    .line 117
    .line 118
    move-result v2
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_2

    .line 119
    if-gez v2, :cond_7

    .line 120
    .line 121
    const-string p0, "AndroidVideoDecoder"

    .line 122
    .line 123
    const-string p1, "decode() - no HW buffers available; decoder falling behind"

    .line 124
    .line 125
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->ERROR:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 129
    .line 130
    return-object p0

    .line 131
    :cond_7
    :try_start_2
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 132
    .line 133
    invoke-interface {p2}, Lcom/momo/rtcbase/MediaCodecWrapper;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    aget-object p2, p2, v2
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1

    .line 138
    .line 139
    invoke-virtual {p2}, Ljava/nio/Buffer;->capacity()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-ge v1, v4, :cond_8

    .line 144
    .line 145
    const-string p0, "AndroidVideoDecoder"

    .line 146
    .line 147
    const-string p1, "decode() - HW buffer too small"

    .line 148
    .line 149
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->ERROR:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 153
    .line 154
    return-object p0

    .line 155
    :cond_8
    iget-object v1, p1, Lcom/momo/rtcbase/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 156
    .line 157
    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    .line 160
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->frameInfos:Ljava/util/concurrent/BlockingDeque;

    .line 161
    .line 162
    new-instance v1, Lcom/momo/rtcbase/AndroidVideoDecoder$FrameInfo;

    .line 163
    .line 164
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 165
    .line 166
    .line 167
    move-result-wide v5

    .line 168
    iget v3, p1, Lcom/momo/rtcbase/EncodedImage;->rotation:I

    .line 169
    .line 170
    invoke-direct {v1, v5, v6, v3}, Lcom/momo/rtcbase/AndroidVideoDecoder$FrameInfo;-><init>(JI)V

    .line 171
    .line 172
    .line 173
    invoke-interface {p2, v1}, Ljava/util/concurrent/BlockingDeque;->offer(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    :try_start_3
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 177
    .line 178
    iget-wide p1, p1, Lcom/momo/rtcbase/EncodedImage;->captureTimeNs:J

    .line 179
    .line 180
    const-wide/16 v5, 0x3e8

    .line 181
    .line 182
    div-long v5, p1, v5

    .line 183
    .line 184
    const/4 v7, 0x0

    .line 185
    const/4 v3, 0x0

    .line 186
    invoke-interface/range {v1 .. v7}, Lcom/momo/rtcbase/MediaCodecWrapper;->queueInputBuffer(IIIJI)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_0

    .line 187
    .line 188
    .line 189
    iget-boolean p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->keyFrameRequired:Z

    .line 190
    .line 191
    if-eqz p1, :cond_9

    .line 192
    .line 193
    iput-boolean v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->keyFrameRequired:Z

    .line 194
    .line 195
    :cond_9
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 196
    .line 197
    return-object p0

    .line 198
    :catch_0
    move-exception v0

    .line 199
    move-object p1, v0

    .line 200
    const-string p2, "AndroidVideoDecoder"

    .line 201
    .line 202
    const-string v0, "queueInputBuffer failed"

    .line 203
    .line 204
    invoke-static {p2, v0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 205
    .line 206
    .line 207
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->frameInfos:Ljava/util/concurrent/BlockingDeque;

    .line 208
    .line 209
    invoke-interface {p0}, Ljava/util/Deque;->pollLast()Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->ERROR:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 213
    .line 214
    return-object p0

    .line 215
    :catch_1
    move-exception v0

    .line 216
    move-object p0, v0

    .line 217
    const-string p1, "AndroidVideoDecoder"

    .line 218
    .line 219
    const-string p2, "getInputBuffers failed"

    .line 220
    .line 221
    invoke-static {p1, p2, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 222
    .line 223
    .line 224
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->ERROR:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 225
    .line 226
    return-object p0

    .line 227
    :catch_2
    move-exception v0

    .line 228
    move-object p0, v0

    .line 229
    const-string p1, "AndroidVideoDecoder"

    .line 230
    .line 231
    const-string p2, "dequeueInputBuffer failed"

    .line 232
    .line 233
    invoke-static {p1, p2, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 234
    .line 235
    .line 236
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->ERROR:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 237
    .line 238
    return-object p0

    .line 239
    :catchall_0
    move-exception v0

    .line 240
    move-object p0, v0

    .line 241
    :try_start_4
    monitor-exit p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 242
    throw p0

    .line 243
    :cond_a
    :goto_0
    const-string p1, "AndroidVideoDecoder"

    .line 244
    .line 245
    new-instance p2, Ljava/lang/StringBuilder;

    .line 246
    .line 247
    const-string v1, "decode uninitalized, codec: "

    .line 248
    .line 249
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 253
    .line 254
    if-eqz v1, :cond_b

    .line 255
    .line 256
    const/4 v0, 0x1

    .line 257
    :cond_b
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v0, ", callback: "

    .line 261
    .line 262
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->callback:Lcom/momo/rtcbase/VideoDecoder$Callback;

    .line 266
    .line 267
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-static {p1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->UNINITIALIZED:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 278
    .line 279
    return-object p0
.end method

.method public deliverDecodedFrame()V
    .locals 8

    .line 1
    const-string v0, "AndroidVideoDecoder"

    .line 2
    .line 3
    const-string v1, "dequeueOutputBuffer returned "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    new-instance v2, Landroid/media/MediaCodec$BufferInfo;

    .line 11
    .line 12
    invoke-direct {v2}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object v3, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 16
    .line 17
    const-wide/32 v4, 0x186a0

    .line 18
    .line 19
    .line 20
    invoke-interface {v3, v2, v4, v5}, Lcom/momo/rtcbase/MediaCodecWrapper;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/4 v4, -0x2

    .line 25
    if-ne v3, v4, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 28
    .line 29
    invoke-interface {v1}, Lcom/momo/rtcbase/MediaCodecWrapper;->getOutputFormat()Landroid/media/MediaFormat;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {p0, v1}, Lcom/momo/rtcbase/AndroidVideoDecoder;->reformat(Landroid/media/MediaFormat;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    if-gez v3, :cond_1

    .line 40
    .line 41
    new-instance p0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->frameInfos:Ljava/util/concurrent/BlockingDeque;

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/concurrent/BlockingDeque;->poll()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Lcom/momo/rtcbase/AndroidVideoDecoder$FrameInfo;

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    iget-wide v6, v1, Lcom/momo/rtcbase/AndroidVideoDecoder$FrameInfo;->decodeStartTimeMs:J

    .line 72
    .line 73
    sub-long/2addr v4, v6

    .line 74
    long-to-int v4, v4

    .line 75
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    iget v1, v1, Lcom/momo/rtcbase/AndroidVideoDecoder$FrameInfo;->rotation:I

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    const/4 v4, 0x0

    .line 83
    const/4 v1, 0x0

    .line 84
    :goto_0
    const/4 v5, 0x1

    .line 85
    iput-boolean v5, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 86
    .line 87
    iget-object v5, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 88
    .line 89
    if-eqz v5, :cond_3

    .line 90
    .line 91
    invoke-direct {p0, v3, v2, v1, v4}, Lcom/momo/rtcbase/AndroidVideoDecoder;->deliverTextureFrame(ILandroid/media/MediaCodec$BufferInfo;ILjava/lang/Integer;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    invoke-direct {p0, v3, v2, v1, v4}, Lcom/momo/rtcbase/AndroidVideoDecoder;->deliverByteFrame(ILandroid/media/MediaCodec$BufferInfo;ILjava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :goto_1
    const-string v1, "deliverDecodedFrame failed"

    .line 100
    .line 101
    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public getImplementationName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrefersLateDecoding()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public initDecode(Lcom/momo/rtcbase/VideoDecoder$Settings;Lcom/momo/rtcbase/VideoDecoder$Callback;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->decoderThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->callback:Lcom/momo/rtcbase/VideoDecoder$Callback;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/momo/rtcbase/AndroidVideoDecoder;->createSurfaceTextureHelper()Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iput-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 19
    .line 20
    new-instance p2, Landroid/view/Surface;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {p2, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 29
    .line 30
    .line 31
    iput-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 32
    .line 33
    iget-object p2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 34
    .line 35
    invoke-virtual {p2, p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->startListening(Lcom/momo/rtcbase/VideoSink;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget p2, p1, Lcom/momo/rtcbase/VideoDecoder$Settings;->width:I

    .line 39
    .line 40
    iget p1, p1, Lcom/momo/rtcbase/VideoDecoder$Settings;->height:I

    .line 41
    .line 42
    invoke-direct {p0, p2, p1}, Lcom/momo/rtcbase/AndroidVideoDecoder;->initDecodeInternal(II)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public onFrame(Lcom/momo/rtcbase/VideoFrame;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-wide v2, v1, Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;->presentationTimestampUs:J

    .line 9
    .line 10
    const-wide/16 v4, 0x3e8

    .line 11
    .line 12
    mul-long/2addr v2, v4

    .line 13
    iget-object v1, v1, Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;->decodeTimeMs:Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    iput-object v4, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 20
    .line 21
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    new-instance v0, Lcom/momo/rtcbase/VideoFrame;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getRotation()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-direct {v0, v5, p1, v2, v3}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->callback:Lcom/momo/rtcbase/VideoDecoder$Callback;

    .line 36
    .line 37
    invoke-interface {p0, v0, v1, v4}, Lcom/momo/rtcbase/VideoDecoder$Callback;->onDecodedFrame(Lcom/momo/rtcbase/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 44
    .line 45
    const-string p1, "Rendered texture metadata was null in onTextureFrameAvailable."

    .line 46
    .line 47
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw p0

    .line 51
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw p0
.end method

.method public release()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 3

    .line 1
    const-string v0, "AndroidVideoDecoder"

    .line 2
    .line 3
    const-string v1, "release"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/rtcbase/AndroidVideoDecoder;->releaseInternal()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/momo/rtcbase/AndroidVideoDecoder;->releaseSurface()V

    .line 18
    .line 19
    .line 20
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/momo/rtcbase/SurfaceTextureHelper;->stopListening()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/momo/rtcbase/SurfaceTextureHelper;->dispose()V

    .line 30
    .line 31
    .line 32
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 33
    .line 34
    :cond_0
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 35
    .line 36
    monitor-enter v1

    .line 37
    :try_start_0
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/momo/rtcbase/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 38
    .line 39
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    iput-object v2, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->callback:Lcom/momo/rtcbase/VideoDecoder$Callback;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->frameInfos:Ljava/util/concurrent/BlockingDeque;

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    throw p0
.end method

.method public releaseSurface()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Surface;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
