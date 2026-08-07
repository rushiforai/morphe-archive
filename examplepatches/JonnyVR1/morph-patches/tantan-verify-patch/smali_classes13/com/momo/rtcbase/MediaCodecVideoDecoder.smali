.class public Lcom/momo/rtcbase/MediaCodecVideoDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;,
        Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;,
        Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;,
        Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;,
        Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;,
        Lcom/momo/rtcbase/MediaCodecVideoDecoder$MediaCodecVideoDecoderErrorCallback;,
        Lcom/momo/rtcbase/MediaCodecVideoDecoder$VideoCodecType;,
        Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final COLOR_QCOM_FORMATYUV420PackedSemiPlanar32m:I = 0x7fa30c04

.field private static final COLOR_QCOM_FORMATYVU420PackedSemiPlanar16m4ka:I = 0x7fa30c02

.field private static final COLOR_QCOM_FORMATYVU420PackedSemiPlanar32m4ka:I = 0x7fa30c01

.field private static final COLOR_QCOM_FORMATYVU420PackedSemiPlanar64x32Tile2m8ka:I = 0x7fa30c03

.field private static final DEQUEUE_INPUT_TIMEOUT:I = 0x7a120

.field private static final FORMAT_KEY_CROP_BOTTOM:Ljava/lang/String; = "crop-bottom"

.field private static final FORMAT_KEY_CROP_LEFT:Ljava/lang/String; = "crop-left"

.field private static final FORMAT_KEY_CROP_RIGHT:Ljava/lang/String; = "crop-right"

.field private static final FORMAT_KEY_CROP_TOP:Ljava/lang/String; = "crop-top"

.field private static final FORMAT_KEY_SLICE_HEIGHT:Ljava/lang/String; = "slice-height"

.field private static final FORMAT_KEY_STRIDE:Ljava/lang/String; = "stride"

.field private static final H264_MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static final MAX_DECODE_TIME_MS:J = 0xc8L

.field private static final MAX_QUEUED_OUTPUTBUFFERS:I = 0x3

.field private static final MEDIA_CODEC_RELEASE_TIMEOUT_MS:I = 0x1388

.field private static final TAG:Ljava/lang/String; = "MediaCodecVideoDecoder"

.field private static final VP8_MIME_TYPE:Ljava/lang/String; = "video/x-vnd.on2.vp8"

.field private static final VP9_MIME_TYPE:Ljava/lang/String; = "video/x-vnd.on2.vp9"

.field private static codecErrors:I = 0x0

.field private static eglBase:Lcom/momo/rtcbase/EglBase; = null

.field private static errorCallback:Lcom/momo/rtcbase/MediaCodecVideoDecoder$MediaCodecVideoDecoderErrorCallback; = null

.field private static hwDecoderDisabledTypes:Ljava/util/Set; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static runningInstance:Lcom/momo/rtcbase/MediaCodecVideoDecoder; = null

.field private static final supportedColorList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final supportedExynosH264HighProfileHwCodecPrefix:Ljava/lang/String; = "OMX.Exynos."

.field private static final supportedMediaTekH264HighProfileHwCodecPrefix:Ljava/lang/String; = "OMX.MTK."

.field private static final supportedQcomH264HighProfileHwCodecPrefix:Ljava/lang/String; = "OMX.qcom."

.field private static final supportedVp9HwCodecPrefixes:[Ljava/lang/String;


# instance fields
.field private colorFormat:I

.field private final decodeStartTimeMs:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;",
            ">;"
        }
    .end annotation
.end field

.field private final dequeuedSurfaceOutputBuffers:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private droppedFrames:I

.field private hasDecodedFirstFrame:Z

.field private height:I

.field private inputBuffers:[Ljava/nio/ByteBuffer;

.field private mediaCodec:Landroid/media/MediaCodec;

.field private mediaCodecThread:Ljava/lang/Thread;

.field private outputBuffers:[Ljava/nio/ByteBuffer;

.field private sliceHeight:I

.field private stride:I

.field private surface:Landroid/view/Surface;

.field private textureListener:Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hwDecoderDisabledTypes:Ljava/util/Set;

    .line 7
    .line 8
    const-string v0, "OMX.qcom."

    .line 9
    .line 10
    const-string v1, "OMX.Exynos."

    .line 11
    .line 12
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedVp9HwCodecPrefixes:[Ljava/lang/String;

    .line 17
    .line 18
    const/16 v0, 0x13

    .line 19
    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/16 v0, 0x15

    .line 25
    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const v0, 0x7fa30c00

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const v0, 0x7fa30c01

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    const v0, 0x7fa30c02

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const v0, 0x7fa30c03

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    const v0, 0x7fa30c04

    .line 59
    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    filled-new-array/range {v1 .. v7}, [Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedColorList:Ljava/util/List;

    .line 74
    .line 75
    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayDeque;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->decodeStartTimeMs:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 17
    .line 18
    return-void
.end method

.method private MaybeRenderDecodedTextureBuffer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->textureListener:Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->isWaitingForTexture()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->textureListener:Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->addBufferToRender(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$1000(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {p0, v0, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic access$000(Ljava/lang/String;Z)J
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->nativeCreateDecoder(Ljava/lang/String;Z)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/MediaCodecVideoDecoder;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p0
.end method

.method private checkOnMediaCodecThread()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "MediaCodecVideoDecoder previously operated on "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p0, " but is now called on "

    .line 33
    .line 34
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v0, p0, v1}, Ll/l5j;->a(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static createFactory()Lcom/momo/rtcbase/VideoDecoderFactory;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/DefaultVideoDecoderFactory;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/momo/rtcbase/DefaultVideoDecoderFactory;-><init>(Lcom/momo/rtcbase/VideoDecoderFactory;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private dequeueInputBuffer()I
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->checkOnMediaCodecThread()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 5
    .line 6
    const-wide/32 v0, 0x7a120

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 10
    .line 11
    .line 12
    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return p0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string v0, "MediaCodecVideoDecoder"

    .line 16
    .line 17
    const-string v1, "dequeueIntputBuffer failed"

    .line 18
    .line 19
    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, -0x2

    .line 23
    return p0
.end method

.method private dequeueOutputBuffer(I)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;
    .locals 22
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->checkOnMediaCodecThread()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->decodeStartTimeMs:Ljava/util/Queue;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return-object v2

    .line 16
    :cond_0
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 17
    .line 18
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 22
    .line 23
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    .line 25
    move/from16 v5, p1

    .line 26
    .line 27
    int-to-long v6, v5

    .line 28
    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v6

    .line 32
    invoke-virtual {v3, v1, v6, v7}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 33
    .line 34
    .line 35
    move-result v9

    .line 36
    const/4 v3, -0x3

    .line 37
    const-string v4, "MediaCodecVideoDecoder"

    .line 38
    .line 39
    if-eq v9, v3, :cond_c

    .line 40
    .line 41
    const/4 v3, -0x2

    .line 42
    const/4 v6, 0x1

    .line 43
    if-eq v9, v3, :cond_3

    .line 44
    .line 45
    const/4 v3, -0x1

    .line 46
    if-eq v9, v3, :cond_2

    .line 47
    .line 48
    iput-boolean v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hasDecodedFirstFrame:Z

    .line 49
    .line 50
    iget-object v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->decodeStartTimeMs:Ljava/util/Queue;

    .line 51
    .line 52
    invoke-interface {v2}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;

    .line 57
    .line 58
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->access$700(Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;)J

    .line 63
    .line 64
    .line 65
    move-result-wide v7

    .line 66
    sub-long/2addr v5, v7

    .line 67
    const-wide/16 v7, 0xc8

    .line 68
    .line 69
    cmp-long v3, v5, v7

    .line 70
    .line 71
    if-lez v3, :cond_1

    .line 72
    .line 73
    new-instance v3, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v10, "Very high decode time: "

    .line 76
    .line 77
    invoke-direct {v3, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v5, "ms. Q size: "

    .line 84
    .line 85
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v0, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->decodeStartTimeMs:Ljava/util/Queue;

    .line 89
    .line 90
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v0, ". Might be caused by resuming H264 decoding after a pause."

    .line 98
    .line 99
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v4, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    move-wide/from16 v18, v7

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_1
    move-wide/from16 v18, v5

    .line 113
    .line 114
    :goto_1
    new-instance v8, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 115
    .line 116
    iget v10, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 117
    .line 118
    iget v11, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 119
    .line 120
    iget-wide v0, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 121
    .line 122
    const-wide/16 v3, 0x3e8

    .line 123
    .line 124
    div-long v12, v0, v3

    .line 125
    .line 126
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->access$800(Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;)J

    .line 127
    .line 128
    .line 129
    move-result-wide v14

    .line 130
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->access$900(Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;)J

    .line 131
    .line 132
    .line 133
    move-result-wide v16

    .line 134
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 135
    .line 136
    .line 137
    move-result-wide v20

    .line 138
    invoke-direct/range {v8 .. v21}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;-><init>(IIIJJJJJ)V

    .line 139
    .line 140
    .line 141
    return-object v8

    .line 142
    :cond_2
    return-object v2

    .line 143
    :cond_3
    iget-object v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 144
    .line 145
    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    new-instance v7, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v8, "Decoder format changed: "

    .line 152
    .line 153
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v8

    .line 160
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v7

    .line 167
    invoke-static {v4, v7}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    const-string v7, "crop-left"

    .line 171
    .line 172
    invoke-virtual {v3, v7}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v8

    .line 176
    if-eqz v8, :cond_4

    .line 177
    .line 178
    const-string v8, "crop-right"

    .line 179
    .line 180
    invoke-virtual {v3, v8}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 181
    .line 182
    .line 183
    move-result v9

    .line 184
    if-eqz v9, :cond_4

    .line 185
    .line 186
    const-string v9, "crop-bottom"

    .line 187
    .line 188
    invoke-virtual {v3, v9}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 189
    .line 190
    .line 191
    move-result v10

    .line 192
    if-eqz v10, :cond_4

    .line 193
    .line 194
    const-string v10, "crop-top"

    .line 195
    .line 196
    invoke-virtual {v3, v10}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 197
    .line 198
    .line 199
    move-result v11

    .line 200
    if-eqz v11, :cond_4

    .line 201
    .line 202
    invoke-virtual {v3, v8}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 203
    .line 204
    .line 205
    move-result v8

    .line 206
    add-int/2addr v8, v6

    .line 207
    invoke-virtual {v3, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 208
    .line 209
    .line 210
    move-result v7

    .line 211
    sub-int/2addr v8, v7

    .line 212
    invoke-virtual {v3, v9}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v7

    .line 216
    add-int/2addr v7, v6

    .line 217
    invoke-virtual {v3, v10}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    move-result v6

    .line 221
    sub-int/2addr v7, v6

    .line 222
    goto :goto_2

    .line 223
    :cond_4
    const-string v6, "width"

    .line 224
    .line 225
    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    move-result v8

    .line 229
    const-string v6, "height"

    .line 230
    .line 231
    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 232
    .line 233
    .line 234
    move-result v7

    .line 235
    :goto_2
    iget-boolean v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hasDecodedFirstFrame:Z

    .line 236
    .line 237
    if-eqz v6, :cond_6

    .line 238
    .line 239
    iget v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->width:I

    .line 240
    .line 241
    if-ne v8, v6, :cond_5

    .line 242
    .line 243
    iget v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->height:I

    .line 244
    .line 245
    if-ne v7, v6, :cond_5

    .line 246
    .line 247
    goto :goto_3

    .line 248
    :cond_5
    new-instance v1, Ljava/lang/RuntimeException;

    .line 249
    .line 250
    iget v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->width:I

    .line 251
    .line 252
    iget v0, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->height:I

    .line 253
    .line 254
    new-instance v3, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    const-string v4, "Unexpected size change. Configured "

    .line 257
    .line 258
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    const-string v2, "*"

    .line 265
    .line 266
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string v0, ". New "

    .line 273
    .line 274
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    throw v1

    .line 294
    :cond_6
    :goto_3
    iput v8, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->width:I

    .line 295
    .line 296
    iput v7, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->height:I

    .line 297
    .line 298
    iget-object v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->textureListener:Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

    .line 299
    .line 300
    if-eqz v6, :cond_7

    .line 301
    .line 302
    invoke-virtual {v6, v8, v7}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->setSize(II)V

    .line 303
    .line 304
    .line 305
    :cond_7
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->useSurface()Z

    .line 306
    .line 307
    .line 308
    move-result v6

    .line 309
    if-nez v6, :cond_9

    .line 310
    .line 311
    const-string v6, "color-format"

    .line 312
    .line 313
    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 314
    .line 315
    .line 316
    move-result v7

    .line 317
    if-eqz v7, :cond_9

    .line 318
    .line 319
    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 320
    .line 321
    .line 322
    move-result v6

    .line 323
    iput v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->colorFormat:I

    .line 324
    .line 325
    new-instance v6, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    const-string v7, "Color: 0x"

    .line 328
    .line 329
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    iget v7, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->colorFormat:I

    .line 333
    .line 334
    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v7

    .line 338
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v6

    .line 345
    invoke-static {v4, v6}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    sget-object v6, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedColorList:Ljava/util/List;

    .line 349
    .line 350
    iget v7, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->colorFormat:I

    .line 351
    .line 352
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 353
    .line 354
    .line 355
    move-result-object v7

    .line 356
    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result v6

    .line 360
    if-eqz v6, :cond_8

    .line 361
    .line 362
    goto :goto_4

    .line 363
    :cond_8
    const-string v1, "Non supported color format: "

    .line 364
    .line 365
    iget v0, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->colorFormat:I

    .line 366
    .line 367
    invoke-static {v1, v0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 368
    .line 369
    .line 370
    return-object v2

    .line 371
    :cond_9
    :goto_4
    const-string v6, "stride"

    .line 372
    .line 373
    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 374
    .line 375
    .line 376
    move-result v7

    .line 377
    if-eqz v7, :cond_a

    .line 378
    .line 379
    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 380
    .line 381
    .line 382
    move-result v6

    .line 383
    iput v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->stride:I

    .line 384
    .line 385
    :cond_a
    const-string v6, "slice-height"

    .line 386
    .line 387
    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 388
    .line 389
    .line 390
    move-result v7

    .line 391
    if-eqz v7, :cond_b

    .line 392
    .line 393
    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 394
    .line 395
    .line 396
    move-result v3

    .line 397
    iput v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->sliceHeight:I

    .line 398
    .line 399
    :cond_b
    new-instance v3, Ljava/lang/StringBuilder;

    .line 400
    .line 401
    const-string v6, "Frame stride and slice height: "

    .line 402
    .line 403
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    iget v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->stride:I

    .line 407
    .line 408
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    const-string v6, " x "

    .line 412
    .line 413
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    iget v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->sliceHeight:I

    .line 417
    .line 418
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 419
    .line 420
    .line 421
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v3

    .line 425
    invoke-static {v4, v3}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    iget v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->width:I

    .line 429
    .line 430
    iget v4, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->stride:I

    .line 431
    .line 432
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 433
    .line 434
    .line 435
    move-result v3

    .line 436
    iput v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->stride:I

    .line 437
    .line 438
    iget v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->height:I

    .line 439
    .line 440
    iget v4, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->sliceHeight:I

    .line 441
    .line 442
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 443
    .line 444
    .line 445
    move-result v3

    .line 446
    iput v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->sliceHeight:I

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :cond_c
    iget-object v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 451
    .line 452
    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 453
    .line 454
    .line 455
    move-result-object v3

    .line 456
    iput-object v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 457
    .line 458
    new-instance v3, Ljava/lang/StringBuilder;

    .line 459
    .line 460
    const-string v6, "Decoder output buffers changed: "

    .line 461
    .line 462
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    iget-object v6, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 466
    .line 467
    array-length v6, v6

    .line 468
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v3

    .line 475
    invoke-static {v4, v3}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    iget-boolean v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hasDecodedFirstFrame:Z

    .line 479
    .line 480
    if-nez v3, :cond_d

    .line 481
    .line 482
    goto/16 :goto_0

    .line 483
    .line 484
    :cond_d
    const-string v0, "Unexpected output buffer change event."

    .line 485
    .line 486
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    return-object v2
.end method

.method private dequeueTextureBuffer(I)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;
    .locals 14
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->checkOnMediaCodecThread()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->useSurface()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeueOutputBuffer(I)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 18
    .line 19
    invoke-interface {v2, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->MaybeRenderDecodedTextureBuffer()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->textureListener:Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->dequeueTextureBuffer(I)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->MaybeRenderDecodedTextureBuffer()V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    array-length v2, v2

    .line 46
    const/4 v3, 0x3

    .line 47
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-ge v0, v2, :cond_3

    .line 52
    .line 53
    if-lez p1, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-object v1

    .line 65
    :cond_3
    :goto_0
    iget v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->droppedFrames:I

    .line 66
    .line 67
    add-int/lit8 v0, v0, 0x1

    .line 68
    .line 69
    iput v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->droppedFrames:I

    .line 70
    .line 71
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 78
    .line 79
    const-string v1, ". Total number of dropped frames: "

    .line 80
    .line 81
    const-string v2, "MediaCodecVideoDecoder"

    .line 82
    .line 83
    if-lez p1, :cond_4

    .line 84
    .line 85
    new-instance p1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v3, "Draining decoder. Dropping frame with TS: "

    .line 88
    .line 89
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$200(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v3

    .line 96
    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->droppedFrames:I

    .line 103
    .line 104
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {v2, p1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v3, "Too many output buffers "

    .line 118
    .line 119
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v3, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 123
    .line 124
    invoke-interface {v3}, Ljava/util/Collection;->size()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v3, ". Dropping frame with TS: "

    .line 132
    .line 133
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$200(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 137
    .line 138
    .line 139
    move-result-wide v3

    .line 140
    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->droppedFrames:I

    .line 147
    .line 148
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-static {v2, p1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :goto_1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 159
    .line 160
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$1000(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    const/4 v1, 0x0

    .line 165
    invoke-virtual {p0, p1, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 166
    .line 167
    .line 168
    new-instance v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 169
    .line 170
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$200(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 171
    .line 172
    .line 173
    move-result-wide v4

    .line 174
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$300(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 175
    .line 176
    .line 177
    move-result-wide v6

    .line 178
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$400(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 179
    .line 180
    .line 181
    move-result-wide v8

    .line 182
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$500(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 183
    .line 184
    .line 185
    move-result-wide v10

    .line 186
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 187
    .line 188
    .line 189
    move-result-wide p0

    .line 190
    invoke-static {v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$600(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 191
    .line 192
    .line 193
    move-result-wide v0

    .line 194
    sub-long v12, p0, v0

    .line 195
    .line 196
    const/4 v3, 0x0

    .line 197
    invoke-direct/range {v2 .. v13}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;JJJJJ)V

    .line 198
    .line 199
    .line 200
    return-object v2

    .line 201
    :cond_5
    const-string p0, "dequeueTexture() called for byte buffer decoding."

    .line 202
    .line 203
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    return-object v1
.end method

.method public static disableH264HwCodec()V
    .locals 2

    .line 1
    const-string v0, "MediaCodecVideoDecoder"

    .line 2
    .line 3
    const-string v1, "H.264 decoding is disabled by application."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hwDecoderDisabledTypes:Ljava/util/Set;

    .line 9
    .line 10
    const-string v1, "video/avc"

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static disableVp8HwCodec()V
    .locals 2

    .line 1
    const-string v0, "MediaCodecVideoDecoder"

    .line 2
    .line 3
    const-string v1, "VP8 decoding is disabled by application."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hwDecoderDisabledTypes:Ljava/util/Set;

    .line 9
    .line 10
    const-string v1, "video/x-vnd.on2.vp8"

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static disableVp9HwCodec()V
    .locals 2

    .line 1
    const-string v0, "MediaCodecVideoDecoder"

    .line 2
    .line 3
    const-string v1, "VP9 decoding is disabled by application."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hwDecoderDisabledTypes:Ljava/util/Set;

    .line 9
    .line 10
    const-string v1, "video/x-vnd.on2.vp9"

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static disposeEglContext()V
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private static findDecoder(Ljava/lang/String;[Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Trying to find HW decoder for mime "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MediaCodecVideoDecoder"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    move v2, v0

    .line 22
    :goto_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/4 v4, 0x0

    .line 27
    if-ge v2, v3, :cond_9

    .line 28
    .line 29
    :try_start_0
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    goto :goto_1

    .line 34
    :catch_0
    move-exception v3

    .line 35
    const-string v5, "Cannot retrieve decoder codec info"

    .line 36
    .line 37
    invoke-static {v1, v5, v3}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    move-object v3, v4

    .line 41
    :goto_1
    if-eqz v3, :cond_8

    .line 42
    .line 43
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eqz v5, :cond_0

    .line 48
    .line 49
    goto/16 :goto_7

    .line 50
    .line 51
    :cond_0
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    array-length v6, v5

    .line 56
    move v7, v0

    .line 57
    :goto_2
    if-ge v7, v6, :cond_2

    .line 58
    .line 59
    aget-object v8, v5, v7

    .line 60
    .line 61
    invoke-virtual {v8, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    if-eqz v8, :cond_1

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    goto :goto_3

    .line 72
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_2
    :goto_3
    if-nez v4, :cond_3

    .line 76
    .line 77
    goto/16 :goto_7

    .line 78
    .line 79
    :cond_3
    const-string v5, "Found candidate decoder "

    .line 80
    .line 81
    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-static {v1, v5}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    array-length v5, p1

    .line 89
    move v6, v0

    .line 90
    :goto_4
    if-ge v6, v5, :cond_8

    .line 91
    .line 92
    aget-object v7, p1, v6

    .line 93
    .line 94
    invoke-virtual {v4, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    if-eqz v7, :cond_7

    .line 99
    .line 100
    :try_start_1
    invoke-virtual {v3, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 101
    .line 102
    .line 103
    move-result-object v3
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 104
    iget-object v5, v3, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 105
    .line 106
    array-length v6, v5

    .line 107
    move v7, v0

    .line 108
    :goto_5
    if-ge v7, v6, :cond_4

    .line 109
    .line 110
    aget v8, v5, v7

    .line 111
    .line 112
    new-instance v9, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v10, "   Color: 0x"

    .line 115
    .line 116
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v8

    .line 130
    invoke-static {v1, v8}, Lcom/momo/rtcbase/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    add-int/lit8 v7, v7, 0x1

    .line 134
    .line 135
    goto :goto_5

    .line 136
    :cond_4
    sget-object v5, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedColorList:Ljava/util/List;

    .line 137
    .line 138
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    :cond_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 143
    .line 144
    .line 145
    move-result v6

    .line 146
    if-eqz v6, :cond_8

    .line 147
    .line 148
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    check-cast v6, Ljava/lang/Integer;

    .line 153
    .line 154
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    iget-object v7, v3, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 159
    .line 160
    array-length v8, v7

    .line 161
    move v9, v0

    .line 162
    :goto_6
    if-ge v9, v8, :cond_5

    .line 163
    .line 164
    aget v10, v7, v9

    .line 165
    .line 166
    if-ne v10, v6, :cond_6

    .line 167
    .line 168
    new-instance p0, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    const-string p1, "Found target decoder "

    .line 171
    .line 172
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string p1, ". Color: 0x"

    .line 179
    .line 180
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    new-instance p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;

    .line 198
    .line 199
    invoke-direct {p0, v4, v10}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;-><init>(Ljava/lang/String;I)V

    .line 200
    .line 201
    .line 202
    return-object p0

    .line 203
    :cond_6
    add-int/lit8 v9, v9, 0x1

    .line 204
    .line 205
    goto :goto_6

    .line 206
    :catch_1
    move-exception v3

    .line 207
    const-string v4, "Cannot retrieve decoder capabilities"

    .line 208
    .line 209
    invoke-static {v1, v4, v3}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 210
    .line 211
    .line 212
    goto :goto_7

    .line 213
    :cond_7
    add-int/lit8 v6, v6, 0x1

    .line 214
    .line 215
    goto :goto_4

    .line 216
    :cond_8
    :goto_7
    add-int/lit8 v2, v2, 0x1

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    const-string v0, "No HW decoder found for mime "

    .line 223
    .line 224
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    return-object v4
.end method

.method private initDecode(Lcom/momo/rtcbase/MediaCodecVideoDecoder$VideoCodecType;II)Z
    .locals 7
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    const-string v0, "Input buffers: "

    .line 2
    .line 3
    const-string v1, "  Format: "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v2, :cond_7

    .line 9
    .line 10
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$VideoCodecType;->VIDEO_CODEC_VP8:Lcom/momo/rtcbase/MediaCodecVideoDecoder$VideoCodecType;

    .line 11
    .line 12
    if-ne p1, v2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedVp8HwCodecPrefixes()[Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-string v4, "video/x-vnd.on2.vp8"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$VideoCodecType;->VIDEO_CODEC_VP9:Lcom/momo/rtcbase/MediaCodecVideoDecoder$VideoCodecType;

    .line 22
    .line 23
    if-ne p1, v2, :cond_1

    .line 24
    .line 25
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedVp9HwCodecPrefixes:[Ljava/lang/String;

    .line 26
    .line 27
    const-string v4, "video/x-vnd.on2.vp9"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$VideoCodecType;->VIDEO_CODEC_H264:Lcom/momo/rtcbase/MediaCodecVideoDecoder$VideoCodecType;

    .line 31
    .line 32
    if-ne p1, v2, :cond_6

    .line 33
    .line 34
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedH264HwCodecPrefixes()[Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v4, "video/avc"

    .line 39
    .line 40
    :goto_0
    invoke-static {v4, v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->findDecoder(Ljava/lang/String;[Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    if-eqz v2, :cond_5

    .line 45
    .line 46
    new-instance v5, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v6, "Java initDecode: "

    .line 49
    .line 50
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p1, " : "

    .line 57
    .line 58
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p1, " x "

    .line 65
    .line 66
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p1, ". Color: 0x"

    .line 73
    .line 74
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget p1, v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;->colorFormat:I

    .line 78
    .line 79
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string p1, ". Use Surface: "

    .line 87
    .line 88
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->useSurface()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const-string v5, "MediaCodecVideoDecoder"

    .line 103
    .line 104
    invoke-static {v5, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sput-object p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->runningInstance:Lcom/momo/rtcbase/MediaCodecVideoDecoder;

    .line 108
    .line 109
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 114
    .line 115
    :try_start_0
    iput p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->width:I

    .line 116
    .line 117
    iput p3, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->height:I

    .line 118
    .line 119
    iput p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->stride:I

    .line 120
    .line 121
    iput p3, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->sliceHeight:I

    .line 122
    .line 123
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->useSurface()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_2

    .line 128
    .line 129
    const-string p1, "Decoder SurfaceTextureHelper"

    .line 130
    .line 131
    sget-object v6, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 132
    .line 133
    invoke-interface {v6}, Lcom/momo/rtcbase/EglBase;->getEglBaseContext()Lcom/momo/rtcbase/EglBase$Context;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    invoke-static {p1, v6}, Lcom/momo/rtcbase/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/momo/rtcbase/EglBase$Context;)Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    if-eqz p1, :cond_2

    .line 142
    .line 143
    new-instance v6, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

    .line 144
    .line 145
    invoke-direct {v6, p0, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;-><init>(Lcom/momo/rtcbase/MediaCodecVideoDecoder;Lcom/momo/rtcbase/SurfaceTextureHelper;)V

    .line 146
    .line 147
    .line 148
    iput-object v6, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->textureListener:Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

    .line 149
    .line 150
    invoke-virtual {v6, p2, p3}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->setSize(II)V

    .line 151
    .line 152
    .line 153
    new-instance v6, Landroid/view/Surface;

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/momo/rtcbase/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-direct {v6, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 160
    .line 161
    .line 162
    iput-object v6, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->surface:Landroid/view/Surface;

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :catch_0
    move-exception p0

    .line 166
    goto/16 :goto_2

    .line 167
    .line 168
    :cond_2
    :goto_1
    invoke-static {v4, p2, p3}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->useSurface()Z

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    if-nez p2, :cond_3

    .line 177
    .line 178
    const-string p2, "color-format"

    .line 179
    .line 180
    iget p3, v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;->colorFormat:I

    .line 181
    .line 182
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 183
    .line 184
    .line 185
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-static {v5, p2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-object p2, v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;->codecName:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {p2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 203
    .line 204
    .line 205
    move-result-object p2

    .line 206
    iput-object p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 207
    .line 208
    if-nez p2, :cond_4

    .line 209
    .line 210
    const-string p0, "Can not create media decoder"

    .line 211
    .line 212
    invoke-static {v5, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    return v3

    .line 216
    :cond_4
    iget-object p3, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->surface:Landroid/view/Surface;

    .line 217
    .line 218
    const/4 v1, 0x0

    .line 219
    invoke-virtual {p2, p1, p3, v1, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 220
    .line 221
    .line 222
    iget-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 223
    .line 224
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 225
    .line 226
    .line 227
    iget p1, v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;->colorFormat:I

    .line 228
    .line 229
    iput p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->colorFormat:I

    .line 230
    .line 231
    iget-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 232
    .line 233
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 238
    .line 239
    iget-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 240
    .line 241
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 246
    .line 247
    iget-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->decodeStartTimeMs:Ljava/util/Queue;

    .line 248
    .line 249
    invoke-interface {p1}, Ljava/util/Collection;->clear()V

    .line 250
    .line 251
    .line 252
    iput-boolean v3, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hasDecodedFirstFrame:Z

    .line 253
    .line 254
    iget-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 255
    .line 256
    invoke-interface {p1}, Ljava/util/Collection;->clear()V

    .line 257
    .line 258
    .line 259
    iput v3, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->droppedFrames:I

    .line 260
    .line 261
    new-instance p1, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    iget-object p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 267
    .line 268
    array-length p2, p2

    .line 269
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string p2, ". Output buffers: "

    .line 273
    .line 274
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 278
    .line 279
    array-length p0, p0

    .line 280
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    invoke-static {v5, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    .line 289
    .line 290
    const/4 p0, 0x1

    .line 291
    return p0

    .line 292
    :goto_2
    const-string p1, "initDecode failed"

    .line 293
    .line 294
    invoke-static {v5, p1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 295
    .line 296
    .line 297
    return v3

    .line 298
    :cond_5
    const-string p0, "Cannot find HW decoder for "

    .line 299
    .line 300
    invoke-static {p0, p1}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 301
    .line 302
    .line 303
    return v3

    .line 304
    :cond_6
    const-string p0, "initDecode: Non-supported codec "

    .line 305
    .line 306
    invoke-static {p0, p1}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 307
    .line 308
    .line 309
    return v3

    .line 310
    :cond_7
    const-string p0, "initDecode: Forgot to release()?"

    .line 311
    .line 312
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    return v3
.end method

.method public static isH264HighProfileHwSupported()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hwDecoderDisabledTypes:Ljava/util/Set;

    .line 2
    .line 3
    const-string v1, "video/avc"

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    const-string v0, "OMX.qcom."

    .line 14
    .line 15
    filled-new-array {v0}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v1, v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->findDecoder(Ljava/lang/String;[Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v3, 0x1

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    return v3

    .line 27
    :cond_1
    const-string v0, "OMX.Exynos."

    .line 28
    .line 29
    filled-new-array {v0}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v1, v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->findDecoder(Ljava/lang/String;[Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    return v3

    .line 40
    :cond_2
    return v2
.end method

.method public static isH264HwSupported()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hwDecoderDisabledTypes:Ljava/util/Set;

    .line 2
    .line 3
    const-string v1, "video/avc"

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedH264HwCodecPrefixes()[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v1, v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->findDecoder(Ljava/lang/String;[Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    return v0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    return v0
.end method

.method public static isVp8HwSupported()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hwDecoderDisabledTypes:Ljava/util/Set;

    .line 2
    .line 3
    const-string v1, "video/x-vnd.on2.vp8"

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedVp8HwCodecPrefixes()[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v1, v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->findDecoder(Ljava/lang/String;[Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    return v0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    return v0
.end method

.method public static isVp9HwSupported()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hwDecoderDisabledTypes:Ljava/util/Set;

    .line 2
    .line 3
    const-string v1, "video/x-vnd.on2.vp9"

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->supportedVp9HwCodecPrefixes:[Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1, v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->findDecoder(Ljava/lang/String;[Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecoderProperties;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    return v0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    return v0
.end method

.method private static native nativeCreateDecoder(Ljava/lang/String;Z)J
.end method

.method public static printStackTrace()V
    .locals 5

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->runningInstance:Lcom/momo/rtcbase/MediaCodecVideoDecoder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v1, v0

    .line 14
    if-lez v1, :cond_0

    .line 15
    .line 16
    const-string v1, "MediaCodecVideoDecoder stacks trace:"

    .line 17
    .line 18
    const-string v2, "MediaCodecVideoDecoder"

    .line 19
    .line 20
    invoke-static {v2, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    array-length v1, v0

    .line 24
    const/4 v3, 0x0

    .line 25
    :goto_0
    if-ge v3, v1, :cond_0

    .line 26
    .line 27
    aget-object v4, v0, v3

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-static {v2, v4}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v3, v3, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method

.method private queueInputBuffer(IIJJJ)Z
    .locals 13
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->checkOnMediaCodecThread()V

    .line 2
    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    aget-object v0, v0, p1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    aget-object v0, v0, p1

    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->decodeStartTimeMs:Ljava/util/Queue;

    .line 20
    .line 21
    new-instance v6, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;

    .line 22
    .line 23
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v7

    .line 27
    move-wide/from16 v9, p5

    .line 28
    .line 29
    move-wide/from16 v11, p7

    .line 30
    .line 31
    invoke-direct/range {v6 .. v12}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;-><init>(JJJ)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v6}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    const/4 v8, 0x0

    .line 41
    move v3, p1

    .line 42
    move v5, p2

    .line 43
    move-wide/from16 v6, p3

    .line 44
    .line 45
    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :catch_0
    move-exception v0

    .line 51
    move-object p0, v0

    .line 52
    const-string p1, "MediaCodecVideoDecoder"

    .line 53
    .line 54
    const-string v0, "decode failed"

    .line 55
    .line 56
    invoke-static {p1, v0, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    return v1
.end method

.method private release()V
    .locals 5
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Java releaseDecoder. Total number of dropped frames: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->droppedFrames:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "MediaCodecVideoDecoder"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->checkOnMediaCodecThread()V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-direct {v0, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 29
    .line 30
    .line 31
    new-instance v3, Lcom/momo/rtcbase/MediaCodecVideoDecoder$1;

    .line 32
    .line 33
    invoke-direct {v3, p0, v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$1;-><init>(Lcom/momo/rtcbase/MediaCodecVideoDecoder;Ljava/util/concurrent/CountDownLatch;)V

    .line 34
    .line 35
    .line 36
    new-instance v4, Ljava/lang/Thread;

    .line 37
    .line 38
    invoke-direct {v4, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 42
    .line 43
    .line 44
    const-wide/16 v3, 0x1388

    .line 45
    .line 46
    invoke-static {v0, v3, v4}, Lcom/momo/rtcbase/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;J)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_0

    .line 51
    .line 52
    const-string v0, "Media decoder release timeout"

    .line 53
    .line 54
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->codecErrors:I

    .line 58
    .line 59
    add-int/2addr v0, v2

    .line 60
    sput v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->codecErrors:I

    .line 61
    .line 62
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->errorCallback:Lcom/momo/rtcbase/MediaCodecVideoDecoder$MediaCodecVideoDecoderErrorCallback;

    .line 63
    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v2, "Invoke codec error callback. Errors: "

    .line 69
    .line 70
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sget v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->codecErrors:I

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->errorCallback:Lcom/momo/rtcbase/MediaCodecVideoDecoder$MediaCodecVideoDecoderErrorCallback;

    .line 86
    .line 87
    sget v2, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->codecErrors:I

    .line 88
    .line 89
    invoke-interface {v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$MediaCodecVideoDecoderErrorCallback;->onMediaCodecVideoDecoderCriticalError(I)V

    .line 90
    .line 91
    .line 92
    :cond_0
    const/4 v0, 0x0

    .line 93
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 96
    .line 97
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->runningInstance:Lcom/momo/rtcbase/MediaCodecVideoDecoder;

    .line 98
    .line 99
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->useSurface()Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_1

    .line 104
    .line 105
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->surface:Landroid/view/Surface;

    .line 106
    .line 107
    invoke-virtual {v2}, Landroid/view/Surface;->release()V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->surface:Landroid/view/Surface;

    .line 111
    .line 112
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->textureListener:Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->release()V

    .line 115
    .line 116
    .line 117
    :cond_1
    const-string p0, "Java releaseDecoder done"

    .line 118
    .line 119
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private reset(II)V
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "Java reset: "

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " x "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "MediaCodecVideoDecoder"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 39
    .line 40
    .line 41
    iput p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->width:I

    .line 42
    .line 43
    iput p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->height:I

    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->textureListener:Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;

    .line 46
    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {v0, p1, p2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->setSize(II)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->decodeStartTimeMs:Ljava/util/Queue;

    .line 53
    .line 54
    invoke-interface {p1}, Ljava/util/Collection;->clear()V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->dequeuedSurfaceOutputBuffers:Ljava/util/Queue;

    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/Collection;->clear()V

    .line 60
    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    iput-boolean p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->hasDecodedFirstFrame:Z

    .line 64
    .line 65
    iput p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->droppedFrames:I

    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    const-string p0, "Incorrect reset call for non-initialized decoder."

    .line 69
    .line 70
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private returnDecodedOutputBuffer(I)V
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Landroid/media/MediaCodec$CodecException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->checkOnMediaCodecThread()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->useSurface()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "returnDecodedOutputBuffer() called for surface decoding."

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static setEglContext(Lcom/momo/rtcbase/EglBase$Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "MediaCodecVideoDecoder"

    .line 6
    .line 7
    const-string v1, "Egl context already set."

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->release()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-static {p0}, Lcom/momo/rtcbase/EglBase;->create(Lcom/momo/rtcbase/EglBase$Context;)Lcom/momo/rtcbase/EglBase;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sput-object p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 22
    .line 23
    return-void
.end method

.method public static setErrorCallback(Lcom/momo/rtcbase/MediaCodecVideoDecoder$MediaCodecVideoDecoderErrorCallback;)V
    .locals 2

    .line 1
    const-string v0, "MediaCodecVideoDecoder"

    .line 2
    .line 3
    const-string v1, "Set error callback"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->errorCallback:Lcom/momo/rtcbase/MediaCodecVideoDecoder$MediaCodecVideoDecoderErrorCallback;

    .line 9
    .line 10
    return-void
.end method

.method private static final supportedH264HwCodecPrefixes()[Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "OMX.qcom."

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    const-string v1, "OMX.Intel."

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const-string v1, "OMX.Exynos."

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    new-array v1, v1, [Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, [Ljava/lang/String;

    .line 32
    .line 33
    return-object v0
.end method

.method private static final supportedVp8HwCodecPrefixes()[Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "OMX.qcom."

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    const-string v1, "OMX.Nvidia."

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const-string v1, "OMX.Exynos."

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const-string v1, "OMX.Intel."

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    new-array v1, v1, [Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, [Ljava/lang/String;

    .line 37
    .line 38
    return-object v0
.end method

.method public static useSurface()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    return v0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    return v0
.end method


# virtual methods
.method public getColorFormat()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->colorFormat:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getInputBuffers()[Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOutputBuffers()[Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSliceHeight()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->sliceHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getStride()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->stride:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->width:I

    .line 2
    .line 3
    return p0
.end method
