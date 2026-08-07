.class public Lcom/momo/rtcbase/MediaCodecVideoEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;,
        Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;,
        Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecVideoEncoderErrorCallback;,
        Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;,
        Lcom/momo/rtcbase/MediaCodecVideoEncoder$H264Profile;,
        Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;,
        Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;,
        Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final BITRATE_ADJUSTMENT_FPS:I = 0x1e

.field private static final BITRATE_CORRECTION_MAX_SCALE:D = 4.0

.field private static final BITRATE_CORRECTION_SEC:D = 3.0

.field private static final BITRATE_CORRECTION_STEPS:I = 0x14

.field private static final COLOR_QCOM_FORMATYUV420PackedSemiPlanar32m:I = 0x7fa30c04

.field private static final DEQUEUE_TIMEOUT:I = 0x0

.field private static final H264_HW_EXCEPTION_MODELS:[Ljava/lang/String;

.field private static final H264_MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static final MAXIMUM_INITIAL_FPS:I = 0x1e

.field private static final MEDIA_CODEC_RELEASE_TIMEOUT_MS:I = 0x1388

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_L_MS:J = 0x3a98L

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_M_MS:J = 0x4e20L

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_N_MS:J = 0x3a98L

.field private static final TAG:Ljava/lang/String; = "MediaCodecVideoEncoder"

.field private static final VIDEO_AVCLevel3:I = 0x100

.field private static final VIDEO_AVCProfileHigh:I = 0x8

.field private static final VIDEO_ControlRateConstant:I = 0x2

.field private static final VP8_MIME_TYPE:Ljava/lang/String; = "video/x-vnd.on2.vp8"

.field private static final VP9_MIME_TYPE:Ljava/lang/String; = "video/x-vnd.on2.vp9"

.field private static codecErrors:I

.field private static errorCallback:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecVideoEncoderErrorCallback;

.field private static final exynosH264HighProfileHwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static final exynosH264HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static final exynosVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static final exynosVp9HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static final h264HighProfileHwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static hwEncoderDisabledTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final intelVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static final mediatekH264HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static final qcomH264HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static final qcomVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static final qcomVp9HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

.field private static runningInstance:Lcom/momo/rtcbase/MediaCodecVideoEncoder;

.field private static staticEglBase:Lcom/momo/rtcbase/EglBase;

.field private static final supportedColorList:[I

.field private static final supportedSurfaceColorList:[I

.field private static final vp9HwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;


# instance fields
.field private bitrateAccumulator:D

.field private bitrateAccumulatorMax:D

.field private bitrateAdjustmentScaleExp:I

.field private bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

.field private bitrateObservationTimeMs:D

.field private colorFormat:I

.field private configData:Ljava/nio/ByteBuffer;

.field private drawer:Lcom/momo/rtcbase/GlRectDrawer;

.field private eglBase:Lcom/momo/rtcbase/EglBase14;

.field private forcedKeyFrameMs:J

.field private height:I

.field private inputSurface:Landroid/view/Surface;

.field private lastKeyFrameMs:J

.field private mediaCodec:Landroid/media/MediaCodec;

.field private mediaCodecThread:Ljava/lang/Thread;

.field private outputBuffers:[Ljava/nio/ByteBuffer;

.field private profile:I

.field private targetBitrateBps:I

.field private targetFps:I

.field private type:Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

    .line 7
    .line 8
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 9
    .line 10
    sget-object v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->NO_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 11
    .line 12
    const-string v2, "OMX.qcom."

    .line 13
    .line 14
    const/16 v3, 0x13

    .line 15
    .line 16
    invoke-direct {v0, v2, v3, v1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->qcomVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 20
    .line 21
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 22
    .line 23
    sget-object v4, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->DYNAMIC_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 24
    .line 25
    const-string v5, "OMX.Exynos."

    .line 26
    .line 27
    const/16 v6, 0x17

    .line 28
    .line 29
    invoke-direct {v0, v5, v6, v4}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->exynosVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 33
    .line 34
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 35
    .line 36
    const-string v4, "OMX.Intel."

    .line 37
    .line 38
    const/16 v7, 0x15

    .line 39
    .line 40
    invoke-direct {v0, v4, v7, v1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 41
    .line 42
    .line 43
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->intelVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 44
    .line 45
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 46
    .line 47
    const/16 v4, 0x18

    .line 48
    .line 49
    invoke-direct {v0, v2, v4, v1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 50
    .line 51
    .line 52
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->qcomVp9HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 53
    .line 54
    new-instance v8, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 55
    .line 56
    sget-object v9, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->FRAMERATE_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 57
    .line 58
    invoke-direct {v8, v5, v4, v9}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 59
    .line 60
    .line 61
    sput-object v8, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->exynosVp9HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 62
    .line 63
    filled-new-array {v0, v8}, [Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->vp9HwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 68
    .line 69
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 70
    .line 71
    invoke-direct {v0, v2, v3, v1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 72
    .line 73
    .line 74
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->qcomH264HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 75
    .line 76
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 77
    .line 78
    invoke-direct {v0, v5, v7, v9}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 79
    .line 80
    .line 81
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->exynosH264HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 82
    .line 83
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 84
    .line 85
    const-string v1, "OMX.MTK."

    .line 86
    .line 87
    const/16 v2, 0x1b

    .line 88
    .line 89
    invoke-direct {v0, v1, v2, v9}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 90
    .line 91
    .line 92
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediatekH264HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 93
    .line 94
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 95
    .line 96
    invoke-direct {v0, v5, v6, v9}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 97
    .line 98
    .line 99
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->exynosH264HighProfileHwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 100
    .line 101
    filled-new-array {v0}, [Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->h264HighProfileHwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 106
    .line 107
    const-string v0, "Nexus 7"

    .line 108
    .line 109
    const-string v1, "Nexus 4"

    .line 110
    .line 111
    const-string v2, "SAMSUNG-SGH-I337"

    .line 112
    .line 113
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->H264_HW_EXCEPTION_MODELS:[Ljava/lang/String;

    .line 118
    .line 119
    const v0, 0x7fa30c00

    .line 120
    .line 121
    .line 122
    const v1, 0x7fa30c04

    .line 123
    .line 124
    .line 125
    filled-new-array {v3, v7, v0, v1}, [I

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 130
    .line 131
    const v0, 0x7f000789

    .line 132
    .line 133
    .line 134
    filled-new-array {v0}, [I

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedSurfaceColorList:[I

    .line 139
    .line 140
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
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->NO_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic access$000()Lcom/momo/rtcbase/EglBase;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->staticEglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/VideoCodecInfo;Z)J
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->nativeCreateEncoder(Lcom/momo/rtcbase/VideoCodecInfo;Z)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/MediaCodecVideoEncoder;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p0
.end method

.method private checkOnMediaCodecThread()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodecThread:Ljava/lang/Thread;

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
    new-instance v0, Ljava/lang/RuntimeException;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "MediaCodecVideoEncoder previously operated on "

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v2, " but is now called on "

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw v0
.end method

.method public static createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public static createFactory()Lcom/momo/rtcbase/VideoEncoderFactory;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/momo/rtcbase/DefaultVideoEncoderFactory;-><init>(Lcom/momo/rtcbase/VideoEncoderFactory;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static disableH264HwCodec()V
    .locals 2

    .line 1
    const-string v0, "MediaCodecVideoEncoder"

    .line 2
    .line 3
    const-string v1, "H.264 encoding is disabled by application."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    const-string v0, "MediaCodecVideoEncoder"

    .line 2
    .line 3
    const-string v1, "VP8 encoding is disabled by application."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    const-string v0, "MediaCodecVideoEncoder"

    .line 2
    .line 3
    const-string v1, "VP9 encoding is disabled by application."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->staticEglBase:Lcom/momo/rtcbase/EglBase;

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
    sput-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->staticEglBase:Lcom/momo/rtcbase/EglBase;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private static findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    const-string v0, "video/avc"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v4, 0x0

    .line 14
    const-string v5, "MediaCodecVideoEncoder"

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->H264_HW_EXCEPTION_MODELS:[Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {v0, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v1, "Model: "

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " has black listed H.264 encoder."

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v5, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-object v4

    .line 55
    :cond_0
    const/4 v6, 0x0

    .line 56
    move v7, v6

    .line 57
    :goto_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-ge v7, v0, :cond_e

    .line 62
    .line 63
    :try_start_0
    invoke-static {v7}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 64
    .line 65
    .line 66
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    goto :goto_1

    .line 68
    :catch_0
    move-exception v0

    .line 69
    const-string v8, "Cannot retrieve encoder codec info"

    .line 70
    .line 71
    invoke-static {v5, v8, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    move-object v0, v4

    .line 75
    :goto_1
    if-eqz v0, :cond_1

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    if-nez v8, :cond_2

    .line 82
    .line 83
    :cond_1
    :goto_2
    move-object/from16 v16, v4

    .line 84
    .line 85
    goto/16 :goto_b

    .line 86
    .line 87
    :cond_2
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v8

    .line 91
    array-length v9, v8

    .line 92
    move v10, v6

    .line 93
    :goto_3
    if-ge v10, v9, :cond_4

    .line 94
    .line 95
    aget-object v11, v8, v10

    .line 96
    .line 97
    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v11

    .line 101
    if-eqz v11, :cond_3

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    goto :goto_4

    .line 108
    :cond_3
    add-int/lit8 v10, v10, 0x1

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_4
    move-object v8, v4

    .line 112
    :goto_4
    if-nez v8, :cond_5

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_5
    const-string v9, "Found candidate encoder "

    .line 116
    .line 117
    invoke-virtual {v9, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v9

    .line 121
    invoke-static {v5, v9}, Lcom/momo/rtcbase/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    sget-object v9, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->NO_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 125
    .line 126
    array-length v10, v2

    .line 127
    move v11, v6

    .line 128
    :goto_5
    if-ge v11, v10, :cond_9

    .line 129
    .line 130
    aget-object v12, v2, v11

    .line 131
    .line 132
    iget-object v13, v12, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;->codecPrefix:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v8, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v13

    .line 138
    if-eqz v13, :cond_8

    .line 139
    .line 140
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 141
    .line 142
    iget v14, v12, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;->minSdk:I

    .line 143
    .line 144
    const-string v15, "Codec "

    .line 145
    .line 146
    if-ge v13, v14, :cond_6

    .line 147
    .line 148
    new-instance v12, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v12, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v14, " is disabled due to SDK version "

    .line 157
    .line 158
    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v12

    .line 168
    invoke-static {v5, v12}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    goto :goto_6

    .line 172
    :cond_6
    iget-object v10, v12, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;->bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 173
    .line 174
    sget-object v11, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->NO_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 175
    .line 176
    if-eq v10, v11, :cond_7

    .line 177
    .line 178
    new-instance v9, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {v9, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v11, " requires bitrate adjustment: "

    .line 187
    .line 188
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v9

    .line 198
    invoke-static {v5, v9}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    move-object v9, v10

    .line 202
    :cond_7
    const/4 v10, 0x1

    .line 203
    goto :goto_7

    .line 204
    :cond_8
    :goto_6
    add-int/lit8 v11, v11, 0x1

    .line 205
    .line 206
    goto :goto_5

    .line 207
    :cond_9
    move v10, v6

    .line 208
    :goto_7
    if-nez v10, :cond_a

    .line 209
    .line 210
    goto :goto_2

    .line 211
    :cond_a
    :try_start_1
    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 212
    .line 213
    .line 214
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 215
    iget-object v10, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 216
    .line 217
    array-length v11, v10

    .line 218
    move v12, v6

    .line 219
    :goto_8
    if-ge v12, v11, :cond_b

    .line 220
    .line 221
    aget v13, v10, v12

    .line 222
    .line 223
    new-instance v14, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    const-string v15, "   Color: 0x"

    .line 226
    .line 227
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-static {v13}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v13

    .line 234
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v13

    .line 241
    invoke-static {v5, v13}, Lcom/momo/rtcbase/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    add-int/lit8 v12, v12, 0x1

    .line 245
    .line 246
    goto :goto_8

    .line 247
    :cond_b
    array-length v10, v3

    .line 248
    move v11, v6

    .line 249
    :goto_9
    if-ge v11, v10, :cond_1

    .line 250
    .line 251
    aget v12, v3, v11

    .line 252
    .line 253
    iget-object v13, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 254
    .line 255
    array-length v14, v13

    .line 256
    move v15, v6

    .line 257
    :goto_a
    if-ge v15, v14, :cond_d

    .line 258
    .line 259
    move-object/from16 v16, v4

    .line 260
    .line 261
    aget v4, v13, v15

    .line 262
    .line 263
    if-ne v4, v12, :cond_c

    .line 264
    .line 265
    new-instance v0, Ljava/lang/StringBuilder;

    .line 266
    .line 267
    const-string v2, "Found target encoder for mime "

    .line 268
    .line 269
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    const-string v1, " : "

    .line 276
    .line 277
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v1, ". Color: 0x"

    .line 284
    .line 285
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    const-string v1, ". Bitrate adjustment: "

    .line 296
    .line 297
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    invoke-static {v5, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 311
    .line 312
    invoke-direct {v0, v8, v4, v9}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;-><init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V

    .line 313
    .line 314
    .line 315
    return-object v0

    .line 316
    :cond_c
    add-int/lit8 v15, v15, 0x1

    .line 317
    .line 318
    move-object/from16 v4, v16

    .line 319
    .line 320
    goto :goto_a

    .line 321
    :cond_d
    move-object/from16 v16, v4

    .line 322
    .line 323
    add-int/lit8 v11, v11, 0x1

    .line 324
    .line 325
    goto :goto_9

    .line 326
    :catch_1
    move-exception v0

    .line 327
    move-object/from16 v16, v4

    .line 328
    .line 329
    const-string v4, "Cannot retrieve encoder capabilities"

    .line 330
    .line 331
    invoke-static {v5, v4, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 332
    .line 333
    .line 334
    :goto_b
    add-int/lit8 v7, v7, 0x1

    .line 335
    .line 336
    move-object/from16 v4, v16

    .line 337
    .line 338
    goto/16 :goto_0

    .line 339
    .line 340
    :cond_e
    move-object/from16 v16, v4

    .line 341
    .line 342
    return-object v16
.end method

.method private getBitrateScale(I)D
    .locals 2

    .line 1
    int-to-double p0, p1

    .line 2
    const-wide/high16 v0, 0x4034000000000000L    # 20.0

    .line 3
    .line 4
    div-double/2addr p0, v0

    .line 5
    const-wide/high16 v0, 0x4010000000000000L    # 4.0

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->pow(DD)D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public static getEglContext()Lcom/momo/rtcbase/EglBase$Context;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->staticEglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->getEglBaseContext()Lcom/momo/rtcbase/EglBase$Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method private static final h264HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->qcomH264HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->exynosH264HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    new-array v1, v1, [Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, [Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 27
    .line 28
    return-object v0
.end method

.method public static isH264HighProfileHwSupported()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->h264HighProfileHwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 14
    .line 15
    invoke-static {v1, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

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

.method public static isH264HwSupported()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->h264HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 16
    .line 17
    invoke-static {v1, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    return v0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method public static isH264HwSupportedUsingTextures()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->h264HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedSurfaceColorList:[I

    .line 16
    .line 17
    invoke-static {v1, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    return v0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method public static isTextureBuffer(Lcom/momo/rtcbase/VideoFrame$Buffer;)Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    instance-of p0, p0, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    return p0
.end method

.method public static isVp8HwSupported()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->vp8HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 16
    .line 17
    invoke-static {v1, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    return v0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method public static isVp8HwSupportedUsingTextures()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->vp8HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedSurfaceColorList:[I

    .line 16
    .line 17
    invoke-static {v1, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    return v0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method public static isVp9HwSupported()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->vp9HwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 14
    .line 15
    invoke-static {v1, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

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

.method public static isVp9HwSupportedUsingTextures()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->vp9HwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedSurfaceColorList:[I

    .line 14
    .line 15
    invoke-static {v1, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

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

.method private static native nativeCreateEncoder(Lcom/momo/rtcbase/VideoCodecInfo;Z)J
.end method

.method private static native nativeFillInputBuffer(JILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V
.end method

.method public static printStackTrace()V
    .locals 5

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->runningInstance:Lcom/momo/rtcbase/MediaCodecVideoEncoder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodecThread:Ljava/lang/Thread;

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
    const-string v1, "MediaCodecVideoEncoder stacks trace:"

    .line 17
    .line 18
    const-string v2, "MediaCodecVideoEncoder"

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

.method private reportEncodedFrame(I)V
    .locals 9

    .line 1
    iget v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetFps:I

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 6
    .line 7
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->DYNAMIC_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 8
    .line 9
    if-eq v1, v2, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    iget v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetBitrateBps:I

    .line 14
    .line 15
    int-to-double v1, v1

    .line 16
    const-wide/high16 v3, 0x4020000000000000L    # 8.0

    .line 17
    .line 18
    int-to-double v5, v0

    .line 19
    mul-double/2addr v5, v3

    .line 20
    div-double/2addr v1, v5

    .line 21
    iget-wide v3, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 22
    .line 23
    int-to-double v5, p1

    .line 24
    sub-double/2addr v5, v1

    .line 25
    add-double/2addr v3, v5

    .line 26
    iput-wide v3, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 27
    .line 28
    iget-wide v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateObservationTimeMs:D

    .line 29
    .line 30
    const-wide v5, 0x408f400000000000L    # 1000.0

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    int-to-double v7, v0

    .line 36
    div-double/2addr v5, v7

    .line 37
    add-double/2addr v1, v5

    .line 38
    iput-wide v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateObservationTimeMs:D

    .line 39
    .line 40
    const-wide/high16 v0, 0x4008000000000000L    # 3.0

    .line 41
    .line 42
    iget-wide v5, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulatorMax:D

    .line 43
    .line 44
    mul-double/2addr v5, v0

    .line 45
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(DD)D

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    iput-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 50
    .line 51
    neg-double v2, v5

    .line 52
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    iput-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 57
    .line 58
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateObservationTimeMs:D

    .line 59
    .line 60
    const-wide v2, 0x40a7700000000000L    # 3000.0

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    cmpl-double p1, v0, v2

    .line 66
    .line 67
    if-lez p1, :cond_3

    .line 68
    .line 69
    new-instance p1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v0, "Acc: "

    .line 72
    .line 73
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 77
    .line 78
    double-to-int v0, v0

    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v0, ". Max: "

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulatorMax:D

    .line 88
    .line 89
    double-to-int v0, v0

    .line 90
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v0, ". ExpScale: "

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    const-string v0, "MediaCodecVideoEncoder"

    .line 108
    .line 109
    invoke-static {v0, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-wide v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 113
    .line 114
    iget-wide v3, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulatorMax:D

    .line 115
    .line 116
    cmpl-double p1, v1, v3

    .line 117
    .line 118
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 119
    .line 120
    if-lez p1, :cond_1

    .line 121
    .line 122
    div-double/2addr v1, v3

    .line 123
    add-double/2addr v1, v5

    .line 124
    double-to-int p1, v1

    .line 125
    iget v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 126
    .line 127
    sub-int/2addr v1, p1

    .line 128
    iput v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 129
    .line 130
    iput-wide v3, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_1
    neg-double v7, v3

    .line 134
    cmpg-double p1, v1, v7

    .line 135
    .line 136
    if-gez p1, :cond_2

    .line 137
    .line 138
    neg-double v1, v1

    .line 139
    div-double/2addr v1, v3

    .line 140
    add-double/2addr v1, v5

    .line 141
    double-to-int p1, v1

    .line 142
    iget v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 143
    .line 144
    add-int/2addr v1, p1

    .line 145
    iput v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 146
    .line 147
    neg-double v1, v3

    .line 148
    iput-wide v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 149
    .line 150
    :goto_0
    iget p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 151
    .line 152
    const/16 v1, 0x14

    .line 153
    .line 154
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    iput p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 159
    .line 160
    const/16 v1, -0x14

    .line 161
    .line 162
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    iput p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 167
    .line 168
    new-instance p1, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    const-string v1, "Adjusting bitrate scale to "

    .line 171
    .line 172
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    iget v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 176
    .line 177
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    const-string v1, ". Value: "

    .line 181
    .line 182
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    iget v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 186
    .line 187
    invoke-direct {p0, v1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->getBitrateScale(I)D

    .line 188
    .line 189
    .line 190
    move-result-wide v1

    .line 191
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-static {v0, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    iget p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetBitrateBps:I

    .line 202
    .line 203
    div-int/lit16 p1, p1, 0x3e8

    .line 204
    .line 205
    iget v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetFps:I

    .line 206
    .line 207
    invoke-direct {p0, p1, v0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->setRates(II)Z

    .line 208
    .line 209
    .line 210
    :cond_2
    const-wide/16 v0, 0x0

    .line 211
    .line 212
    iput-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateObservationTimeMs:D

    .line 213
    .line 214
    :cond_3
    :goto_1
    return-void
.end method

.method public static setEglContext(Lcom/momo/rtcbase/EglBase$Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->staticEglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "MediaCodecVideoEncoder"

    .line 6
    .line 7
    const-string v1, "Egl context already set."

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->staticEglBase:Lcom/momo/rtcbase/EglBase;

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
    sput-object p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->staticEglBase:Lcom/momo/rtcbase/EglBase;

    .line 22
    .line 23
    return-void
.end method

.method public static setErrorCallback(Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecVideoEncoderErrorCallback;)V
    .locals 2

    .line 1
    const-string v0, "MediaCodecVideoEncoder"

    .line 2
    .line 3
    const-string v1, "Set error callback"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->errorCallback:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecVideoEncoderErrorCallback;

    .line 9
    .line 10
    return-void
.end method

.method private setRates(II)Z
    .locals 8
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkOnMediaCodecThread()V

    .line 2
    .line 3
    .line 4
    mul-int/lit16 v0, p1, 0x3e8

    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 7
    .line 8
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->DYNAMIC_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 9
    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    int-to-double v3, v0

    .line 13
    const-wide/high16 v5, 0x4020000000000000L    # 8.0

    .line 14
    .line 15
    div-double v5, v3, v5

    .line 16
    .line 17
    iput-wide v5, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulatorMax:D

    .line 18
    .line 19
    iget v5, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetBitrateBps:I

    .line 20
    .line 21
    if-lez v5, :cond_0

    .line 22
    .line 23
    if-ge v0, v5, :cond_0

    .line 24
    .line 25
    iget-wide v6, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 26
    .line 27
    mul-double/2addr v6, v3

    .line 28
    int-to-double v3, v5

    .line 29
    div-double/2addr v6, v3

    .line 30
    iput-wide v6, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 31
    .line 32
    :cond_0
    iput v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetBitrateBps:I

    .line 33
    .line 34
    iput p2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetFps:I

    .line 35
    .line 36
    sget-object v3, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->FRAMERATE_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 37
    .line 38
    const-string v4, " kbps. Fps: "

    .line 39
    .line 40
    const-string v5, "setRates: "

    .line 41
    .line 42
    const-string v6, "MediaCodecVideoEncoder"

    .line 43
    .line 44
    if-ne v1, v3, :cond_1

    .line 45
    .line 46
    if-lez p2, :cond_1

    .line 47
    .line 48
    mul-int/lit16 v0, p1, 0x7530

    .line 49
    .line 50
    div-int/2addr v0, p2

    .line 51
    new-instance p2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p1, " -> "

    .line 60
    .line 61
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    div-int/lit16 p1, v0, 0x3e8

    .line 65
    .line 66
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetFps:I

    .line 73
    .line 74
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {v6, p1}, Lcom/momo/rtcbase/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    if-ne v1, v2, :cond_2

    .line 86
    .line 87
    new-instance p2, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetFps:I

    .line 99
    .line 100
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string p1, ". ExpScale: "

    .line 104
    .line 105
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 109
    .line 110
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-static {v6, p1}, Lcom/momo/rtcbase/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 121
    .line 122
    if-eqz p1, :cond_3

    .line 123
    .line 124
    int-to-double v0, v0

    .line 125
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->getBitrateScale(I)D

    .line 126
    .line 127
    .line 128
    move-result-wide p1

    .line 129
    mul-double/2addr v0, p1

    .line 130
    double-to-int v0, v0

    .line 131
    goto :goto_0

    .line 132
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {p2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetFps:I

    .line 144
    .line 145
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-static {v6, p1}, Lcom/momo/rtcbase/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_3
    :goto_0
    :try_start_0
    new-instance p1, Landroid/os/Bundle;

    .line 156
    .line 157
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string p2, "video-bitrate"

    .line 161
    .line 162
    invoke-virtual {p1, p2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 163
    .line 164
    .line 165
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 166
    .line 167
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    .line 169
    .line 170
    const/4 p0, 0x1

    .line 171
    return p0

    .line 172
    :catch_0
    move-exception p0

    .line 173
    const-string p1, "setRates failed"

    .line 174
    .line 175
    invoke-static {v6, p1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 176
    .line 177
    .line 178
    const/4 p0, 0x0

    .line 179
    return p0
.end method

.method public static vp8HwEncoderProperties()Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;
    .locals 3

    .line 1
    sget-object v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->hwEncoderDisabledTypes:Ljava/util/Set;

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
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    return-object v0

    .line 13
    :cond_0
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->vp8HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method private static vp8HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->qcomVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->exynosVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    new-array v1, v1, [Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, [Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public checkKeyFrameRequired(ZJ)V
    .locals 6

    .line 1
    const-wide/16 v0, 0x1f4

    .line 2
    .line 3
    add-long/2addr p2, v0

    .line 4
    const-wide/16 v0, 0x3e8

    .line 5
    .line 6
    div-long/2addr p2, v0

    .line 7
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->lastKeyFrameMs:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    iput-wide p2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->lastKeyFrameMs:J

    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    iget-wide v4, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->forcedKeyFrameMs:J

    .line 21
    .line 22
    cmp-long v1, v4, v2

    .line 23
    .line 24
    if-lez v1, :cond_1

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->lastKeyFrameMs:J

    .line 27
    .line 28
    add-long/2addr v1, v4

    .line 29
    cmp-long v1, p2, v1

    .line 30
    .line 31
    if-lez v1, :cond_1

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v1, v0

    .line 36
    :goto_0
    if-nez p1, :cond_3

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    return-void

    .line 42
    :cond_3
    :goto_1
    const-string v1, "MediaCodecVideoEncoder"

    .line 43
    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    const-string p1, "Sync frame request"

    .line 47
    .line 48
    invoke-static {v1, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_4
    const-string p1, "Sync frame forced"

    .line 53
    .line 54
    invoke-static {v1, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :goto_2
    new-instance p1, Landroid/os/Bundle;

    .line 58
    .line 59
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v1, "request-sync"

    .line 63
    .line 64
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    .line 70
    .line 71
    .line 72
    iput-wide p2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->lastKeyFrameMs:J

    .line 73
    .line 74
    return-void
.end method

.method public dequeueInputBuffer()I
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkOnMediaCodecThread()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 9
    .line 10
    .line 11
    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    return p0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    const-string v0, "MediaCodecVideoEncoder"

    .line 15
    .line 16
    const-string v1, "dequeueIntputBuffer failed"

    .line 17
    .line 18
    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, -0x2

    .line 22
    return p0
.end method

.method public dequeueOutputBuffer()Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;
    .locals 10
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    const-string v1, "MediaCodecVideoEncoder"

    .line 2
    .line 3
    const-string v0, "Config frame generated. Offset: "

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkOnMediaCodecThread()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance v2, Landroid/media/MediaCodec$BufferInfo;

    .line 9
    .line 10
    invoke-direct {v2}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v3, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 14
    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    invoke-virtual {v3, v2, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/4 v6, 0x0

    .line 22
    if-ltz v3, :cond_2

    .line 23
    .line 24
    iget v7, v2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 25
    .line 26
    and-int/lit8 v7, v7, 0x2

    .line 27
    .line 28
    if-eqz v7, :cond_2

    .line 29
    .line 30
    new-instance v7, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget v0, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 36
    .line 37
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ". Size: "

    .line 41
    .line 42
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget v0, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 46
    .line 47
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget v0, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 58
    .line 59
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->configData:Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    aget-object v0, v0, v3

    .line 68
    .line 69
    iget v7, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 70
    .line 71
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    aget-object v0, v0, v3

    .line 77
    .line 78
    iget v7, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 79
    .line 80
    iget v8, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 81
    .line 82
    add-int/2addr v7, v8

    .line 83
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->configData:Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    iget-object v7, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    aget-object v7, v7, v3

    .line 91
    .line 92
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    const-string v0, ""

    .line 96
    .line 97
    move v7, v6

    .line 98
    :goto_0
    iget v8, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 99
    .line 100
    const/16 v9, 0x8

    .line 101
    .line 102
    if-ge v8, v9, :cond_0

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_0
    move v8, v9

    .line 106
    :goto_1
    if-ge v7, v8, :cond_1

    .line 107
    .line 108
    new-instance v8, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->configData:Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->get(I)B

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    and-int/lit16 v0, v0, 0xff

    .line 123
    .line 124
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v0, " "

    .line 132
    .line 133
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    add-int/lit8 v7, v7, 0x1

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :catch_0
    move-exception v0

    .line 144
    move-object p0, v0

    .line 145
    goto/16 :goto_3

    .line 146
    .line 147
    :cond_1
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 151
    .line 152
    invoke-virtual {v0, v3, v6}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 156
    .line 157
    invoke-virtual {v0, v2, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    :cond_2
    if-ltz v3, :cond_6

    .line 162
    .line 163
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    aget-object v0, v0, v3

    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iget v4, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 172
    .line 173
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 174
    .line 175
    .line 176
    iget v4, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 177
    .line 178
    iget v5, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 179
    .line 180
    add-int/2addr v4, v5

    .line 181
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 182
    .line 183
    .line 184
    iget v4, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 185
    .line 186
    invoke-direct {p0, v4}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->reportEncodedFrame(I)V

    .line 187
    .line 188
    .line 189
    iget v4, v2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 190
    .line 191
    const/4 v5, 0x1

    .line 192
    and-int/2addr v4, v5

    .line 193
    if-eqz v4, :cond_3

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_3
    move v5, v6

    .line 197
    :goto_2
    if-eqz v5, :cond_4

    .line 198
    .line 199
    const-string v4, "Sync frame generated"

    .line 200
    .line 201
    invoke-static {v1, v4}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    :cond_4
    if-eqz v5, :cond_5

    .line 205
    .line 206
    iget-object v4, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->type:Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;

    .line 207
    .line 208
    sget-object v7, Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;->VIDEO_CODEC_H264:Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;

    .line 209
    .line 210
    if-ne v4, v7, :cond_5

    .line 211
    .line 212
    new-instance v4, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .line 216
    .line 217
    const-string v7, "Appending config frame of size "

    .line 218
    .line 219
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget-object v7, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->configData:Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    invoke-virtual {v7}, Ljava/nio/Buffer;->capacity()I

    .line 225
    .line 226
    .line 227
    move-result v7

    .line 228
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v7, " to output buffer with offset "

    .line 232
    .line 233
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    iget v7, v2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 237
    .line 238
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v7, ", size "

    .line 242
    .line 243
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    iget v7, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 247
    .line 248
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v4

    .line 255
    invoke-static {v1, v4}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    iget-object v4, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->configData:Ljava/nio/ByteBuffer;

    .line 259
    .line 260
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    iget v7, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 265
    .line 266
    add-int/2addr v4, v7

    .line 267
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 268
    .line 269
    .line 270
    move-result-object v4

    .line 271
    iget-object v7, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->configData:Ljava/nio/ByteBuffer;

    .line 272
    .line 273
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 274
    .line 275
    .line 276
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->configData:Ljava/nio/ByteBuffer;

    .line 277
    .line 278
    invoke-virtual {v4, p0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 285
    .line 286
    .line 287
    move-object p0, v2

    .line 288
    new-instance v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;

    .line 289
    .line 290
    iget-wide v6, p0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 291
    .line 292
    invoke-direct/range {v2 .. v7}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;-><init>(ILjava/nio/ByteBuffer;ZJ)V

    .line 293
    .line 294
    .line 295
    return-object v2

    .line 296
    :cond_5
    move-object p0, v2

    .line 297
    new-instance v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;

    .line 298
    .line 299
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    iget-wide v6, p0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 304
    .line 305
    invoke-direct/range {v2 .. v7}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;-><init>(ILjava/nio/ByteBuffer;ZJ)V

    .line 306
    .line 307
    .line 308
    return-object v2

    .line 309
    :cond_6
    const/4 v0, -0x3

    .line 310
    if-ne v3, v0, :cond_7

    .line 311
    .line 312
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 313
    .line 314
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 319
    .line 320
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->dequeueOutputBuffer()Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    return-object p0

    .line 325
    :cond_7
    const/4 v0, -0x2

    .line 326
    if-ne v3, v0, :cond_8

    .line 327
    .line 328
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->dequeueOutputBuffer()Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    return-object p0

    .line 333
    :cond_8
    const/4 p0, -0x1

    .line 334
    if-ne v3, p0, :cond_9

    .line 335
    .line 336
    const/4 p0, 0x0

    .line 337
    return-object p0

    .line 338
    :cond_9
    new-instance p0, Ljava/lang/RuntimeException;

    .line 339
    .line 340
    new-instance v0, Ljava/lang/StringBuilder;

    .line 341
    .line 342
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 343
    .line 344
    .line 345
    const-string v2, "dequeueOutputBuffer: "

    .line 346
    .line 347
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    throw p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 361
    :goto_3
    const-string v0, "dequeueOutputBuffer failed"

    .line 362
    .line 363
    invoke-static {v1, v0, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 364
    .line 365
    .line 366
    new-instance v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;

    .line 367
    .line 368
    const/4 v5, 0x0

    .line 369
    const-wide/16 v6, -0x1

    .line 370
    .line 371
    const/4 v3, -0x1

    .line 372
    const/4 v4, 0x0

    .line 373
    invoke-direct/range {v2 .. v7}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$OutputBufferInfo;-><init>(ILjava/nio/ByteBuffer;ZJ)V

    .line 374
    .line 375
    .line 376
    return-object v2
.end method

.method public encodeBuffer(ZIIJ)Z
    .locals 7
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkOnMediaCodecThread()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0, p1, p4, p5}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkKeyFrameRequired(ZJ)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v6, 0x0

    .line 11
    move v1, p2

    .line 12
    move v3, p3

    .line 13
    move-wide v4, p4

    .line 14
    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    move-object p0, v0

    .line 21
    const-string p1, "MediaCodecVideoEncoder"

    .line 22
    .line 23
    const-string p2, "encodeBuffer failed"

    .line 24
    .line 25
    invoke-static {p1, p2, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public encodeFrame(JZLcom/momo/rtcbase/VideoFrame;IJ)Z
    .locals 17
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v4, p6

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkOnMediaCodecThread()V

    .line 6
    .line 7
    .line 8
    move/from16 v1, p3

    .line 9
    .line 10
    :try_start_0
    invoke-virtual {v0, v1, v4, v5}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkKeyFrameRequired(ZJ)V

    .line 11
    .line 12
    .line 13
    invoke-virtual/range {p4 .. p4}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    instance-of v2, v1, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;

    .line 18
    .line 19
    const/4 v7, 0x1

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    move-object v9, v1

    .line 23
    check-cast v9, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->eglBase:Lcom/momo/rtcbase/EglBase14;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/momo/rtcbase/EglBase14;->makeCurrent()V

    .line 28
    .line 29
    .line 30
    const/16 v1, 0x4000

    .line 31
    .line 32
    invoke-static {v1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 33
    .line 34
    .line 35
    iget-object v8, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->drawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 36
    .line 37
    new-instance v10, Landroid/graphics/Matrix;

    .line 38
    .line 39
    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 40
    .line 41
    .line 42
    iget v11, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->width:I

    .line 43
    .line 44
    iget v12, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->height:I

    .line 45
    .line 46
    const/4 v13, 0x0

    .line 47
    const/4 v14, 0x0

    .line 48
    move v15, v11

    .line 49
    move/from16 v16, v12

    .line 50
    .line 51
    invoke-static/range {v8 .. v16}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawTexture(Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/VideoFrame$TextureBuffer;Landroid/graphics/Matrix;IIIIII)V

    .line 52
    .line 53
    .line 54
    iget-object v0, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->eglBase:Lcom/momo/rtcbase/EglBase14;

    .line 55
    .line 56
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 57
    .line 58
    invoke-virtual {v1, v4, v5}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 59
    .line 60
    .line 61
    move-result-wide v1

    .line 62
    invoke-virtual {v0, v1, v2}, Lcom/momo/rtcbase/EglBase14;->swapBuffers(J)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$Buffer;->toI420()Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget v2, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->height:I

    .line 71
    .line 72
    add-int/2addr v2, v7

    .line 73
    div-int/lit8 v2, v2, 0x2

    .line 74
    .line 75
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v11

    .line 79
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    .line 82
    move-result-object v13

    .line 83
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    .line 86
    move-result-object v15

    .line 87
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideY()I

    .line 88
    .line 89
    .line 90
    move-result v12

    .line 91
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideU()I

    .line 92
    .line 93
    .line 94
    move-result v14

    .line 95
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$I420Buffer;->getStrideV()I

    .line 96
    .line 97
    .line 98
    move-result v16

    .line 99
    invoke-virtual {v11}, Ljava/nio/Buffer;->capacity()I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    iget v6, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->height:I

    .line 104
    .line 105
    mul-int/2addr v6, v12

    .line 106
    if-lt v3, v6, :cond_3

    .line 107
    .line 108
    invoke-virtual {v13}, Ljava/nio/Buffer;->capacity()I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    mul-int v6, v14, v2

    .line 113
    .line 114
    if-lt v3, v6, :cond_2

    .line 115
    .line 116
    invoke-virtual {v15}, Ljava/nio/Buffer;->capacity()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    mul-int v2, v2, v16

    .line 121
    .line 122
    if-lt v3, v2, :cond_1

    .line 123
    .line 124
    move-wide/from16 v8, p1

    .line 125
    .line 126
    move/from16 v10, p5

    .line 127
    .line 128
    invoke-static/range {v8 .. v16}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->nativeFillInputBuffer(JILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V

    .line 129
    .line 130
    .line 131
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$Buffer;->release()V

    .line 132
    .line 133
    .line 134
    iget v1, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->width:I

    .line 135
    .line 136
    iget v2, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->height:I

    .line 137
    .line 138
    mul-int/2addr v1, v2

    .line 139
    mul-int/lit8 v1, v1, 0x3

    .line 140
    .line 141
    div-int/lit8 v3, v1, 0x2

    .line 142
    .line 143
    iget-object v0, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 144
    .line 145
    const/4 v2, 0x0

    .line 146
    const/4 v6, 0x0

    .line 147
    move/from16 v1, p5

    .line 148
    .line 149
    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 150
    .line 151
    .line 152
    :goto_0
    return v7

    .line 153
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 154
    .line 155
    const-string v1, "V-plane buffer size too small."

    .line 156
    .line 157
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    throw v0

    .line 161
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    .line 162
    .line 163
    const-string v1, "U-plane buffer size too small."

    .line 164
    .line 165
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    throw v0

    .line 169
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    .line 170
    .line 171
    const-string v1, "Y-plane buffer size too small."

    .line 172
    .line 173
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    throw v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :catch_0
    move-exception v0

    .line 178
    const-string v1, "MediaCodecVideoEncoder"

    .line 179
    .line 180
    const-string v2, "encodeFrame failed"

    .line 181
    .line 182
    invoke-static {v1, v2, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 183
    .line 184
    .line 185
    const/4 v0, 0x0

    .line 186
    return v0
.end method

.method public getColorFormat()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->colorFormat:I

    .line 2
    .line 3
    return p0
.end method

.method public getInputBuffers()[Ljava/nio/ByteBuffer;
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "Input buffers: "

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    array-length v1, p0

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "MediaCodecVideoEncoder"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public initEncode(Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;IIIIIZ)Z
    .locals 19
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    move/from16 v5, p5

    .line 12
    .line 13
    move/from16 v6, p6

    .line 14
    .line 15
    move/from16 v7, p7

    .line 16
    .line 17
    const-string v8, "Output buffers: "

    .line 18
    .line 19
    const-string v9, "  Format: "

    .line 20
    .line 21
    new-instance v10, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v11, "Java initEncode: "

    .line 24
    .line 25
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v11, ". Profile: "

    .line 32
    .line 33
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v11, " : "

    .line 40
    .line 41
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v11, " x "

    .line 48
    .line 49
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v11, ". @ "

    .line 56
    .line 57
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v11, " kbps. Fps: "

    .line 64
    .line 65
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v11, ". Encode from texture : "

    .line 72
    .line 73
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v10

    .line 83
    const-string v11, "MediaCodecVideoEncoder"

    .line 84
    .line 85
    invoke-static {v11, v10}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iput v2, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->profile:I

    .line 89
    .line 90
    iput v3, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->width:I

    .line 91
    .line 92
    iput v4, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->height:I

    .line 93
    .line 94
    iget-object v10, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 95
    .line 96
    if-nez v10, :cond_f

    .line 97
    .line 98
    sget-object v10, Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;->VIDEO_CODEC_VP8:Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;

    .line 99
    .line 100
    if-ne v0, v10, :cond_1

    .line 101
    .line 102
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->vp8HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    if-eqz v7, :cond_0

    .line 107
    .line 108
    sget-object v15, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedSurfaceColorList:[I

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_0
    sget-object v15, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 112
    .line 113
    :goto_0
    const-string v13, "video/x-vnd.on2.vp8"

    .line 114
    .line 115
    invoke-static {v13, v2, v15}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    move-object v14, v13

    .line 120
    :goto_1
    const/4 v13, 0x0

    .line 121
    const/16 v15, 0x64

    .line 122
    .line 123
    goto :goto_6

    .line 124
    :cond_1
    sget-object v13, Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;->VIDEO_CODEC_VP9:Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;

    .line 125
    .line 126
    if-ne v0, v13, :cond_3

    .line 127
    .line 128
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->vp9HwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 129
    .line 130
    if-eqz v7, :cond_2

    .line 131
    .line 132
    sget-object v13, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedSurfaceColorList:[I

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_2
    sget-object v13, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 136
    .line 137
    :goto_2
    const-string v15, "video/x-vnd.on2.vp9"

    .line 138
    .line 139
    invoke-static {v15, v2, v13}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    move-object v14, v15

    .line 144
    goto :goto_1

    .line 145
    :cond_3
    sget-object v13, Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;->VIDEO_CODEC_H264:Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;

    .line 146
    .line 147
    if-ne v0, v13, :cond_e

    .line 148
    .line 149
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->h264HwList()[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 150
    .line 151
    .line 152
    move-result-object v13

    .line 153
    if-eqz v7, :cond_4

    .line 154
    .line 155
    sget-object v15, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedSurfaceColorList:[I

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_4
    sget-object v15, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 159
    .line 160
    :goto_3
    const-string v14, "video/avc"

    .line 161
    .line 162
    invoke-static {v14, v13, v15}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 163
    .line 164
    .line 165
    move-result-object v13

    .line 166
    sget-object v15, Lcom/momo/rtcbase/MediaCodecVideoEncoder$H264Profile;->CONSTRAINED_HIGH:Lcom/momo/rtcbase/MediaCodecVideoEncoder$H264Profile;

    .line 167
    .line 168
    invoke-virtual {v15}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$H264Profile;->getValue()I

    .line 169
    .line 170
    .line 171
    move-result v15

    .line 172
    if-ne v2, v15, :cond_7

    .line 173
    .line 174
    sget-object v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->h264HighProfileHwList:[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 175
    .line 176
    if-eqz v7, :cond_5

    .line 177
    .line 178
    sget-object v15, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedSurfaceColorList:[I

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_5
    sget-object v15, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->supportedColorList:[I

    .line 182
    .line 183
    :goto_4
    invoke-static {v14, v2, v15}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->findHwEncoder(Ljava/lang/String;[Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;[I)Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    if-eqz v2, :cond_6

    .line 188
    .line 189
    const-string v2, "High profile H.264 encoder supported."

    .line 190
    .line 191
    invoke-static {v11, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    const/4 v2, 0x1

    .line 195
    goto :goto_5

    .line 196
    :cond_6
    const-string v2, "High profile H.264 encoder requested, but not supported. Use baseline."

    .line 197
    .line 198
    invoke-static {v11, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_7
    const/4 v2, 0x0

    .line 202
    :goto_5
    const/16 v15, 0x14

    .line 203
    .line 204
    move-object/from16 v18, v13

    .line 205
    .line 206
    move v13, v2

    .line 207
    move-object/from16 v2, v18

    .line 208
    .line 209
    :goto_6
    if-eqz v2, :cond_d

    .line 210
    .line 211
    sput-object v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->runningInstance:Lcom/momo/rtcbase/MediaCodecVideoEncoder;

    .line 212
    .line 213
    iget v12, v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;->colorFormat:I

    .line 214
    .line 215
    iput v12, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->colorFormat:I

    .line 216
    .line 217
    iget-object v12, v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;->bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 218
    .line 219
    iput-object v12, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 220
    .line 221
    sget-object v7, Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;->FRAMERATE_ADJUSTMENT:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 222
    .line 223
    move/from16 p2, v13

    .line 224
    .line 225
    const/16 v13, 0x1e

    .line 226
    .line 227
    if-ne v12, v7, :cond_8

    .line 228
    .line 229
    goto :goto_7

    .line 230
    :cond_8
    invoke-static {v6, v13}, Ljava/lang/Math;->min(II)I

    .line 231
    .line 232
    .line 233
    move-result v13

    .line 234
    :goto_7
    const-wide/16 v6, 0x0

    .line 235
    .line 236
    iput-wide v6, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->forcedKeyFrameMs:J

    .line 237
    .line 238
    const-wide/16 v6, -0x1

    .line 239
    .line 240
    iput-wide v6, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->lastKeyFrameMs:J

    .line 241
    .line 242
    if-ne v0, v10, :cond_9

    .line 243
    .line 244
    iget-object v6, v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;->codecName:Ljava/lang/String;

    .line 245
    .line 246
    sget-object v7, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->qcomVp8HwProperties:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;

    .line 247
    .line 248
    iget-object v7, v7, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;->codecPrefix:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 251
    .line 252
    .line 253
    move-result v6

    .line 254
    if-eqz v6, :cond_9

    .line 255
    .line 256
    const-wide/16 v6, 0x3a98

    .line 257
    .line 258
    iput-wide v6, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->forcedKeyFrameMs:J

    .line 259
    .line 260
    :cond_9
    new-instance v6, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    const-string v7, "Color format: "

    .line 263
    .line 264
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    iget v7, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->colorFormat:I

    .line 268
    .line 269
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string v7, ". Bitrate adjustment: "

    .line 273
    .line 274
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    iget-object v7, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 278
    .line 279
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    const-string v7, ". Key frame interval: "

    .line 283
    .line 284
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    move-object v10, v8

    .line 288
    iget-wide v7, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->forcedKeyFrameMs:J

    .line 289
    .line 290
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    const-string v7, " . Initial fps: "

    .line 294
    .line 295
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v6

    .line 305
    invoke-static {v11, v6}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    mul-int/lit16 v5, v5, 0x3e8

    .line 309
    .line 310
    iput v5, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetBitrateBps:I

    .line 311
    .line 312
    iput v13, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetFps:I

    .line 313
    .line 314
    int-to-double v5, v5

    .line 315
    const-wide/high16 v7, 0x4020000000000000L    # 8.0

    .line 316
    .line 317
    div-double/2addr v5, v7

    .line 318
    iput-wide v5, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulatorMax:D

    .line 319
    .line 320
    const-wide/16 v5, 0x0

    .line 321
    .line 322
    iput-wide v5, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAccumulator:D

    .line 323
    .line 324
    iput-wide v5, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateObservationTimeMs:D

    .line 325
    .line 326
    const/4 v5, 0x0

    .line 327
    iput v5, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->bitrateAdjustmentScaleExp:I

    .line 328
    .line 329
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    iput-object v5, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 334
    .line 335
    :try_start_0
    invoke-static {v14, v3, v4}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    const-string v4, "bitrate"

    .line 340
    .line 341
    iget v5, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetBitrateBps:I

    .line 342
    .line 343
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 344
    .line 345
    .line 346
    const-string v4, "bitrate-mode"

    .line 347
    .line 348
    const/4 v5, 0x2

    .line 349
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 350
    .line 351
    .line 352
    const-string v4, "color-format"

    .line 353
    .line 354
    iget v5, v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;->colorFormat:I

    .line 355
    .line 356
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 357
    .line 358
    .line 359
    const-string v4, "frame-rate"

    .line 360
    .line 361
    iget v5, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->targetFps:I

    .line 362
    .line 363
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 364
    .line 365
    .line 366
    const-string v4, "i-frame-interval"

    .line 367
    .line 368
    invoke-virtual {v3, v4, v15}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 369
    .line 370
    .line 371
    if-eqz p2, :cond_a

    .line 372
    .line 373
    const-string v4, "profile"

    .line 374
    .line 375
    const/16 v5, 0x8

    .line 376
    .line 377
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 378
    .line 379
    .line 380
    const-string v4, "level"

    .line 381
    .line 382
    const/16 v5, 0x100

    .line 383
    .line 384
    invoke-virtual {v3, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 385
    .line 386
    .line 387
    goto :goto_8

    .line 388
    :catch_0
    move-exception v0

    .line 389
    goto :goto_9

    .line 390
    :cond_a
    :goto_8
    new-instance v4, Ljava/lang/StringBuilder;

    .line 391
    .line 392
    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v4

    .line 402
    invoke-static {v11, v4}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    iget-object v2, v2, Lcom/momo/rtcbase/MediaCodecVideoEncoder$EncoderProperties;->codecName:Ljava/lang/String;

    .line 406
    .line 407
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 408
    .line 409
    .line 410
    move-result-object v2

    .line 411
    iput-object v2, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 412
    .line 413
    iput-object v0, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->type:Lcom/momo/rtcbase/MediaCodecVideoEncoder$VideoCodecType;

    .line 414
    .line 415
    if-nez v2, :cond_b

    .line 416
    .line 417
    const-string v0, "Can not create media encoder"

    .line 418
    .line 419
    invoke-static {v11, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {v1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->release()V

    .line 423
    .line 424
    .line 425
    const/16 v17, 0x0

    .line 426
    .line 427
    return v17

    .line 428
    :cond_b
    const/4 v0, 0x0

    .line 429
    const/4 v4, 0x1

    .line 430
    invoke-virtual {v2, v3, v0, v0, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 431
    .line 432
    .line 433
    if-eqz p7, :cond_c

    .line 434
    .line 435
    new-instance v0, Lcom/momo/rtcbase/EglBase14;

    .line 436
    .line 437
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->getEglContext()Lcom/momo/rtcbase/EglBase$Context;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    check-cast v2, Lcom/momo/rtcbase/EglBase14$Context;

    .line 442
    .line 443
    sget-object v3, Lcom/momo/rtcbase/EglBase;->CONFIG_RECORDABLE:[I

    .line 444
    .line 445
    invoke-direct {v0, v2, v3}, Lcom/momo/rtcbase/EglBase14;-><init>(Lcom/momo/rtcbase/EglBase14$Context;[I)V

    .line 446
    .line 447
    .line 448
    iput-object v0, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->eglBase:Lcom/momo/rtcbase/EglBase14;

    .line 449
    .line 450
    iget-object v0, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 451
    .line 452
    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    iput-object v0, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->inputSurface:Landroid/view/Surface;

    .line 457
    .line 458
    iget-object v2, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->eglBase:Lcom/momo/rtcbase/EglBase14;

    .line 459
    .line 460
    invoke-virtual {v2, v0}, Lcom/momo/rtcbase/EglBase14;->createSurface(Landroid/view/Surface;)V

    .line 461
    .line 462
    .line 463
    new-instance v0, Lcom/momo/rtcbase/GlRectDrawer;

    .line 464
    .line 465
    invoke-direct {v0}, Lcom/momo/rtcbase/GlRectDrawer;-><init>()V

    .line 466
    .line 467
    .line 468
    iput-object v0, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->drawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 469
    .line 470
    :cond_c
    iget-object v0, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 471
    .line 472
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 473
    .line 474
    .line 475
    iget-object v0, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 476
    .line 477
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 478
    .line 479
    .line 480
    move-result-object v0

    .line 481
    iput-object v0, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 482
    .line 483
    new-instance v0, Ljava/lang/StringBuilder;

    .line 484
    .line 485
    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 486
    .line 487
    .line 488
    iget-object v2, v1, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 489
    .line 490
    array-length v2, v2

    .line 491
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-static {v11, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 499
    .line 500
    .line 501
    const/16 v16, 0x1

    .line 502
    .line 503
    return v16

    .line 504
    :goto_9
    const-string v2, "initEncode failed"

    .line 505
    .line 506
    invoke-static {v11, v2, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 507
    .line 508
    .line 509
    invoke-virtual {v1}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->release()V

    .line 510
    .line 511
    .line 512
    const/16 v17, 0x0

    .line 513
    .line 514
    return v17

    .line 515
    :cond_d
    const/16 v17, 0x0

    .line 516
    .line 517
    const-string v1, "Can not find HW encoder for "

    .line 518
    .line 519
    invoke-static {v1, v0}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 520
    .line 521
    .line 522
    return v17

    .line 523
    :cond_e
    const/16 v17, 0x0

    .line 524
    .line 525
    const-string v1, "initEncode: Non-supported codec "

    .line 526
    .line 527
    invoke-static {v1, v0}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 528
    .line 529
    .line 530
    return v17

    .line 531
    :cond_f
    const/16 v17, 0x0

    .line 532
    .line 533
    const-string v0, "Forgot to release()?"

    .line 534
    .line 535
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 536
    .line 537
    .line 538
    return v17
.end method

.method public release()V
    .locals 8
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    const-string v0, "Java releaseEncoder"

    .line 2
    .line 3
    const-string v1, "MediaCodecVideoEncoder"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkOnMediaCodecThread()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$1CaughtException;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$1CaughtException;-><init>(Lcom/momo/rtcbase/MediaCodecVideoEncoder;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    const/4 v4, 0x0

    .line 20
    const/4 v5, 0x0

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 26
    .line 27
    .line 28
    new-instance v6, Lcom/momo/rtcbase/MediaCodecVideoEncoder$1;

    .line 29
    .line 30
    invoke-direct {v6, p0, v0, v2}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$1;-><init>(Lcom/momo/rtcbase/MediaCodecVideoEncoder;Lcom/momo/rtcbase/MediaCodecVideoEncoder$1CaughtException;Ljava/util/concurrent/CountDownLatch;)V

    .line 31
    .line 32
    .line 33
    new-instance v7, Ljava/lang/Thread;

    .line 34
    .line 35
    invoke-direct {v7, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    .line 39
    .line 40
    .line 41
    const-wide/16 v6, 0x1388

    .line 42
    .line 43
    invoke-static {v2, v6, v7}, Lcom/momo/rtcbase/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;J)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    const-string v2, "Media encoder release timeout"

    .line 50
    .line 51
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    move v5, v3

    .line 55
    :cond_0
    iput-object v4, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 56
    .line 57
    :cond_1
    iput-object v4, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodecThread:Ljava/lang/Thread;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->drawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 60
    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    invoke-virtual {v2}, Lcom/momo/rtcbase/GlRectDrawer;->release()V

    .line 64
    .line 65
    .line 66
    iput-object v4, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->drawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 67
    .line 68
    :cond_2
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->eglBase:Lcom/momo/rtcbase/EglBase14;

    .line 69
    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/momo/rtcbase/EglBase14;->release()V

    .line 73
    .line 74
    .line 75
    iput-object v4, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->eglBase:Lcom/momo/rtcbase/EglBase14;

    .line 76
    .line 77
    :cond_3
    iget-object v2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->inputSurface:Landroid/view/Surface;

    .line 78
    .line 79
    if-eqz v2, :cond_4

    .line 80
    .line 81
    invoke-virtual {v2}, Landroid/view/Surface;->release()V

    .line 82
    .line 83
    .line 84
    iput-object v4, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->inputSurface:Landroid/view/Surface;

    .line 85
    .line 86
    :cond_4
    sput-object v4, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->runningInstance:Lcom/momo/rtcbase/MediaCodecVideoEncoder;

    .line 87
    .line 88
    if-eqz v5, :cond_6

    .line 89
    .line 90
    sget p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->codecErrors:I

    .line 91
    .line 92
    add-int/2addr p0, v3

    .line 93
    sput p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->codecErrors:I

    .line 94
    .line 95
    sget-object p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->errorCallback:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecVideoEncoderErrorCallback;

    .line 96
    .line 97
    if-eqz p0, :cond_5

    .line 98
    .line 99
    new-instance p0, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    const-string v0, "Invoke codec error callback. Errors: "

    .line 102
    .line 103
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    sget v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->codecErrors:I

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    sget-object p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->errorCallback:Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecVideoEncoderErrorCallback;

    .line 119
    .line 120
    sget v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->codecErrors:I

    .line 121
    .line 122
    invoke-interface {p0, v0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecVideoEncoderErrorCallback;->onMediaCodecVideoEncoderCriticalError(I)V

    .line 123
    .line 124
    .line 125
    :cond_5
    const-string p0, "Media encoder release timeout."

    .line 126
    .line 127
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_6
    iget-object p0, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$1CaughtException;->e:Ljava/lang/Exception;

    .line 132
    .line 133
    if-nez p0, :cond_7

    .line 134
    .line 135
    const-string p0, "Java releaseEncoder done"

    .line 136
    .line 137
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_7
    new-instance v1, Ljava/lang/RuntimeException;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, v0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$1CaughtException;->e:Ljava/lang/Exception;

    .line 147
    .line 148
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {p0, v0}, Lcom/momo/rtcbase/ThreadUtils;->concatStackTraces([Ljava/lang/StackTraceElement;[Ljava/lang/StackTraceElement;)[Ljava/lang/StackTraceElement;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 161
    .line 162
    .line 163
    throw v1
.end method

.method public releaseOutputBuffer(I)Z
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNativeUnchecked;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->checkOnMediaCodecThread()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->mediaCodec:Landroid/media/MediaCodec;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    const-string p1, "MediaCodecVideoEncoder"

    .line 14
    .line 15
    const-string v1, "releaseOutputBuffer failed"

    .line 16
    .line 17
    invoke-static {p1, v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return v0
.end method
