.class Lcom/bytedance/realx/video/HardwareVideoEncoder;
.super Landroid/media/MediaCodec$Callback;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoEncoder;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;
    }
.end annotation


# static fields
.field private static final DEQUEUE_OUTPUT_BUFFER_TIMEOUT_US:I = 0x186a0

.field private static final DEQUEUE_OUTPUT_BUFFER_TIMEOUT_US_RELEASE_ASYNC:I = 0x9c40

.field private static final DTS_OFFSET_FRAME_NUM:I = 0x7

.field private static final KEY_HISI_EXT_CODEC_MAX_QP:Ljava/lang/String; = "vendor.hisi.hisi-ext-codec-max-qp"

.field private static final KEY_HISI_EXT_CODEC_MIN_QP:Ljava/lang/String; = "vendor.hisi.hisi-ext-codec-min-qp"

.field private static final KEY_HISI_EXT_CODEC_NON_REF_P_FRAMES:Ljava/lang/String; = "vendor.hisi.hisi-ext-codec-non-ref-p-frames"

.field private static final KEY_HISI_EXT_CODEC_NON_REF_P_FRAMES_SUPPORTED:Ljava/lang/String; = "vendor.hisi.hisi-ext-codec-non-ref-p-frames-supported"

.field private static final KEY_HISI_EXT_CODEC_QP_REGULATION_SUPPORETD:Ljava/lang/String; = "vendor.hisi.hisi-ext-codec-qp-regulation-supported"

.field private static final KEY_HISI_EXT_CODEC_VENDOR_CONFIGURE:Ljava/lang/String; = "vendor.hisi.hisi-ext-codec-vendor-configure"

.field private static final KEY_PRIVATE_PARAM_CHECK_SVC_LAYER:Ljava/lang/String; = "realx.check.svc.layer"

.field private static final KEY_PRIVATE_PARAM_FORCE_SURFACE_INPUT:Ljava/lang/String; = "realx.force.surface.input"

.field private static final KEY_PRIVATE_PARAM_GLCLEAR:Ljava/lang/String; = "realx.glclear"

.field private static final KEY_PRIVATE_PARAM_NATIVE_RENDER:Ljava/lang/String; = "realx.native.render"

.field private static final KEY_PRIVATE_PARAM_RELEASE_ASYNC:Ljava/lang/String; = "realx.release.async"

.field private static final MAX_VIDEO_FRAMERATE:I = 0x3c

.field private static final MEDIA_CODEC_RELEASE_TIMEOUT_MS:I = 0x1388

.field private static final RESTART_ENCODER_TIME_THRESHOLD_MS:I = 0x1388

.field private static final TAG:Ljava/lang/String; = "HardwareVideoEncoder"


# instance fields
.field private adjustedBitrate:I

.field private asyncHandler:Landroid/os/Handler;

.field private asyncOutputThread:Landroid/os/HandlerThread;

.field private automaticResizeOn:Z

.field private bitrateMode:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

.field private callback:Lcom/bytedance/realx/video/VideoEncoder$Callback;

.field private final callbackLock:Ljava/lang/Object;

.field private checkSVCLayer:Z

.field private codec:Lcom/bytedance/realx/video/MediaCodecWrapper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

.field private final codecName:Ljava/lang/String;

.field private configBuffer:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final dtsQueue:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private enableGlClear:Z

.field private enableNativeRender:Z

.field private final encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

.field private encodedFirstFrame:Z

.field private firstFrameDiffUs:J

.field private forceSurfaceInput:Ljava/lang/Boolean;

.field private final forcedKeyFrameNs:J

.field private height:I

.field private inputBuffers:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private isError:Z

.field private isNeedSurfaceInputWorkaround:Z

.field private isStatisticsEnabled:Z

.field private isTextureBuffer:Ljava/lang/Boolean;

.field private final keyFrameIntervalSec:I

.field private lastKeyFrameNs:J

.field private final mediaCodecWrapperFactory:Lcom/bytedance/realx/video/MediaCodecWrapperFactory;

.field private outputThread:Ljava/lang/Thread;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

.field private privateParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private releaseAsync:Z

.field private volatile running:Z

.field private scaleMode:Lcom/bytedance/realx/video/VideoEncoder$ScaleMode;

.field private settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

.field private sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

.field private volatile shutdownException:Ljava/lang/Exception;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final surfaceColorFormat:Ljava/lang/Integer;

.field private svcRealLayerNum:I

.field private textureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

.field private textureEglBase:Lcom/bytedance/realx/video/EglBase14;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private textureInputSurface:Landroid/view/Surface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private updateBitrate:I

.field private updateBitrateTimestamp:J

.field private useAsyncMode:Z

.field private useSurfaceMode:Z

.field private videoFrameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

.field private videoFrameDrawerHandler:J

.field private vpassPrivateParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private width:I

.field private final yuvColorFormat:Ljava/lang/Integer;

.field private final yuvFormat:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/bytedance/realx/video/RXVideoCodecDesc;Ljava/lang/Integer;Ljava/lang/Integer;II)V
    .locals 5

    .line 1
    invoke-direct {p0}, Landroid/media/MediaCodec$Callback;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    iput-wide v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawerHandler:J

    .line 12
    .line 13
    new-instance v3, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 14
    .line 15
    invoke-direct {v3}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 19
    .line 20
    new-instance v4, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 21
    .line 22
    invoke-direct {v4}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 26
    .line 27
    new-instance v4, Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 33
    .line 34
    new-instance v4, Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->vpassPrivateParams:Ljava/util/HashMap;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->forceSurfaceInput:Ljava/lang/Boolean;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isNeedSurfaceInputWorkaround:Z

    .line 45
    .line 46
    const/4 v4, 0x1

    .line 47
    iput v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->svcRealLayerNum:I

    .line 48
    .line 49
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->checkSVCLayer:Z

    .line 50
    .line 51
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodedFirstFrame:Z

    .line 52
    .line 53
    iput-wide v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->firstFrameDiffUs:J

    .line 54
    .line 55
    new-instance v1, Ljava/util/concurrent/LinkedBlockingDeque;

    .line 56
    .line 57
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->dtsQueue:Ljava/util/Deque;

    .line 61
    .line 62
    iput-boolean v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->releaseAsync:Z

    .line 63
    .line 64
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableGlClear:Z

    .line 65
    .line 66
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useAsyncMode:Z

    .line 67
    .line 68
    new-instance v1, Ljava/util/LinkedList;

    .line 69
    .line 70
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->inputBuffers:Ljava/util/LinkedList;

    .line 74
    .line 75
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isError:Z

    .line 76
    .line 77
    new-instance v1, Ljava/lang/Object;

    .line 78
    .line 79
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->callbackLock:Ljava/lang/Object;

    .line 83
    .line 84
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableNativeRender:Z

    .line 85
    .line 86
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isStatisticsEnabled:Z

    .line 87
    .line 88
    iput-object p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->mediaCodecWrapperFactory:Lcom/bytedance/realx/video/MediaCodecWrapperFactory;

    .line 89
    .line 90
    iput-object p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 93
    .line 94
    iput-object p4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->surfaceColorFormat:Ljava/lang/Integer;

    .line 95
    .line 96
    iput-object p5, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->yuvColorFormat:Ljava/lang/Integer;

    .line 97
    .line 98
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    invoke-static {p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->valueOf(I)Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->yuvFormat:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 107
    .line 108
    iput p6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->keyFrameIntervalSec:I

    .line 109
    .line 110
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 111
    .line 112
    int-to-long p2, p7

    .line 113
    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 114
    .line 115
    .line 116
    move-result-wide p1

    .line 117
    iput-wide p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->forcedKeyFrameNs:J

    .line 118
    .line 119
    invoke-static {}, Lcom/bytedance/realx/base/RXDeviceInfoAndroid;->GetCpuModel()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {}, Lcom/bytedance/realx/base/RXDeviceInfoAndroid;->GetDeviceModel()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    if-eqz p1, :cond_3

    .line 128
    .line 129
    const-string p3, "MT6785V/CC"

    .line 130
    .line 131
    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result p3

    .line 135
    if-nez p3, :cond_1

    .line 136
    .line 137
    const-string p3, "MT6833V/ZA"

    .line 138
    .line 139
    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    if-eqz p3, :cond_0

    .line 144
    .line 145
    const-string p3, "RMX3610"

    .line 146
    .line 147
    invoke-virtual {p3, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    if-eqz p2, :cond_1

    .line 152
    .line 153
    :cond_0
    const-string p2, "MT6833V/PNZA"

    .line 154
    .line 155
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    if-nez p2, :cond_1

    .line 160
    .line 161
    const-string p2, "MT6853V/ZA"

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    if-nez p2, :cond_1

    .line 168
    .line 169
    const-string p2, "MT6893Z_C/CZA"

    .line 170
    .line 171
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_2

    .line 176
    .line 177
    :cond_1
    move v0, v4

    .line 178
    :cond_2
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isNeedSurfaceInputWorkaround:Z

    .line 179
    .line 180
    :cond_3
    invoke-virtual {v3}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public static synthetic a(Lcom/bytedance/realx/video/HardwareVideoEncoder;Lcom/bytedance/realx/video/MediaCodecWrapper;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const-string v0, "mediacodec release start!"

    .line 8
    .line 9
    const-string v1, "HardwareVideoEncoder"

    .line 10
    .line 11
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :try_start_0
    invoke-interface {p1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception v0

    .line 19
    const-string v2, "Media encoder stop failed"

    .line 20
    .line 21
    invoke-static {v1, v2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :goto_0
    :try_start_1
    invoke-interface {p1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :catch_1
    move-exception p1

    .line 29
    const-string v0, "Media encoder release failed"

    .line 30
    .line 31
    invoke-static {v1, v0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->shutdownException:Ljava/lang/Exception;

    .line 35
    .line 36
    :goto_1
    const-string p0, "mediacodec release end!"

    .line 37
    .line 38
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic access$000(Lcom/bytedance/realx/video/HardwareVideoEncoder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/bytedance/realx/video/HardwareVideoEncoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->releaseCodecOnOutputThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/bytedance/realx/video/HardwareVideoEncoder;Landroid/os/HandlerThread;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->releaseCodecOnOutputThread()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method private caculateDts(JLcom/bytedance/realx/video/EncodedImage$Builder;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isBFrameEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->dtsQueue:Ljava/util/Deque;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/Deque;->pollLast()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Long;

    .line 14
    .line 15
    const-string v1, "HardwareVideoEncoder"

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const-string p0, "dtsQueue is empty."

    .line 20
    .line 21
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-boolean v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodedFirstFrame:Z

    .line 26
    .line 27
    const-string v3, " "

    .line 28
    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    iput-boolean v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodedFirstFrame:Z

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    sub-long v4, p1, v4

    .line 39
    .line 40
    iput-wide v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->firstFrameDiffUs:J

    .line 41
    .line 42
    new-instance v2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v4, "firstFrameDiffUs: "

    .line 45
    .line 46
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-wide v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->firstFrameDiffUs:J

    .line 50
    .line 51
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    iget-wide v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->firstFrameDiffUs:J

    .line 72
    .line 73
    add-long/2addr v4, v6

    .line 74
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 75
    .line 76
    iget p0, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetFps:I

    .line 77
    .line 78
    const v0, 0xf4240

    .line 79
    .line 80
    .line 81
    div-int/2addr v0, p0

    .line 82
    mul-int/lit8 v0, v0, 0x7

    .line 83
    .line 84
    int-to-long v6, v0

    .line 85
    sub-long/2addr v4, v6

    .line 86
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    sub-long/2addr p1, v4

    .line 91
    const-wide/16 v6, 0x0

    .line 92
    .line 93
    cmp-long v0, v4, v6

    .line 94
    .line 95
    if-ltz v0, :cond_4

    .line 96
    .line 97
    cmp-long v0, p1, v6

    .line 98
    .line 99
    if-gez v0, :cond_2

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    if-nez v0, :cond_3

    .line 103
    .line 104
    const-wide/16 p1, 0x1

    .line 105
    .line 106
    :cond_3
    invoke-virtual {p3, p1, p2}, Lcom/bytedance/realx/video/EncodedImage$Builder;->setCompositionTimeUs(J)Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_4
    :goto_0
    new-instance p3, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v0, "ctsUs < 0; "

    .line 113
    .line 114
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_5
    return-void
.end method

.method private canUseSurface()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->surfaceColorFormat:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private createOutputThread()Ljava/lang/Thread;
    .locals 2

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/HardwareVideoEncoder$1;

    .line 2
    .line 3
    const-string v1, "video_encoded_thread"

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/bytedance/realx/video/HardwareVideoEncoder$1;-><init>(Lcom/bytedance/realx/video/HardwareVideoEncoder;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method private drainInputData(ILjava/nio/ByteBuffer;Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 8

    .line 1
    invoke-interface {p3}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p3}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    mul-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x3

    .line 11
    .line 12
    div-int/lit8 v4, v0, 0x2

    .line 13
    .line 14
    invoke-interface {p3}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getTimestampNs()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const-wide/16 v2, 0x3e8

    .line 19
    .line 20
    div-long v5, v0, v2

    .line 21
    .line 22
    invoke-virtual {p0, p2, p3}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->fillInputBuffer(Ljava/nio/ByteBuffer;Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v7, 0x0

    .line 29
    move v2, p1

    .line 30
    invoke-interface/range {v1 .. v7}, Lcom/bytedance/realx/video/MediaCodecWrapper;->queueInputBuffer(IIIJI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 34
    .line 35
    return-object p0

    .line 36
    :catch_0
    move-exception v0

    .line 37
    move-object p0, v0

    .line 38
    const-string p1, "HardwareVideoEncoder"

    .line 39
    .line 40
    const-string p2, "queueInputBuffer failed"

    .line 41
    .line 42
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 46
    .line 47
    return-object p0
.end method

.method private drainOutputData(ILandroid/media/MediaCodec$BufferInfo;Ljava/nio/ByteBuffer;)V
    .locals 8

    .line 1
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 2
    .line 3
    invoke-virtual {p3, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 4
    .line 5
    .line 6
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 7
    .line 8
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 9
    .line 10
    add-int/2addr v0, v1

    .line 11
    invoke-virtual {p3, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 12
    .line 13
    .line 14
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 15
    .line 16
    and-int/lit8 v1, v0, 0x2

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    const-string v3, "HardwareVideoEncoder"

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v1, "Config frame generated. Offset: "

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ". Size: "

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v3, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget p2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 53
    .line 54
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iput-object p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    .line 63
    goto/16 :goto_6

    .line 64
    .line 65
    :cond_0
    const/4 v1, 0x1

    .line 66
    and-int/2addr v0, v1

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    move v1, v2

    .line 71
    :goto_0
    if-eqz v1, :cond_2

    .line 72
    .line 73
    const-string v0, "Sync frame generated"

    .line 74
    .line 75
    invoke-static {v3, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isStatisticsEnabled:Z

    .line 79
    .line 80
    const/4 v4, 0x0

    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 84
    .line 85
    invoke-interface {v0, p1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputFormat(I)Landroid/media/MediaFormat;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    const-string v5, "video-qp-average"

    .line 92
    .line 93
    invoke-virtual {v0, v5}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    if-eqz v6, :cond_3

    .line 98
    .line 99
    invoke-virtual {v0, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    goto :goto_1

    .line 108
    :cond_3
    move-object v5, v4

    .line 109
    :goto_1
    const-string v6, "picture-type"

    .line 110
    .line 111
    invoke-virtual {v0, v6}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    if-eqz v7, :cond_5

    .line 116
    .line 117
    invoke-virtual {v0, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    goto :goto_2

    .line 126
    :cond_4
    move-object v5, v4

    .line 127
    :cond_5
    :goto_2
    if-eqz v1, :cond_7

    .line 128
    .line 129
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    sget-object v6, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 136
    .line 137
    if-eq v0, v6, :cond_6

    .line 138
    .line 139
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 140
    .line 141
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    sget-object v6, Lcom/bytedance/realx/video/RXVideoCodecStandard;->ByteVC1:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 146
    .line 147
    if-ne v0, v6, :cond_7

    .line 148
    .line 149
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v6, "Prepending config frame of size "

    .line 152
    .line 153
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 157
    .line 158
    invoke-virtual {v6}, Ljava/nio/Buffer;->capacity()I

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string v6, " to output buffer with offset "

    .line 166
    .line 167
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    iget v6, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 171
    .line 172
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v6, ", size "

    .line 176
    .line 177
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget v6, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 181
    .line 182
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {v3, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 193
    .line 194
    iget-object v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 195
    .line 196
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    add-int/2addr v0, v3

    .line 201
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    iget-object v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 206
    .line 207
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 208
    .line 209
    .line 210
    iget-object v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 211
    .line 212
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0, p3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 219
    .line 220
    .line 221
    goto :goto_3

    .line 222
    :cond_7
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    :goto_3
    if-eqz v1, :cond_8

    .line 227
    .line 228
    sget-object p3, Lcom/bytedance/realx/video/EncodedImage$FrameType;->kIntra:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 229
    .line 230
    goto :goto_4

    .line 231
    :cond_8
    sget-object p3, Lcom/bytedance/realx/video/EncodedImage$FrameType;->kPredicted:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 232
    .line 233
    :goto_4
    if-eqz v4, :cond_9

    .line 234
    .line 235
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 236
    .line 237
    .line 238
    move-result p3

    .line 239
    invoke-static {p3}, Lcom/bytedance/realx/video/EncodedImage$FrameType;->valueOf(I)Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 240
    .line 241
    .line 242
    move-result-object p3

    .line 243
    :cond_9
    invoke-static {}, Lcom/bytedance/realx/video/EncodedImage;->builder()Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    iget v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->width:I

    .line 248
    .line 249
    invoke-virtual {v1, v3}, Lcom/bytedance/realx/video/EncodedImage$Builder;->setEncodedWidth(I)Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    iget v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->height:I

    .line 254
    .line 255
    invoke-virtual {v1, v3}, Lcom/bytedance/realx/video/EncodedImage$Builder;->setEncodedHeight(I)Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    iget-wide v3, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 260
    .line 261
    const-wide/16 v6, 0x3e8

    .line 262
    .line 263
    mul-long/2addr v3, v6

    .line 264
    invoke-virtual {v1, v3, v4}, Lcom/bytedance/realx/video/EncodedImage$Builder;->setCaptureTimeNs(J)Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-virtual {v1, v0}, Lcom/bytedance/realx/video/EncodedImage$Builder;->setBuffer(Ljava/nio/ByteBuffer;)Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    iget-boolean v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->checkSVCLayer:Z

    .line 273
    .line 274
    if-eqz v1, :cond_a

    .line 275
    .line 276
    iget v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->svcRealLayerNum:I

    .line 277
    .line 278
    goto :goto_5

    .line 279
    :cond_a
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 280
    .line 281
    iget v1, v1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->temporalLayerNum:I

    .line 282
    .line 283
    :goto_5
    invoke-virtual {v0, v1}, Lcom/bytedance/realx/video/EncodedImage$Builder;->setSvcLayerNum(I)Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v0, p3}, Lcom/bytedance/realx/video/EncodedImage$Builder;->setFrameType(Lcom/bytedance/realx/video/EncodedImage$FrameType;)Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 288
    .line 289
    .line 290
    move-result-object p3

    .line 291
    if-eqz v5, :cond_b

    .line 292
    .line 293
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-lez v0, :cond_b

    .line 298
    .line 299
    invoke-virtual {p3, v5}, Lcom/bytedance/realx/video/EncodedImage$Builder;->setQp(Ljava/lang/Integer;)Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 300
    .line 301
    .line 302
    :cond_b
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 303
    .line 304
    invoke-direct {p0, v0, v1, p3}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->caculateDts(JLcom/bytedance/realx/video/EncodedImage$Builder;)V

    .line 305
    .line 306
    .line 307
    iget-object p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->callback:Lcom/bytedance/realx/video/VideoEncoder$Callback;

    .line 308
    .line 309
    invoke-virtual {p3}, Lcom/bytedance/realx/video/EncodedImage$Builder;->createEncodedImage()Lcom/bytedance/realx/video/EncodedImage;

    .line 310
    .line 311
    .line 312
    move-result-object p3

    .line 313
    new-instance v0, Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;

    .line 314
    .line 315
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 316
    .line 317
    invoke-virtual {v1}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    invoke-direct {v0, v1}, Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;-><init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;)V

    .line 322
    .line 323
    .line 324
    invoke-interface {p2, p3, v0}, Lcom/bytedance/realx/video/VideoEncoder$Callback;->onEncodedFrame(Lcom/bytedance/realx/video/EncodedImage;Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;)V

    .line 325
    .line 326
    .line 327
    :goto_6
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 328
    .line 329
    invoke-interface {p0, p1, v2}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V

    .line 330
    .line 331
    .line 332
    return-void
.end method

.method private enableEncodingStatistics(Landroid/media/MediaFormat;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isEncodingStatisticsSupported()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->isStatisticsEnabled:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "video-encoding-statistics-level"

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p1, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    iput-boolean v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isStatisticsEnabled:Z

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private encodeByteBuffer(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useAsyncMode:Z

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->callbackLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->inputBuffers:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-gtz v2, :cond_0

    .line 21
    .line 22
    move v2, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->inputBuffers:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    if-ne v2, v1, :cond_1

    .line 38
    .line 39
    const-string p0, "HardwareVideoEncoder"

    .line 40
    .line 41
    const-string p1, "Dropped frame, no input buffers available"

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->NO_OUTPUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 50
    .line 51
    invoke-interface {v0, v2}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 55
    goto :goto_1

    .line 56
    :catch_0
    move-exception p0

    .line 57
    const-string p1, "HardwareVideoEncoder"

    .line 58
    .line 59
    const-string v0, "getInputBuffer failed"

    .line 60
    .line 61
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 65
    .line 66
    return-object p0

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    throw p0

    .line 70
    :cond_2
    :try_start_3
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 71
    .line 72
    const-wide/16 v2, 0x0

    .line 73
    .line 74
    invoke-interface {v0, v2, v3}, Lcom/bytedance/realx/video/MediaCodecWrapper;->dequeueInputBuffer(J)I

    .line 75
    .line 76
    .line 77
    move-result v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 78
    if-ne v2, v1, :cond_3

    .line 79
    .line 80
    const-string p0, "HardwareVideoEncoder"

    .line 81
    .line 82
    const-string p1, "Dropped frame, no input buffers available"

    .line 83
    .line 84
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->NO_OUTPUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 88
    .line 89
    return-object p0

    .line 90
    :cond_3
    :try_start_4
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 91
    .line 92
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    aget-object v0, v0, v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 97
    .line 98
    :goto_1
    invoke-direct {p0, v2, v0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->drainInputData(ILjava/nio/ByteBuffer;Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :catch_1
    move-exception p0

    .line 104
    const-string p1, "HardwareVideoEncoder"

    .line 105
    .line 106
    const-string v0, "getInputBuffers failed"

    .line 107
    .line 108
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 109
    .line 110
    .line 111
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 112
    .line 113
    return-object p0

    .line 114
    :catch_2
    move-exception p0

    .line 115
    const-string p1, "HardwareVideoEncoder"

    .line 116
    .line 117
    const-string v0, "dequeueInputBuffer failed"

    .line 118
    .line 119
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 120
    .line 121
    .line 122
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 123
    .line 124
    return-object p0
.end method

.method private encodeTextureBuffer(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 8

    .line 1
    const-string v1, "HardwareVideoEncoder"

    .line 2
    .line 3
    const-string v0, "got egl err:"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    new-instance v3, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    move-object p0, v0

    .line 34
    goto :goto_2

    .line 35
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableGlClear:Z

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    const/16 v0, 0x4000

    .line 40
    .line 41
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableNativeRender:Z

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-wide v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawerHandler:J

    .line 49
    .line 50
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getNativeHandle()J

    .line 51
    .line 52
    .line 53
    move-result-wide v4

    .line 54
    iget v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->width:I

    .line 55
    .line 56
    iget v7, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->height:I

    .line 57
    .line 58
    invoke-static/range {v2 .. v7}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->nativeDrawFrame(JJII)I

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    sget-object v0, Lcom/bytedance/realx/video/RXVideoRotation;->VIDEO_ROTATION_0:Lcom/bytedance/realx/video/RXVideoRotation;

    .line 63
    .line 64
    invoke-interface {p1, v0}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->setRotation(Lcom/bytedance/realx/video/RXVideoRotation;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 68
    .line 69
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    invoke-virtual {v0, p1, v2, v3}, Lcom/bytedance/realx/video/VideoFrameDrawer;->drawFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V

    .line 73
    .line 74
    .line 75
    :goto_1
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 76
    .line 77
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getTimestampNs()J

    .line 78
    .line 79
    .line 80
    move-result-wide v2

    .line 81
    invoke-virtual {p0, v2, v3}, Lcom/bytedance/realx/video/EglBase14;->swapBuffers(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 85
    .line 86
    return-object p0

    .line 87
    :goto_2
    const-string p1, "encodeTexture failed"

    .line 88
    .line 89
    invoke-static {v1, p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 93
    .line 94
    return-object p0
.end method

.method private initEncodeInternal()Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 5

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "Format: "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, -0x1

    .line 11
    .line 12
    iput-wide v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->lastKeyFrameNs:J

    .line 13
    .line 14
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->vpassPrivateParams:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->dtsQueue:Ljava/util/Deque;

    .line 27
    .line 28
    invoke-interface {v2}, Ljava/util/Collection;->clear()V

    .line 29
    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    iput-boolean v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isStatisticsEnabled:Z

    .line 33
    .line 34
    iget-object v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->callbackLock:Ljava/lang/Object;

    .line 35
    .line 36
    monitor-enter v3

    .line 37
    :try_start_0
    iget-object v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->inputBuffers:Ljava/util/LinkedList;

    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/util/LinkedList;->clear()V

    .line 40
    .line 41
    .line 42
    iput-boolean v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isError:Z

    .line 43
    .line 44
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    :try_start_1
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->mediaCodecWrapperFactory:Lcom/bytedance/realx/video/MediaCodecWrapperFactory;

    .line 46
    .line 47
    iget-object v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 48
    .line 49
    invoke-interface {v2, v3}, Lcom/bytedance/realx/video/MediaCodecWrapperFactory;->createByCodecName(Ljava/lang/String;)Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iput-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 54
    .line 55
    :try_start_2
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->width:I

    .line 66
    .line 67
    iget v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->height:I

    .line 68
    .line 69
    invoke-static {v2, v3, v4}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-direct {p0, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->initMediaFormat(Landroid/media/MediaFormat;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableEncodingStatistics(Landroid/media/MediaFormat;)V

    .line 77
    .line 78
    .line 79
    const-string v3, "HardwareVideoEncoder"

    .line 80
    .line 81
    new-instance v4, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-static {v3, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-boolean v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useAsyncMode:Z

    .line 97
    .line 98
    const/4 v3, 0x1

    .line 99
    if-eqz v1, :cond_0

    .line 100
    .line 101
    new-instance v1, Landroid/os/HandlerThread;

    .line 102
    .line 103
    const-string v4, "asyncOutput"

    .line 104
    .line 105
    invoke-direct {v1, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 111
    .line 112
    .line 113
    new-instance v1, Landroid/os/Handler;

    .line 114
    .line 115
    iget-object v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 116
    .line 117
    invoke-virtual {v4}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-direct {v1, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 122
    .line 123
    .line 124
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncHandler:Landroid/os/Handler;

    .line 125
    .line 126
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 129
    .line 130
    .line 131
    iput-boolean v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 132
    .line 133
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 134
    .line 135
    iget-object v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncHandler:Landroid/os/Handler;

    .line 136
    .line 137
    invoke-interface {v1, p0, v4}, Lcom/bytedance/realx/video/MediaCodecWrapper;->setCallback(Landroid/media/MediaCodec$Callback;Landroid/os/Handler;)V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    .line 142
    goto/16 :goto_2

    .line 143
    .line 144
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 145
    .line 146
    const/4 v4, 0x0

    .line 147
    invoke-interface {v1, v2, v4, v4, v3}, Lcom/bytedance/realx/video/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 148
    .line 149
    .line 150
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isSvcEnabled()Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_1

    .line 155
    .line 156
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 157
    .line 158
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputFormat()Landroid/media/MediaFormat;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    if-eqz v1, :cond_1

    .line 163
    .line 164
    invoke-direct {p0, v1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->parseRealLayerNum(Landroid/media/MediaFormat;)I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    iput v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->svcRealLayerNum:I

    .line 169
    .line 170
    const-string v2, "HardwareVideoEncoder"

    .line 171
    .line 172
    new-instance v4, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    iget v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->svcRealLayerNum:I

    .line 178
    .line 179
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v0, "\uff0coutput format after configure: "

    .line 183
    .line 184
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_1
    invoke-static {}, Lcom/bytedance/realx/RXVideoSurfaceController;->getInstance()Lcom/bytedance/realx/RXVideoSurfaceController;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Lcom/bytedance/realx/RXVideoSurfaceController;->usePassSurfaceMode()Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-eqz v0, :cond_2

    .line 210
    .line 211
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 212
    .line 213
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->createInputSurface()Landroid/view/Surface;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 218
    .line 219
    invoke-static {}, Lcom/bytedance/realx/RXVideoSurfaceController;->getInstance()Lcom/bytedance/realx/RXVideoSurfaceController;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Lcom/bytedance/realx/RXVideoSurfaceController;->setSurface(Landroid/view/Surface;)V

    .line 226
    .line 227
    .line 228
    goto :goto_1

    .line 229
    :cond_2
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 230
    .line 231
    if-eqz v0, :cond_3

    .line 232
    .line 233
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 234
    .line 235
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->createInputSurface()Landroid/view/Surface;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 240
    .line 241
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    sget-object v1, Lcom/bytedance/realx/video/EglBase$Config;->CONFIG_RECORDABLE:Lcom/bytedance/realx/video/EglBase$Config;

    .line 246
    .line 247
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/EglBase;->getEGLConfig(ILcom/bytedance/realx/video/EglBase$Config;)[I

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    new-instance v1, Lcom/bytedance/realx/video/EglBase14;

    .line 252
    .line 253
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    .line 254
    .line 255
    invoke-direct {v1, v2, v0}, Lcom/bytedance/realx/video/EglBase14;-><init>(Lcom/bytedance/realx/video/EglBase14$Context;[I)V

    .line 256
    .line 257
    .line 258
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 259
    .line 260
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 261
    .line 262
    invoke-virtual {v1, v0}, Lcom/bytedance/realx/video/EglBase14;->createSurface(Landroid/view/Surface;)V

    .line 263
    .line 264
    .line 265
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 266
    .line 267
    invoke-virtual {v0}, Lcom/bytedance/realx/video/EglBase14;->makeCurrent()V

    .line 268
    .line 269
    .line 270
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->initFrameDrawer()V

    .line 271
    .line 272
    .line 273
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 274
    .line 275
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->start()V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 279
    .line 280
    iget v1, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 281
    .line 282
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 283
    .line 284
    invoke-direct {p0, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setExtCodecForHisi(II)V

    .line 285
    .line 286
    .line 287
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 288
    .line 289
    iget-object v1, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->encodeMode:Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;

    .line 290
    .line 291
    sget-object v2, Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;->LIVE:Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;

    .line 292
    .line 293
    if-ne v1, v2, :cond_4

    .line 294
    .line 295
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetBps:I

    .line 296
    .line 297
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrate(I)Lcom/bytedance/realx/video/VideoCodecStatus;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 298
    .line 299
    .line 300
    :cond_4
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useAsyncMode:Z

    .line 301
    .line 302
    if-nez v0, :cond_5

    .line 303
    .line 304
    iput-boolean v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 305
    .line 306
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 307
    .line 308
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 309
    .line 310
    .line 311
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->createOutputThread()Ljava/lang/Thread;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 316
    .line 317
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 318
    .line 319
    .line 320
    :cond_5
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 321
    .line 322
    return-object p0

    .line 323
    :goto_2
    const-string v1, "HardwareVideoEncoder"

    .line 324
    .line 325
    const-string v2, "initEncodeInternal failed"

    .line 326
    .line 327
    invoke-static {v1, v2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->release()Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 331
    .line 332
    .line 333
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 334
    .line 335
    return-object p0

    .line 336
    :catch_1
    move-exception v0

    .line 337
    const-string v1, "HardwareVideoEncoder"

    .line 338
    .line 339
    new-instance v2, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    const-string v3, "Cannot create media encoder "

    .line 342
    .line 343
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 347
    .line 348
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    invoke-static {v1, p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 356
    .line 357
    .line 358
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 359
    .line 360
    return-object p0

    .line 361
    :catchall_0
    move-exception p0

    .line 362
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 363
    throw p0
.end method

.method private initFrameDrawer()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableNativeRender:Z

    .line 2
    .line 3
    const-string v1, "HardwareVideoEncoder"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->nativeCreateDrawer()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    iput-wide v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawerHandler:J

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "created native frame drawer 0x"

    .line 16
    .line 17
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-wide v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawerHandler:J

    .line 21
    .line 22
    invoke-static {v2, v3}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    new-instance v0, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 38
    .line 39
    invoke-direct {v0}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 43
    .line 44
    new-instance v0, Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 45
    .line 46
    invoke-direct {v0}, Lcom/bytedance/realx/video/VideoFrameDrawer;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v2, "created java frame drawer "

    .line 54
    .line 55
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private initMediaFormat(Landroid/media/MediaFormat;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->surfaceColorFormat:Ljava/lang/Integer;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->yuvColorFormat:Ljava/lang/Integer;

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 20
    .line 21
    iget v2, v2, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetBps:I

    .line 22
    .line 23
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "bitrate"

    .line 28
    .line 29
    invoke-direct {p0, p1, v3, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 30
    .line 31
    .line 32
    const-string v2, "color-format"

    .line 33
    .line 34
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 38
    .line 39
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetFps:I

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v2, "frame-rate"

    .line 46
    .line 47
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 51
    .line 52
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetKeyFrameIntervalMs:I

    .line 53
    .line 54
    const-string v2, "i-frame-interval"

    .line 55
    .line 56
    const/4 v3, 0x1

    .line 57
    if-gtz v0, :cond_1

    .line 58
    .line 59
    iget v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->keyFrameIntervalSec:I

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_1
    div-int/lit16 v0, v0, 0x3e8

    .line 70
    .line 71
    if-le v0, v3, :cond_2

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    move v0, v3

    .line 75
    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 80
    .line 81
    .line 82
    :goto_2
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setBitrateMode(Landroid/media/MediaFormat;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->encodeMode:Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;

    .line 88
    .line 89
    sget-object v2, Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;->LIVE:Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;

    .line 90
    .line 91
    if-ne v0, v2, :cond_3

    .line 92
    .line 93
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setProfileForLive(Landroid/media/MediaFormat;)V

    .line 94
    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_3
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setProfileForRTC(Landroid/media/MediaFormat;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setColorSpace(Landroid/media/MediaFormat;)V

    .line 101
    .line 102
    .line 103
    :goto_3
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setBFrameNumber(Landroid/media/MediaFormat;)V

    .line 104
    .line 105
    .line 106
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setSVCNumber(Landroid/media/MediaFormat;)V

    .line 107
    .line 108
    .line 109
    sget-object v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 110
    .line 111
    if-eq v1, v0, :cond_5

    .line 112
    .line 113
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 114
    .line 115
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->enableQpSetting:Z

    .line 116
    .line 117
    if-eqz v0, :cond_5

    .line 118
    .line 119
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 120
    .line 121
    const-string v1, "OMX.hisi."

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_4

    .line 128
    .line 129
    const-string v0, "vendor.hisi.hisi-ext-codec-vendor-configure"

    .line 130
    .line 131
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-direct {p0, p1, v0, v1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 136
    .line 137
    .line 138
    :cond_4
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIPFrameMinMaxQP(Landroid/media/MediaFormat;)V

    .line 139
    .line 140
    .line 141
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isBFrameEnabled()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_5

    .line 146
    .line 147
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setBFrameMinMaxQP(Landroid/media/MediaFormat;)V

    .line 148
    .line 149
    .line 150
    :cond_5
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    :cond_6
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_8

    .line 165
    .line 166
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    check-cast v1, Ljava/util/Map$Entry;

    .line 171
    .line 172
    new-instance v2, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v3, "set android hardware encoder private param with Key:"

    .line 175
    .line 176
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    check-cast v3, Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v3, " Value:"

    .line 189
    .line 190
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    check-cast v3, Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    const-string v3, "HardwareVideoEncoder"

    .line 207
    .line 208
    invoke-static {v3, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    check-cast v2, Ljava/lang/String;

    .line 216
    .line 217
    invoke-direct {p0, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isNumeric(Ljava/lang/String;)Z

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-eqz v2, :cond_7

    .line 222
    .line 223
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    check-cast v2, Ljava/lang/String;

    .line 228
    .line 229
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Ljava/lang/String;

    .line 234
    .line 235
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    invoke-virtual {p1, v2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 240
    .line 241
    .line 242
    goto :goto_4

    .line 243
    :cond_7
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    check-cast v2, Ljava/lang/String;

    .line 248
    .line 249
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    if-lez v2, :cond_6

    .line 254
    .line 255
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    check-cast v2, Ljava/lang/String;

    .line 260
    .line 261
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    check-cast v1, Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p1, v2, v1}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_8
    return-void
.end method

.method private isBFrameEnabled()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 8
    .line 9
    iget p0, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->bFrameNum:I

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private isDeviceSupportResetBitrate()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/RXDeviceInfoAndroid;->GetDeviceModel()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "M2007J17C"

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method private isEncodingStatisticsSupported()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 4
    .line 5
    sget-object v1, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getCodecInfo()Landroid/media/MediaCodecInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return v2

    .line 20
    :cond_1
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-nez p0, :cond_2

    .line 33
    .line 34
    return v2

    .line 35
    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 36
    .line 37
    const/16 v1, 0x21

    .line 38
    .line 39
    if-lt v0, v1, :cond_3

    .line 40
    .line 41
    const-string v0, "encoding-statistics"

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureSupported(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_3
    return v2
.end method

.method private isForceUseSurfaceInput(I)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "qti"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v2, "qcom"

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    :cond_0
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isBFrameEnabled()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->forceSurfaceInput:Ljava/lang/Boolean;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isNeedSurfaceInputWorkaround:Z

    .line 48
    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget-boolean p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isNeedSurfaceInputWorkaround:Z

    .line 53
    .line 54
    if-eqz p0, :cond_3

    .line 55
    .line 56
    rem-int/lit8 p1, p1, 0x10

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    :goto_0
    return v1

    .line 61
    :cond_3
    const/4 p0, 0x0

    .line 62
    return p0
.end method

.method private isNumeric(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "[0-9]+"

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private isSvcEnabled()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 2
    .line 3
    iget p0, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->temporalLayerNum:I

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-le p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static native nativeCreateDrawer()J
.end method

.method public static native nativeDestroyDrawer(J)V
.end method

.method public static native nativeDrawFrame(JJII)I
.end method

.method private parseRealLayerNum(Landroid/media/MediaFormat;)I
    .locals 4

    .line 1
    const-string v0, "ts-schema"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    const-string v2, "HardwareVideoEncoder"

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/16 v3, 0x11

    .line 21
    .line 22
    if-ge v0, v3, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/16 v0, 0x10

    .line 26
    .line 27
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isNumeric(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 42
    .line 43
    iget p0, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->temporalLayerNum:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    if-gt v0, p0, :cond_1

    .line 46
    .line 47
    if-lez v0, :cond_1

    .line 48
    .line 49
    return v0

    .line 50
    :catch_0
    move-exception p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    const-string p0, "temporal layer invalid: "

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return v1

    .line 68
    :cond_2
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v0, "output temporal str is: "

    .line 71
    .line 72
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return v1
.end method

.method private releaseCodecOnOutputThread()V
    .locals 5

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    const-string v1, "check thread error."

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    const-string v1, "Releasing MediaCodec on output thread"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    iput-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 23
    .line 24
    iget-boolean v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->releaseAsync:Z

    .line 25
    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    new-instance v3, Ljava/lang/Thread;

    .line 29
    .line 30
    new-instance v4, Lcom/bytedance/realx/video/d;

    .line 31
    .line 32
    invoke-direct {v4, p0, v1}, Lcom/bytedance/realx/video/d;-><init>(Lcom/bytedance/realx/video/HardwareVideoEncoder;Lcom/bytedance/realx/video/MediaCodecWrapper;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_0
    if-eqz v1, :cond_1

    .line 43
    .line 44
    :try_start_1
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->stop()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catch_1
    move-exception v3

    .line 49
    const-string v4, "Media encoder stop failed"

    .line 50
    .line 51
    invoke-static {v0, v4, v3}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :goto_1
    :try_start_2
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->release()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :catch_2
    move-exception v1

    .line 59
    const-string v3, "Media encoder release failed"

    .line 60
    .line 61
    invoke-static {v0, v3, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->shutdownException:Ljava/lang/Exception;

    .line 65
    .line 66
    :cond_1
    :goto_2
    iput-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    const-string p0, "Release on output thread done"

    .line 69
    .line 70
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private releaseFrameDrawer()V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawerHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    const-string v5, "HardwareVideoEncoder"

    .line 8
    .line 9
    if-eqz v4, :cond_0

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->nativeDestroyDrawer(J)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "released native frame drawer 0x"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-wide v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawerHandler:J

    .line 22
    .line 23
    invoke-static {v6, v7}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v5, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-wide v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawerHandler:J

    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlGenericDrawer;->release()V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/bytedance/realx/video/VideoFrameDrawer;->release()V

    .line 54
    .line 55
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v2, "released java frame drawer "

    .line 59
    .line 60
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v5, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->videoFrameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 76
    .line 77
    :cond_2
    return-void
.end method

.method private requestKeyFrame(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v0, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "request-sync"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 18
    .line 19
    invoke-interface {v1, v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    iput-wide p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->lastKeyFrameNs:J

    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    const-string p1, "HardwareVideoEncoder"

    .line 27
    .line 28
    const-string p2, "requestKeyFrame failed"

    .line 29
    .line 30
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private resetCodec(IIZ)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "resetCodec: "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "HardwareVideoEncoder"

    .line 35
    .line 36
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->release()Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget-object v1, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 44
    .line 45
    if-eq v0, v1, :cond_0

    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_0
    iput p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->width:I

    .line 49
    .line 50
    iput p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->height:I

    .line 51
    .line 52
    iput-boolean p3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 53
    .line 54
    iget-object p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 55
    .line 56
    iget p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrate:I

    .line 57
    .line 58
    iput p2, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetBps:I

    .line 59
    .line 60
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 61
    .line 62
    .line 63
    move-result-wide p1

    .line 64
    iput-wide p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrateTimestamp:J

    .line 65
    .line 66
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->initEncodeInternal()Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method private resetCodecWhenBitrateChange()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isDeviceSupportResetBitrate()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrate:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 10
    .line 11
    iget v1, v1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetBps:I

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-wide v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrateTimestamp:J

    .line 20
    .line 21
    sub-long/2addr v0, v2

    .line 22
    const-wide/16 v2, 0x1388

    .line 23
    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-ltz v0, :cond_0

    .line 27
    .line 28
    iget v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->width:I

    .line 29
    .line 30
    iget v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->height:I

    .line 31
    .line 32
    iget-boolean v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 33
    .line 34
    invoke-direct {p0, v0, v1, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->resetCodec(IIZ)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method private setBFrameMinMaxQP(Landroid/media/MediaFormat;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 8
    .line 9
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "video-qp-b-max"

    .line 16
    .line 17
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 21
    .line 22
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "video-qp-b-min"

    .line 29
    .line 30
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "qti"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 48
    .line 49
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "vendor.qti-ext-enc-qp-range.qp-b-min"

    .line 56
    .line 57
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 61
    .line 62
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 63
    .line 64
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "vendor.qti-ext-enc-qp-range.qp-b-max"

    .line 69
    .line 70
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method private setBFrameNumber(Landroid/media/MediaFormat;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isBFrameEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "max-bframes"

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v2, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 16
    .line 17
    if-ne v0, v2, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getProfile()Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v2, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 26
    .line 27
    if-eq v0, v2, :cond_0

    .line 28
    .line 29
    sget-object v2, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileConstrainedHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 30
    .line 31
    if-eq v0, v2, :cond_0

    .line 32
    .line 33
    const-string v0, "HardwareVideoEncoder"

    .line 34
    .line 35
    const-string v2, "enabel b frame, set high profile explicitly"

    .line 36
    .line 37
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/16 v0, 0x8

    .line 41
    .line 42
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v2, "profile"

    .line 47
    .line 48
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 49
    .line 50
    .line 51
    const/16 v0, 0x100

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v2, "level"

    .line 58
    .line 59
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    const/4 v0, 0x1

    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    const/4 v0, 0x0

    .line 72
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private setBitrateMode(Landroid/media/MediaFormat;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getCodecInfo()Landroid/media/MediaCodecInfo;

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;->CBR:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->bitrateMode:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

    .line 11
    .line 12
    const-string v2, "bitrate-mode"

    .line 13
    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    sget-object v0, Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;->AUTO:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :goto_0
    const/4 v0, 0x2

    .line 31
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private setExtCodecForHisi(II)V
    .locals 7

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "OMX.hisi."

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_7

    .line 12
    .line 13
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    :try_start_0
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputFormat()Landroid/media/MediaFormat;

    .line 20
    .line 21
    .line 22
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    goto :goto_0

    .line 24
    :catch_0
    move-exception v1

    .line 25
    const-string v2, "getOutputFormat failed"

    .line 26
    .line 27
    invoke-static {v0, v2, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    :goto_0
    if-nez v1, :cond_1

    .line 32
    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v3, "output format before start: "

    .line 38
    .line 39
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const-string v2, "vendor.hisi.hisi-ext-codec-qp-regulation-supported"

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    const/4 v4, 0x0

    .line 63
    const/4 v5, 0x1

    .line 64
    if-eqz v3, :cond_2

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-ne v2, v5, :cond_2

    .line 71
    .line 72
    move v2, v5

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    move v2, v4

    .line 75
    :goto_1
    const-string v3, "vendor.hisi.hisi-ext-codec-non-ref-p-frames-supported"

    .line 76
    .line 77
    invoke-virtual {v1, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    if-eqz v6, :cond_3

    .line 82
    .line 83
    invoke-virtual {v1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-ne v1, v5, :cond_3

    .line 88
    .line 89
    move v4, v5

    .line 90
    :cond_3
    new-instance v1, Landroid/os/Bundle;

    .line 91
    .line 92
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 93
    .line 94
    .line 95
    if-eqz v4, :cond_4

    .line 96
    .line 97
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isSvcEnabled()Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-eqz v3, :cond_4

    .line 102
    .line 103
    iget v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->svcRealLayerNum:I

    .line 104
    .line 105
    if-gt v3, v5, :cond_4

    .line 106
    .line 107
    const-string v3, "vendor.hisi.hisi-ext-codec-non-ref-p-frames"

    .line 108
    .line 109
    invoke-virtual {v1, v3, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    const/4 v3, 0x2

    .line 113
    iput v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->svcRealLayerNum:I

    .line 114
    .line 115
    const-string v3, "support Non Ref PFrame."

    .line 116
    .line 117
    invoke-static {v0, v3}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_4
    if-eqz v2, :cond_5

    .line 121
    .line 122
    const-string v3, "vendor.hisi.hisi-ext-codec-max-qp"

    .line 123
    .line 124
    invoke-virtual {v1, v3, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 125
    .line 126
    .line 127
    const-string p1, "vendor.hisi.hisi-ext-codec-min-qp"

    .line 128
    .line 129
    invoke-virtual {v1, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 130
    .line 131
    .line 132
    :cond_5
    if-nez v4, :cond_6

    .line 133
    .line 134
    if-eqz v2, :cond_7

    .line 135
    .line 136
    :cond_6
    :try_start_1
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 137
    .line 138
    invoke-interface {p0, v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->setParameters(Landroid/os/Bundle;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :catch_1
    move-exception p0

    .line 143
    const-string p1, "setExtCodecForHisi failed"

    .line 144
    .line 145
    invoke-static {v0, p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 146
    .line 147
    .line 148
    :cond_7
    :goto_2
    return-void
.end method

.method private setIPFrameMinMaxQP(Landroid/media/MediaFormat;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 8
    .line 9
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minIQp:I

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "video-qp-i-min"

    .line 16
    .line 17
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 21
    .line 22
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxIQp:I

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "video-qp-i-max"

    .line 29
    .line 30
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 34
    .line 35
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "video-qp-p-min"

    .line 42
    .line 43
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 47
    .line 48
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 49
    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "video-qp-p-max"

    .line 55
    .line 56
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 60
    .line 61
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minIQp:I

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "vendor.qti-ext-enc-qp-range.qp-i-min"

    .line 68
    .line 69
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 73
    .line 74
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxIQp:I

    .line 75
    .line 76
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "vendor.qti-ext-enc-qp-range.qp-i-max"

    .line 81
    .line 82
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 86
    .line 87
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 88
    .line 89
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-string v1, "vendor.qti-ext-enc-qp-range.qp-p-min"

    .line 94
    .line 95
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 99
    .line 100
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 101
    .line 102
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "vendor.qti-ext-enc-qp-range.qp-p-max"

    .line 107
    .line 108
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 112
    .line 113
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minIQp:I

    .line 114
    .line 115
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    const-string v1, "vendor.rtc-ext-enc-qp-range.qp-i-min"

    .line 120
    .line 121
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 125
    .line 126
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxIQp:I

    .line 127
    .line 128
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const-string v1, "vendor.rtc-ext-enc-qp-range.qp-i-max"

    .line 133
    .line 134
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 138
    .line 139
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 140
    .line 141
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v1, "vendor.rtc-ext-enc-qp-range.qp-p-min"

    .line 146
    .line 147
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 151
    .line 152
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 153
    .line 154
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    const-string v1, "vendor.rtc-ext-enc-qp-range.qp-p-max"

    .line 159
    .line 160
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 161
    .line 162
    .line 163
    const/4 v0, 0x1

    .line 164
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    const-string v1, "vendor.rtc-ext-enc-low-latency.enable"

    .line 169
    .line 170
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    const-string v1, "exynos"

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-eqz v0, :cond_1

    .line 186
    .line 187
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 188
    .line 189
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minIQp:I

    .line 190
    .line 191
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    const-string v1, "vendor.sec-ext-enc-qp-range.I-minQP"

    .line 196
    .line 197
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 201
    .line 202
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxIQp:I

    .line 203
    .line 204
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    const-string v1, "vendor.sec-ext-enc-qp-range.I-maxQP"

    .line 209
    .line 210
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 214
    .line 215
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 216
    .line 217
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    const-string v1, "vendor.sec-ext-enc-qp-range.P-maxQP"

    .line 222
    .line 223
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 227
    .line 228
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 229
    .line 230
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    const-string v1, "vendor.sec-ext-enc-qp-range.P-minQP"

    .line 235
    .line 236
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 237
    .line 238
    .line 239
    :cond_1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    const-string v1, "mtk"

    .line 246
    .line 247
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_2

    .line 252
    .line 253
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 254
    .line 255
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 256
    .line 257
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    const-string v1, "vendor.mtk.venc.dynamic.qpbound.min"

    .line 262
    .line 263
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 264
    .line 265
    .line 266
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 267
    .line 268
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 269
    .line 270
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    const-string v1, "vendor.mtk.venc.dynamic.qpbound.max"

    .line 275
    .line 276
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 277
    .line 278
    .line 279
    :cond_2
    return-void
.end method

.method private setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "HardwareVideoEncoder"

    .line 16
    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/util/Map$Entry;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/String;

    .line 42
    .line 43
    invoke-direct {p0, v3}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isNumeric(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    const-string v4, "the encoder params "

    .line 48
    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    check-cast p3, Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p1, p3, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    check-cast p3, Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string p3, " is coverd by vpaas with value:"

    .line 85
    .line 86
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    check-cast p3, Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 106
    .line 107
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    iget-object v3, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 112
    .line 113
    invoke-virtual {v3, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    check-cast v3, Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-lez v3, :cond_2

    .line 127
    .line 128
    new-instance v3, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    check-cast v4, Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v4, " set by vpaas is invalid with value:"

    .line 143
    .line 144
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    check-cast v1, Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v1, ",skip it"

    .line 157
    .line 158
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {p0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string p1, " is disabled by vpaas,skip it"

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    const-string v0, "encoder int params has been set with Key:"

    .line 200
    .line 201
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v0, " Value:"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    invoke-virtual {p1, p2, p0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 227
    .line 228
    .line 229
    return-void
.end method

.method private setProfileForLive(Landroid/media/MediaFormat;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getCodecInfo()Landroid/media/MediaCodecInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getProfile()Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v2, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 20
    .line 21
    const-string v3, "level"

    .line 22
    .line 23
    const-string v4, "profile"

    .line 24
    .line 25
    const-string v5, ""

    .line 26
    .line 27
    const/4 v6, 0x1

    .line 28
    const-string v7, "HardwareVideoEncoder"

    .line 29
    .line 30
    if-ne v0, v2, :cond_3

    .line 31
    .line 32
    :try_start_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecProfile;->toSystemProfile()I

    .line 33
    .line 34
    .line 35
    move-result v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception p0

    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {v7, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v1, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p0, p0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 62
    .line 63
    array-length v0, p0

    .line 64
    const/4 v1, 0x0

    .line 65
    :goto_1
    if-ge v1, v0, :cond_1

    .line 66
    .line 67
    aget-object v2, p0, v1

    .line 68
    .line 69
    iget v5, v2, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 70
    .line 71
    if-ne v6, v5, :cond_0

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    const/4 v2, 0x0

    .line 78
    :goto_2
    if-eqz v2, :cond_2

    .line 79
    .line 80
    iget p0, v2, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 81
    .line 82
    invoke-virtual {p1, v4, p0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    iget p0, v2, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    .line 86
    .line 87
    invoke-virtual {p1, v3, p0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    goto :goto_4

    .line 91
    :cond_2
    const-string p0, "not set profile"

    .line 92
    .line 93
    invoke-static {v7, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    goto :goto_4

    .line 97
    :cond_3
    sget-object v1, Lcom/bytedance/realx/video/RXVideoCodecStandard;->ByteVC1:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 98
    .line 99
    if-ne v0, v1, :cond_4

    .line 100
    .line 101
    :try_start_1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecProfile;->toSystemProfile()I

    .line 102
    .line 103
    .line 104
    move-result v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 105
    goto :goto_3

    .line 106
    :catch_1
    move-exception p0

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {v7, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :goto_3
    invoke-virtual {p1, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 123
    .line 124
    .line 125
    const/16 p0, 0x100

    .line 126
    .line 127
    invoke-virtual {p1, v3, p0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 128
    .line 129
    .line 130
    :cond_4
    :goto_4
    return-void
.end method

.method private setProfileForRTC(Landroid/media/MediaFormat;)V
    .locals 12

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    new-instance v5, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v6, "close setting profile:"

    .line 21
    .line 22
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 26
    .line 27
    iget-boolean v6, v6, Lcom/bytedance/realx/video/VideoEncoder$Settings;->closeSetProfile:Z

    .line 28
    .line 29
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const-string v6, "HardwareVideoEncoder"

    .line 37
    .line 38
    invoke-static {v6, v5}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v5, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 42
    .line 43
    invoke-virtual {v5}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    iget-object v7, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 48
    .line 49
    iget-boolean v7, v7, Lcom/bytedance/realx/video/VideoEncoder$Settings;->closeSetProfile:Z

    .line 50
    .line 51
    if-nez v7, :cond_7

    .line 52
    .line 53
    sget-object v7, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 54
    .line 55
    const-string v8, "Unknown profile level id: "

    .line 56
    .line 57
    const/4 v9, 0x2

    .line 58
    const-string v10, "level"

    .line 59
    .line 60
    const-string v11, "profile"

    .line 61
    .line 62
    if-ne v5, v7, :cond_2

    .line 63
    .line 64
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getProfile()Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sget-object v5, Lcom/bytedance/realx/video/HardwareVideoEncoder$2;->$SwitchMap$com$bytedance$realx$video$RXVideoCodecProfile:[I

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    aget v5, v5, v7

    .line 77
    .line 78
    if-eq v5, v3, :cond_1

    .line 79
    .line 80
    if-eq v5, v9, :cond_1

    .line 81
    .line 82
    const/4 v2, 0x3

    .line 83
    if-eq v5, v2, :cond_0

    .line 84
    .line 85
    const/4 v2, 0x4

    .line 86
    if-eq v5, v2, :cond_0

    .line 87
    .line 88
    const/4 v2, 0x5

    .line 89
    if-eq v5, v2, :cond_0

    .line 90
    .line 91
    new-instance v2, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, "default to baseline profile"

    .line 100
    .line 101
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-static {v6, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-direct {p0, p1, v11, v4}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 112
    .line 113
    .line 114
    invoke-direct {p0, p1, v10, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_0
    const-string v1, "setting baseline profile "

    .line 119
    .line 120
    invoke-static {v6, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-direct {p0, p1, v11, v4}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 124
    .line 125
    .line 126
    invoke-direct {p0, p1, v10, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_1
    const-string v1, "setting high profile "

    .line 131
    .line 132
    invoke-static {v6, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-direct {p0, p1, v11, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 136
    .line 137
    .line 138
    invoke-direct {p0, p1, v10, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_2
    sget-object v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->ByteVC1:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 143
    .line 144
    if-ne v5, v0, :cond_6

    .line 145
    .line 146
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getProfile()Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    sget-object v3, Lcom/bytedance/realx/video/HardwareVideoEncoder$2;->$SwitchMap$com$bytedance$realx$video$RXVideoCodecProfile:[I

    .line 153
    .line 154
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    aget v3, v3, v5

    .line 159
    .line 160
    const/4 v5, 0x6

    .line 161
    if-eq v3, v5, :cond_5

    .line 162
    .line 163
    const/4 v5, 0x7

    .line 164
    if-eq v3, v5, :cond_4

    .line 165
    .line 166
    if-eq v3, v1, :cond_3

    .line 167
    .line 168
    new-instance v1, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v0, "default to Main profile"

    .line 177
    .line 178
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {v6, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-direct {p0, p1, v11, v4}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 189
    .line 190
    .line 191
    invoke-direct {p0, p1, v10, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_3
    const/16 v0, 0x1000

    .line 196
    .line 197
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-direct {p0, p1, v11, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 202
    .line 203
    .line 204
    invoke-direct {p0, p1, v10, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_4
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-direct {p0, p1, v11, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 213
    .line 214
    .line 215
    invoke-direct {p0, p1, v10, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_5
    invoke-direct {p0, p1, v11, v4}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 220
    .line 221
    .line 222
    invoke-direct {p0, p1, v10, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :cond_6
    sget-object v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 227
    .line 228
    if-ne v5, v0, :cond_7

    .line 229
    .line 230
    invoke-direct {p0, p1, v11, v4}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 231
    .line 232
    .line 233
    :cond_7
    return-void
.end method

.method private setSVCNumber(Landroid/media/MediaFormat;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x19

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isSvcEnabled()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "android.generic."

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 21
    .line 22
    iget v1, v1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->temporalLayerNum:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "ts-schema"

    .line 32
    .line 33
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setStringParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private setStringParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "HardwareVideoEncoder"

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/util/Map$Entry;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    check-cast p3, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    const-string v0, "the encoder params "

    .line 48
    .line 49
    if-lez p3, :cond_1

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    check-cast p3, Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, p3, v3}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    new-instance p1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    check-cast p3, Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p3, " is coverd by vpaas with value:"

    .line 81
    .line 82
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    check-cast p3, Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    check-cast p3, Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string p3, " is disabled by vpaas,skip it"

    .line 117
    .line 118
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :goto_0
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->privateParams:Ljava/util/HashMap;

    .line 129
    .line 130
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v0, "encoder string params has been set with Key:"

    .line 137
    .line 138
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v0, " Value:"

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method private shouldForceKeyFrame(J)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->forcedKeyFrameNs:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    if-lez v2, :cond_0

    .line 13
    .line 14
    iget-wide v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->lastKeyFrameNs:J

    .line 15
    .line 16
    add-long/2addr v2, v0

    .line 17
    cmp-long p0, p1, v2

    .line 18
    .line 19
    if-lez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private updateBitrate(I)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iput p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrate:I

    .line 7
    .line 8
    :try_start_0
    new-instance v0, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "video-bitrate"

    .line 14
    .line 15
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 19
    .line 20
    invoke-interface {p0, v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->setParameters(Landroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    return-object p0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    const-string p1, "HardwareVideoEncoder"

    .line 28
    .line 29
    const-string v0, "updateBitrate failed"

    .line 30
    .line 31
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 35
    .line 36
    return-object p0
.end method


# virtual methods
.method public deliverEncodedImage()V
    .locals 7

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    const-string v1, "should not be here: index:"

    .line 4
    .line 5
    const-string v2, "output format changed: "

    .line 6
    .line 7
    :try_start_0
    new-instance v3, Landroid/media/MediaCodec$BufferInfo;

    .line 8
    .line 9
    invoke-direct {v3}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-boolean v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->releaseAsync:Z

    .line 13
    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    const-wide/32 v4, 0x9c40

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-wide/32 v4, 0x186a0

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 24
    .line 25
    invoke-interface {v6, v3, v4, v5}, Lcom/bytedance/realx/video/MediaCodecWrapper;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    const/4 v5, -0x2

    .line 30
    if-ne v4, v5, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 33
    .line 34
    invoke-interface {p0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputFormat()Landroid/media/MediaFormat;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    move-exception p0

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    const/4 v2, -0x1

    .line 61
    if-ne v4, v2, :cond_2

    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    const/4 v2, -0x3

    .line 65
    if-ne v4, v2, :cond_3

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    if-gez v4, :cond_4

    .line 69
    .line 70
    new-instance p0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    :goto_1
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 87
    .line 88
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    aget-object v1, v1, v4

    .line 93
    .line 94
    invoke-direct {p0, v4, v3, v1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->drainOutputData(ILandroid/media/MediaCodec$BufferInfo;Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :goto_2
    const-string v1, "deliverOutput failed"

    .line 99
    .line 100
    invoke-static {v0, v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public encode(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Z)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "HardwareVideoEncoder"

    .line 7
    .line 8
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->clearGLES2Error(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->UNINITIALIZED:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->callbackLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iget-boolean v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isError:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-object p0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->MEMORY:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    instance-of v1, v0, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isTextureBuffer:Ljava/lang/Boolean;

    .line 45
    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eq v2, v1, :cond_4

    .line 53
    .line 54
    :cond_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iput-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isTextureBuffer:Ljava/lang/Boolean;

    .line 59
    .line 60
    const-string v2, "HardwareVideoEncoder"

    .line 61
    .line 62
    new-instance v3, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v4, "isTextureBuffer: "

    .line 65
    .line 66
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v4, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isTextureBuffer:Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-static {v2, v3}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getWidth()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getHeight()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-direct {p0, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isForceUseSurfaceInput(I)Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->canUseSurface()Z

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    const/4 v6, 0x1

    .line 98
    const/4 v7, 0x0

    .line 99
    if-eqz v5, :cond_6

    .line 100
    .line 101
    if-nez v1, :cond_5

    .line 102
    .line 103
    if-eqz v4, :cond_6

    .line 104
    .line 105
    :cond_5
    move v4, v6

    .line 106
    goto :goto_0

    .line 107
    :cond_6
    move v4, v7

    .line 108
    :goto_0
    if-eqz v4, :cond_8

    .line 109
    .line 110
    if-eqz v1, :cond_8

    .line 111
    .line 112
    move-object v1, v0

    .line 113
    check-cast v1, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->getEGLContext()Landroid/opengl/EGLContext;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    new-instance v5, Lcom/bytedance/realx/video/EglBase14$Context;

    .line 120
    .line 121
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    invoke-direct {v5, v1, v8}, Lcom/bytedance/realx/video/EglBase14$Context;-><init>(Landroid/opengl/EGLContext;I)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    .line 129
    .line 130
    if-eqz v1, :cond_7

    .line 131
    .line 132
    invoke-virtual {v5}, Lcom/bytedance/realx/video/EglBase14$Context;->getNativeEglContext()J

    .line 133
    .line 134
    .line 135
    move-result-wide v8

    .line 136
    iget-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    .line 137
    .line 138
    invoke-virtual {v1}, Lcom/bytedance/realx/video/EglBase14$Context;->getNativeEglContext()J

    .line 139
    .line 140
    .line 141
    move-result-wide v10

    .line 142
    cmp-long v1, v8, v10

    .line 143
    .line 144
    if-eqz v1, :cond_8

    .line 145
    .line 146
    :cond_7
    iput-object v5, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_8
    move v6, v7

    .line 150
    :goto_1
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 151
    .line 152
    .line 153
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 154
    .line 155
    if-eq v4, v0, :cond_9

    .line 156
    .line 157
    invoke-direct {p0, v2, v3, v4}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->resetCodec(IIZ)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    sget-object v1, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 162
    .line 163
    if-eq v0, v1, :cond_a

    .line 164
    .line 165
    return-object v0

    .line 166
    :cond_9
    move v7, v6

    .line 167
    :cond_a
    if-eqz v7, :cond_c

    .line 168
    .line 169
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 170
    .line 171
    if-eqz v0, :cond_c

    .line 172
    .line 173
    invoke-static {}, Lcom/bytedance/realx/RXVideoSurfaceController;->getInstance()Lcom/bytedance/realx/RXVideoSurfaceController;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lcom/bytedance/realx/RXVideoSurfaceController;->usePassSurfaceMode()Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_c

    .line 182
    .line 183
    const-string v0, "HardwareVideoEncoder"

    .line 184
    .line 185
    const-string v1, "egl env changed, create new shared context from the new videoframe egl context"

    .line 186
    .line 187
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->releaseFrameDrawer()V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 194
    .line 195
    if-eqz v0, :cond_b

    .line 196
    .line 197
    invoke-virtual {v0}, Lcom/bytedance/realx/video/EglBase14;->release()V

    .line 198
    .line 199
    .line 200
    const/4 v0, 0x0

    .line 201
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 202
    .line 203
    :cond_b
    :try_start_1
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    sget-object v1, Lcom/bytedance/realx/video/EglBase$Config;->CONFIG_RECORDABLE:Lcom/bytedance/realx/video/EglBase$Config;

    .line 208
    .line 209
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/EglBase;->getEGLConfig(ILcom/bytedance/realx/video/EglBase$Config;)[I

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    new-instance v1, Lcom/bytedance/realx/video/EglBase14;

    .line 214
    .line 215
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    .line 216
    .line 217
    invoke-direct {v1, v2, v0}, Lcom/bytedance/realx/video/EglBase14;-><init>(Lcom/bytedance/realx/video/EglBase14$Context;[I)V

    .line 218
    .line 219
    .line 220
    iput-object v1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 221
    .line 222
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 223
    .line 224
    invoke-virtual {v1, v0}, Lcom/bytedance/realx/video/EglBase14;->createSurface(Landroid/view/Surface;)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 228
    .line 229
    invoke-virtual {v0}, Lcom/bytedance/realx/video/EglBase14;->makeCurrent()V

    .line 230
    .line 231
    .line 232
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->initFrameDrawer()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 233
    .line 234
    .line 235
    goto :goto_2

    .line 236
    :catch_0
    move-exception p0

    .line 237
    const-string p1, "HardwareVideoEncoder"

    .line 238
    .line 239
    const-string p2, "egl failed, fallback software:"

    .line 240
    .line 241
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 242
    .line 243
    .line 244
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 245
    .line 246
    return-object p0

    .line 247
    :cond_c
    :goto_2
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->resetCodecWhenBitrateChange()V

    .line 248
    .line 249
    .line 250
    if-eqz p2, :cond_d

    .line 251
    .line 252
    const-string v0, "HardwareVideoEncoder"

    .line 253
    .line 254
    const-string v1, "Request key frame"

    .line 255
    .line 256
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    :cond_d
    if-nez p2, :cond_e

    .line 260
    .line 261
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getTimestampNs()J

    .line 262
    .line 263
    .line 264
    move-result-wide v0

    .line 265
    invoke-direct {p0, v0, v1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->shouldForceKeyFrame(J)Z

    .line 266
    .line 267
    .line 268
    move-result p2

    .line 269
    if-eqz p2, :cond_f

    .line 270
    .line 271
    :cond_e
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getTimestampNs()J

    .line 272
    .line 273
    .line 274
    move-result-wide v0

    .line 275
    invoke-direct {p0, v0, v1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->requestKeyFrame(J)V

    .line 276
    .line 277
    .line 278
    :cond_f
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isBFrameEnabled()Z

    .line 279
    .line 280
    .line 281
    move-result p2

    .line 282
    if-eqz p2, :cond_10

    .line 283
    .line 284
    iget-object p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->dtsQueue:Ljava/util/Deque;

    .line 285
    .line 286
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getTimestampUs()J

    .line 287
    .line 288
    .line 289
    move-result-wide v0

    .line 290
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-interface {p2, v0}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 295
    .line 296
    .line 297
    :cond_10
    iget-boolean p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 298
    .line 299
    if-eqz p2, :cond_12

    .line 300
    .line 301
    iget-boolean p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableGlClear:Z

    .line 302
    .line 303
    if-eqz p2, :cond_11

    .line 304
    .line 305
    iget-object p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 306
    .line 307
    if-eqz p2, :cond_11

    .line 308
    .line 309
    invoke-virtual {p2}, Lcom/bytedance/realx/video/EglBase14;->makeCurrent()V

    .line 310
    .line 311
    .line 312
    :cond_11
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeTextureBuffer(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    goto :goto_3

    .line 317
    :cond_12
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeByteBuffer(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    :goto_3
    sget-object p2, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 322
    .line 323
    if-eq p1, p2, :cond_13

    .line 324
    .line 325
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isBFrameEnabled()Z

    .line 326
    .line 327
    .line 328
    move-result p2

    .line 329
    if-eqz p2, :cond_13

    .line 330
    .line 331
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->dtsQueue:Ljava/util/Deque;

    .line 332
    .line 333
    invoke-interface {p0}, Ljava/util/Deque;->pollFirst()Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    :cond_13
    return-object p1

    .line 337
    :goto_4
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 338
    throw p0
.end method

.method public fillInputBuffer(Ljava/nio/ByteBuffer;Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->yuvFormat:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->fillBuffer(Ljava/nio/ByteBuffer;Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getScalingSettings()Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->automaticResizeOn:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    new-instance p0, Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;

    .line 21
    .line 22
    const/16 v0, 0x1d

    .line 23
    .line 24
    const/16 v1, 0x5f

    .line 25
    .line 26
    invoke-direct {p0, v0, v1}, Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;-><init>(II)V

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecDesc:Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-ne p0, v1, :cond_1

    .line 37
    .line 38
    new-instance p0, Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;

    .line 39
    .line 40
    const/16 v0, 0x18

    .line 41
    .line 42
    const/16 v1, 0x25

    .line 43
    .line 44
    invoke-direct {p0, v0, v1}, Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;-><init>(II)V

    .line 45
    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_1
    sget-object p0, Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;->OFF:Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;

    .line 49
    .line 50
    return-object p0
.end method

.method public initEncode(Lcom/bytedance/realx/video/VideoEncoder$Settings;Lcom/bytedance/realx/video/VideoEncoder$Callback;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->callback:Lcom/bytedance/realx/video/VideoEncoder$Callback;

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    iput-boolean p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->automaticResizeOn:Z

    .line 14
    .line 15
    iget v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->width:I

    .line 16
    .line 17
    iput v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->width:I

    .line 18
    .line 19
    iget v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->height:I

    .line 20
    .line 21
    iput v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->height:I

    .line 22
    .line 23
    iget-object v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->scaleMode:Lcom/bytedance/realx/video/VideoEncoder$ScaleMode;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->scaleMode:Lcom/bytedance/realx/video/VideoEncoder$ScaleMode;

    .line 26
    .line 27
    iget-object v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->bitrateMode:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->bitrateMode:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

    .line 30
    .line 31
    iget v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetBps:I

    .line 32
    .line 33
    iput v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrate:I

    .line 34
    .line 35
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iput-wide v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrateTimestamp:J

    .line 40
    .line 41
    iput-object p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 42
    .line 43
    iget-boolean v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->enableAsyncMode:Z

    .line 44
    .line 45
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useAsyncMode:Z

    .line 46
    .line 47
    invoke-static {}, Lcom/bytedance/realx/RXVideoSurfaceController;->getInstance()Lcom/bytedance/realx/RXVideoSurfaceController;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/bytedance/realx/RXVideoSurfaceController;->usePassSurfaceMode()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const-string v1, "HardwareVideoEncoder"

    .line 56
    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    const-string v0, "using pass surface mode"

    .line 60
    .line 61
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iput-boolean p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_0
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->canUseSurface()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iget-boolean v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->useSurfaceMode:Z

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    .line 78
    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    move v0, p2

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const/4 v0, 0x0

    .line 84
    :goto_0
    iput-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 85
    .line 86
    iget v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->width:I

    .line 87
    .line 88
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isForceUseSurfaceInput(I)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    iput-boolean p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 95
    .line 96
    :cond_2
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v0, "initEncode, codec name:"

    .line 99
    .line 100
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v0, ", with resolution:"

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->width:I

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v0, " x "

    .line 119
    .line 120
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->height:I

    .line 124
    .line 125
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v0, ". @ "

    .line 129
    .line 130
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetBps:I

    .line 134
    .line 135
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v0, "bps. Fps: "

    .line 139
    .line 140
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetFps:I

    .line 144
    .line 145
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string v0, " Use surface mode: "

    .line 149
    .line 150
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 154
    .line 155
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v0, " initUseSurfaceMode: "

    .line 159
    .line 160
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-boolean v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->useSurfaceMode:Z

    .line 164
    .line 165
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v0, " settings.bitrateMode:"

    .line 169
    .line 170
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget-object v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->bitrateMode:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

    .line 174
    .line 175
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string v0, " qp_min:"

    .line 179
    .line 180
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    iget v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    .line 184
    .line 185
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v0, " qp_max:"

    .line 189
    .line 190
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    iget v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 194
    .line 195
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    const-string v0, " qp_i_min:"

    .line 199
    .line 200
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    iget v0, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minIQp:I

    .line 204
    .line 205
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v0, " qp_i_max:"

    .line 209
    .line 210
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    iget p1, p1, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxIQp:I

    .line 214
    .line 215
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string p1, " useAsyncMode:"

    .line 219
    .line 220
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    iget-boolean p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useAsyncMode:Z

    .line 224
    .line 225
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-static {v1, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->initEncodeInternal()Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    return-object p0
.end method

.method public onError(Landroid/media/MediaCodec;Landroid/media/MediaCodec$CodecException;)V
    .locals 3

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "mediacodec error: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/media/MediaCodec$CodecException;->getDiagnosticInfo()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, " "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getRealCodec()Landroid/media/MediaCodec;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eq v0, p1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->callbackLock:Ljava/lang/Object;

    .line 48
    .line 49
    monitor-enter p1

    .line 50
    const/4 p2, 0x1

    .line 51
    :try_start_0
    iput-boolean p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->isError:Z

    .line 52
    .line 53
    monitor-exit p1

    .line 54
    return-void

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    throw p0

    .line 58
    :cond_1
    :goto_0
    const-string p0, "HardwareVideoEncoder"

    .line 59
    .line 60
    new-instance p1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v0, "onError not same codec "

    .line 63
    .line 64
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onInputBufferAvailable(Landroid/media/MediaCodec;I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getRealCodec()Landroid/media/MediaCodec;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eq v0, p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->callbackLock:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter p1

    .line 19
    :try_start_0
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->inputBuffers:Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p0, p2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    monitor-exit p1

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0

    .line 33
    :cond_1
    :goto_0
    const-string p0, "HardwareVideoEncoder"

    .line 34
    .line 35
    const-string p1, "onInputBufferAvailable not same codec"

    .line 36
    .line 37
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onOutputBufferAvailable(Landroid/media/MediaCodec;ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 2
    .line 3
    const-string v1, "HardwareVideoEncoder"

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getRealCodec()Landroid/media/MediaCodec;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eq v0, p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {p0, p2, p3, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->drainOutputData(ILandroid/media/MediaCodec$BufferInfo;Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catch_0
    move-exception p0

    .line 27
    const-string p1, "onOutputBufferAvailable failed"

    .line 28
    .line 29
    invoke-static {v1, p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    :goto_0
    const-string p0, "onOutputBufferAvailable not same codec"

    .line 34
    .line 35
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onOutputFormatChanged(Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 2
    .line 3
    const-string v1, "HardwareVideoEncoder"

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getRealCodec()Landroid/media/MediaCodec;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eq p0, p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p1, "output format changed: "

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    :goto_0
    const-string p0, "onOutputFormatChanged not same codec"

    .line 41
    .line 42
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public release()Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "hardware video encoder release start."

    .line 7
    .line 8
    const-string v1, "HardwareVideoEncoder"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 14
    .line 15
    iget-boolean v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useAsyncMode:Z

    .line 16
    .line 17
    const-string v3, "Media encoder release timeout"

    .line 18
    .line 19
    const-wide/16 v4, 0x1388

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    const/4 v7, 0x0

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    iput-boolean v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 26
    .line 27
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 28
    .line 29
    if-eqz v2, :cond_3

    .line 30
    .line 31
    iget-object v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncHandler:Landroid/os/Handler;

    .line 32
    .line 33
    new-instance v8, Lcom/bytedance/realx/video/c;

    .line 34
    .line 35
    invoke-direct {v8, p0, v2}, Lcom/bytedance/realx/video/c;-><init>(Lcom/bytedance/realx/video/HardwareVideoEncoder;Landroid/os/HandlerThread;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v6, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 42
    .line 43
    invoke-static {v2, v4, v5}, Lcom/bytedance/realx/base/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->TIMEOUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 53
    .line 54
    :cond_0
    iput-object v7, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 55
    .line 56
    iput-object v7, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->asyncHandler:Landroid/os/Handler;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 60
    .line 61
    if-eqz v2, :cond_3

    .line 62
    .line 63
    iput-boolean v6, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->running:Z

    .line 64
    .line 65
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 66
    .line 67
    invoke-static {v2, v4, v5}, Lcom/bytedance/realx/base/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_2

    .line 72
    .line 73
    invoke-static {v1, v3}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->TIMEOUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->shutdownException:Ljava/lang/Exception;

    .line 80
    .line 81
    if-eqz v2, :cond_3

    .line 82
    .line 83
    const-string v0, "Media encoder release exception"

    .line 84
    .line 85
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->shutdownException:Ljava/lang/Exception;

    .line 86
    .line 87
    invoke-static {v1, v0, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 91
    .line 92
    :cond_3
    :goto_0
    const-string v2, "Media encoder release ok."

    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-direct {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->releaseFrameDrawer()V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 101
    .line 102
    if-eqz v2, :cond_4

    .line 103
    .line 104
    invoke-virtual {v2}, Lcom/bytedance/realx/video/EglBase14;->release()V

    .line 105
    .line 106
    .line 107
    iput-object v7, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureEglBase:Lcom/bytedance/realx/video/EglBase14;

    .line 108
    .line 109
    :cond_4
    const-string v2, "textureEglBase release ok."

    .line 110
    .line 111
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 115
    .line 116
    if-eqz v2, :cond_5

    .line 117
    .line 118
    invoke-virtual {v2}, Landroid/view/Surface;->release()V

    .line 119
    .line 120
    .line 121
    iput-object v7, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 122
    .line 123
    :cond_5
    const-string v2, "textureInputSurface release ok."

    .line 124
    .line 125
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iput-object v7, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 129
    .line 130
    iput-object v7, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 131
    .line 132
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 135
    .line 136
    .line 137
    new-instance p0, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    const-string v2, "hardware video encoder release end."

    .line 140
    .line 141
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-object v0
.end method

.method public requestKeyFrame()Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 2

    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 35
    invoke-direct {p0, v0, v1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->requestKeyFrame(J)V

    .line 36
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    return-object p0
.end method

.method public setColorSpace(Landroid/media/MediaFormat;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 2
    .line 3
    const-string v1, "HardwareVideoEncoder"

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 8
    .line 9
    const-string v2, "OMX.hisi."

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 18
    .line 19
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->rangeId:I

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->yuvColorFormat:Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/16 v2, 0x13

    .line 30
    .line 31
    if-eq v0, v2, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->yuvColorFormat:Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/16 v2, 0x15

    .line 40
    .line 41
    if-ne v0, v2, :cond_1

    .line 42
    .line 43
    :cond_0
    const-string v0, "kirin chips skip setting MediaFormat COLOR_RANGE"

    .line 44
    .line 45
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->settings:Lcom/bytedance/realx/video/VideoEncoder$Settings;

    .line 50
    .line 51
    iget v0, v0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->rangeId:I

    .line 52
    .line 53
    const-string v2, "color-range"

    .line 54
    .line 55
    const/4 v3, 0x1

    .line 56
    if-ne v0, v3, :cond_2

    .line 57
    .line 58
    const-string v0, "setting MediaFormat COLOR_RANGE_FULL"

    .line 59
    .line 60
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const-string v0, "setting MediaFormat COLOR_RANGE_LIMITED"

    .line 72
    .line 73
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const/4 v0, 0x2

    .line 77
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 82
    .line 83
    .line 84
    :goto_0
    const/4 v0, 0x4

    .line 85
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "color-standard"

    .line 90
    .line 91
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 92
    .line 93
    .line 94
    const/4 v0, 0x3

    .line 95
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v1, "color-transfer"

    .line 100
    .line 101
    invoke-direct {p0, p1, v1, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public setPrivateParam(Ljava/lang/String;Ljava/lang/String;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "got android hardware encoder setPrivateParam with key:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " value:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "HardwareVideoEncoder"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v1, -0x1

    .line 36
    sparse-switch v0, :sswitch_data_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :sswitch_0
    const-string v0, "realx.native.render"

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v1, 0x4

    .line 50
    goto :goto_0

    .line 51
    :sswitch_1
    const-string v0, "realx.check.svc.layer"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/4 v1, 0x3

    .line 61
    goto :goto_0

    .line 62
    :sswitch_2
    const-string v0, "realx.release.async"

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_2

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const/4 v1, 0x2

    .line 72
    goto :goto_0

    .line 73
    :sswitch_3
    const-string v0, "realx.glclear"

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_3

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    const/4 v1, 0x1

    .line 83
    goto :goto_0

    .line 84
    :sswitch_4
    const-string v0, "realx.force.surface.input"

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_4

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    const/4 v1, 0x0

    .line 94
    :goto_0
    const-string v0, "true"

    .line 95
    .line 96
    packed-switch v1, :pswitch_data_0

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->vpassPrivateParams:Ljava/util/HashMap;

    .line 100
    .line 101
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :pswitch_0
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iput-boolean p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableNativeRender:Z

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :pswitch_1
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iput-boolean p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->checkSVCLayer:Z

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :pswitch_2
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    iput-boolean p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->releaseAsync:Z

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :pswitch_3
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    iput-boolean p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->enableGlClear:Z

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :pswitch_4
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->forceSurfaceInput:Ljava/lang/Boolean;

    .line 142
    .line 143
    :goto_1
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 144
    .line 145
    return-object p0

    .line 146
    nop

    .line 147
    :sswitch_data_0
    .sparse-switch
        -0x1acce7ce -> :sswitch_4
        -0x15d05ecc -> :sswitch_3
        0xde33581 -> :sswitch_2
        0x2e390b89 -> :sswitch_1
        0x3f711ef9 -> :sswitch_0
    .end sparse-switch

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setRateAllocation(II)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/bytedance/realx/video/HardwareVideoEncoder;->encodeThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->updateBitrate(I)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 7
    .line 8
    .line 9
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 10
    .line 11
    return-object p0
.end method
