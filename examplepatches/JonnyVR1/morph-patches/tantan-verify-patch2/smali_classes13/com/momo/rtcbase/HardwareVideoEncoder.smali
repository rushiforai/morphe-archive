.class Lcom/momo/rtcbase/HardwareVideoEncoder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoEncoder;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;
    }
.end annotation


# static fields
.field private static final DEQUEUE_OUTPUT_BUFFER_TIMEOUT_US:I = 0x186a0

.field private static final KEY_BITRATE_MODE:Ljava/lang/String; = "bitrate-mode"

.field private static final MAX_ENCODER_Q_SIZE:I = 0x2

.field private static final MAX_VIDEO_FRAMERATE:I = 0x1e

.field private static final MEDIA_CODEC_RELEASE_TIMEOUT_MS:I = 0x1388

.field private static final TAG:Ljava/lang/String; = "HardwareVideoEncoder"

.field private static VBR_DEVICE_BLACK_LISTS:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final VIDEO_AVC_LEVEL_3:I = 0x100

.field private static final VIDEO_AVC_PROFILE_HIGH:I = 0x8

.field private static final VIDEO_ControlRateConstant:I = 0x2


# instance fields
.field private adjustedBitrate:I

.field private automaticResizeOn:Z

.field private final bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

.field private bitrateMode:I

.field private callback:Lcom/momo/rtcbase/VideoEncoder$Callback;

.field private codec:Lcom/momo/rtcbase/MediaCodecWrapper;

.field private final codecName:Ljava/lang/String;

.field private codecSync:Ljava/lang/Object;

.field private final codecType:Lcom/momo/rtcbase/VideoCodecType;

.field private configBuffer:Ljava/nio/ByteBuffer;

.field private enableCQ:Z

.field private final encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

.field private final forcedKeyFrameNs:J

.field private height:I

.field private isNeedUpdateShareContext:Z

.field isUseVbr:Z

.field private final keyFrameIntervalSec:I

.field private lastKeyFrameNs:J

.field private final mediaCodecWrapperFactory:Lcom/momo/rtcbase/MediaCodecWrapperFactory;

.field private needresetCodec:Z

.field private final outputBuilders:Ljava/util/concurrent/BlockingDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingDeque<",
            "Lcom/momo/rtcbase/EncodedImage$Builder;",
            ">;"
        }
    .end annotation
.end field

.field private outputThread:Ljava/lang/Thread;

.field private final outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

.field private final params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private resetCodecInterval:I

.field private resetCodecPreTime:J

.field private volatile running:Z

.field private sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

.field private volatile shutdownException:Ljava/lang/Exception;

.field private startBitrate:I

.field private final surfaceColorFormat:Ljava/lang/Integer;

.field private textureDrawer:Lcom/momo/rtcbase/GlRectDrawer;

.field private textureEglBase:Lcom/momo/rtcbase/EglBase14;

.field private textureInputSurface:Landroid/view/Surface;

.field private useSurfaceMode:Z

.field private videoFrameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

.field private width:I

.field private final yuvColorFormat:Ljava/lang/Integer;

.field private final yuvFormat:Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "vivoX7"

    .line 2
    .line 3
    const-string v1, "OPPOR9sk"

    .line 4
    .line 5
    const-string v2, "Le "

    .line 6
    .line 7
    const-string v3, "LeX820"

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/momo/rtcbase/HardwareVideoEncoder;->VBR_DEVICE_BLACK_LISTS:Ljava/util/List;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/momo/rtcbase/VideoCodecType;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;IILcom/momo/rtcbase/BitrateAdjuster;Lcom/momo/rtcbase/EglBase14$Context;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momo/rtcbase/MediaCodecWrapperFactory;",
            "Ljava/lang/String;",
            "Lcom/momo/rtcbase/VideoCodecType;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;II",
            "Lcom/momo/rtcbase/BitrateAdjuster;",
            "Lcom/momo/rtcbase/EglBase14$Context;",
            ")V"
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/momo/rtcbase/GlRectDrawer;

    invoke-direct {v0}, Lcom/momo/rtcbase/GlRectDrawer;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureDrawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 31
    new-instance v0, Lcom/momo/rtcbase/VideoFrameDrawer;

    invoke-direct {v0}, Lcom/momo/rtcbase/VideoFrameDrawer;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->videoFrameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 32
    new-instance v0, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 33
    new-instance v0, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    invoke-direct {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 34
    new-instance v1, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    invoke-direct {v1}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;-><init>()V

    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    const-wide/16 v1, 0x0

    .line 35
    iput-wide v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecPreTime:J

    const/4 v1, 0x0

    .line 36
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 37
    iput v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    const/4 v2, 0x1

    .line 38
    iput-boolean v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isUseVbr:Z

    .line 39
    iput v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    .line 40
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->needresetCodec:Z

    .line 41
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->enableCQ:Z

    .line 42
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecSync:Ljava/lang/Object;

    .line 43
    iput-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->mediaCodecWrapperFactory:Lcom/momo/rtcbase/MediaCodecWrapperFactory;

    .line 44
    iput-object p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 46
    iput-object p4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->surfaceColorFormat:Ljava/lang/Integer;

    .line 47
    iput-object p5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->yuvColorFormat:Ljava/lang/Integer;

    .line 48
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;->valueOf(I)Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->yuvFormat:Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;

    .line 49
    iput-object p6, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->params:Ljava/util/Map;

    .line 50
    iput p7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->keyFrameIntervalSec:I

    .line 51
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long p2, p8

    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->forcedKeyFrameNs:J

    .line 52
    iput-object p9, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 53
    iput-object p10, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 54
    iput v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    .line 55
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->enableCQ:Z

    .line 56
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->detachThread()V

    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/momo/rtcbase/VideoCodecType;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;IILcom/momo/rtcbase/BitrateAdjuster;Lcom/momo/rtcbase/EglBase14$Context;II)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momo/rtcbase/MediaCodecWrapperFactory;",
            "Ljava/lang/String;",
            "Lcom/momo/rtcbase/VideoCodecType;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;II",
            "Lcom/momo/rtcbase/BitrateAdjuster;",
            "Lcom/momo/rtcbase/EglBase14$Context;",
            "II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/momo/rtcbase/GlRectDrawer;

    invoke-direct {v0}, Lcom/momo/rtcbase/GlRectDrawer;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureDrawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 3
    new-instance v0, Lcom/momo/rtcbase/VideoFrameDrawer;

    invoke-direct {v0}, Lcom/momo/rtcbase/VideoFrameDrawer;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->videoFrameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 4
    new-instance v0, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 5
    new-instance v0, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    invoke-direct {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;-><init>()V

    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 6
    new-instance v1, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    invoke-direct {v1}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;-><init>()V

    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    const-wide/16 v1, 0x0

    .line 7
    iput-wide v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecPreTime:J

    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 9
    iput v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    const/4 v2, 0x1

    .line 10
    iput-boolean v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isUseVbr:Z

    .line 11
    iput v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    .line 12
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->needresetCodec:Z

    .line 13
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->enableCQ:Z

    .line 14
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecSync:Ljava/lang/Object;

    .line 15
    iput-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->mediaCodecWrapperFactory:Lcom/momo/rtcbase/MediaCodecWrapperFactory;

    .line 16
    iput-object p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 17
    iput-object p3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 18
    iput-object p4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->surfaceColorFormat:Ljava/lang/Integer;

    .line 19
    iput-object p5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->yuvColorFormat:Ljava/lang/Integer;

    .line 20
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;->valueOf(I)Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->yuvFormat:Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;

    .line 21
    iput-object p6, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->params:Ljava/util/Map;

    .line 22
    iput p7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->keyFrameIntervalSec:I

    .line 23
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long p2, p8

    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->forcedKeyFrameNs:J

    .line 24
    iput-object p9, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 25
    iput-object p10, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 26
    iput p11, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    if-lez p12, :cond_0

    move v1, v2

    .line 27
    :cond_0
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->enableCQ:Z

    .line 28
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->detachThread()V

    return-void
.end method

.method public static synthetic access$000(Lcom/momo/rtcbase/HardwareVideoEncoder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->running:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/HardwareVideoEncoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseCodecOnOutputThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private canUseSurface()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->surfaceColorFormat:Ljava/lang/Integer;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private createOutputThread()Ljava/lang/Thread;
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/rtcbase/HardwareVideoEncoder$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/HardwareVideoEncoder$1;-><init>(Lcom/momo/rtcbase/HardwareVideoEncoder;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private encodeByteBuffer(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/VideoFrame$Buffer;I)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 13

    .line 1
    const-string v1, "HardwareVideoEncoder"

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    const-wide/16 v4, 0x1f4

    .line 13
    .line 14
    add-long/2addr v2, v4

    .line 15
    const-wide/16 v4, 0x3e8

    .line 16
    .line 17
    div-long v10, v2, v4

    .line 18
    .line 19
    :try_start_0
    iget-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 20
    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    invoke-interface {p1, v2, v3}, Lcom/momo/rtcbase/MediaCodecWrapper;->dequeueInputBuffer(J)I

    .line 24
    .line 25
    .line 26
    move-result v7
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    .line 27
    const/4 p1, -0x1

    .line 28
    if-ne v7, p1, :cond_0

    .line 29
    .line 30
    const-string p0, "Dropped frame, no input buffers available"

    .line 31
    .line 32
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    :try_start_1
    iget-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 39
    .line 40
    invoke-interface {p1}, Lcom/momo/rtcbase/MediaCodecWrapper;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    aget-object p1, p1, v7
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/momo/rtcbase/HardwareVideoEncoder;->fillInputBuffer(Ljava/nio/ByteBuffer;Lcom/momo/rtcbase/VideoFrame$Buffer;)V

    .line 47
    .line 48
    .line 49
    :try_start_2
    iget-object v6, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 50
    .line 51
    const/4 v8, 0x0

    .line 52
    const/4 v12, 0x0

    .line 53
    move/from16 v9, p3

    .line 54
    .line 55
    invoke-interface/range {v6 .. v12}, Lcom/momo/rtcbase/MediaCodecWrapper;->queueInputBuffer(IIIJI)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0

    .line 56
    .line 57
    .line 58
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 59
    .line 60
    return-object p0

    .line 61
    :catch_0
    move-exception v0

    .line 62
    move-object p0, v0

    .line 63
    const-string p1, "queueInputBuffer failed"

    .line 64
    .line 65
    invoke-static {v1, p1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 69
    .line 70
    return-object p0

    .line 71
    :catch_1
    move-exception v0

    .line 72
    move-object p0, v0

    .line 73
    const-string p1, "getInputBuffers failed"

    .line 74
    .line 75
    invoke-static {v1, p1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 79
    .line 80
    return-object p0

    .line 81
    :catch_2
    move-exception v0

    .line 82
    move-object p0, v0

    .line 83
    const-string p1, "dequeueInputBuffer failed"

    .line 84
    .line 85
    invoke-static {v1, p1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 89
    .line 90
    return-object p0
.end method

.method private encodeTextureBuffer(Lcom/momo/rtcbase/VideoFrame;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 7

    .line 1
    const-string v0, "encodeTexture failed"

    .line 2
    .line 3
    const-string v1, "HardwareVideoEncoder"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    const/16 v2, 0x4000

    .line 11
    .line 12
    :try_start_0
    invoke-static {v2}, Landroid/opengl/GLES20;->glClear(I)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Lcom/momo/rtcbase/VideoFrame;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    const/4 v6, 0x0

    .line 26
    invoke-direct {v2, v3, v6, v4, v5}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->videoFrameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 30
    .line 31
    iget-object v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureDrawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-virtual {v3, v2, v4, v5}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 40
    .line 41
    .line 42
    move-result-wide v3

    .line 43
    invoke-virtual {v2, v3, v4}, Lcom/momo/rtcbase/EglBase14;->swapBuffers(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 47
    .line 48
    return-object p0

    .line 49
    :catch_0
    move-exception p1

    .line 50
    goto :goto_0

    .line 51
    :catch_1
    move-exception p1

    .line 52
    goto :goto_1

    .line 53
    :goto_0
    invoke-static {v1, v0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 60
    .line 61
    return-object p0

    .line 62
    :goto_1
    invoke-static {v1, v0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 69
    .line 70
    return-object p0
.end method

.method private initEncodeInternal()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 10

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    const-string v1, "Unknown profile level id: "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, -0x1

    .line 11
    .line 12
    iput-wide v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->lastKeyFrameNs:J

    .line 13
    .line 14
    :try_start_0
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->mediaCodecWrapperFactory:Lcom/momo/rtcbase/MediaCodecWrapperFactory;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {v2, v3}, Lcom/momo/rtcbase/MediaCodecWrapperFactory;->createByCodecName(Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iput-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v3, "resetCodec initEncodeInternal startBitrate "

    .line 27
    .line 28
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->startBitrate:I

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v0, v2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->surfaceColorFormat:Ljava/lang/Integer;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->yuvColorFormat:Ljava/lang/Integer;

    .line 49
    .line 50
    :goto_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    const/4 v3, 0x0

    .line 55
    :try_start_1
    iget-object v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 56
    .line 57
    invoke-virtual {v4}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    iget v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->width:I

    .line 62
    .line 63
    iget v6, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->height:I

    .line 64
    .line 65
    invoke-static {v4, v5, v6}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iget-boolean v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isUseVbr:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 70
    .line 71
    iget-boolean v6, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->needresetCodec:Z

    .line 72
    .line 73
    const-string v7, "bitrate"

    .line 74
    .line 75
    if-nez v5, :cond_2

    .line 76
    .line 77
    if-eqz v6, :cond_1

    .line 78
    .line 79
    :try_start_2
    iget-object v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 80
    .line 81
    invoke-interface {v5}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    invoke-virtual {v4, v7, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :catch_0
    move-exception v1

    .line 90
    goto/16 :goto_5

    .line 91
    .line 92
    :cond_1
    iget v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->startBitrate:I

    .line 93
    .line 94
    int-to-double v5, v5

    .line 95
    const-wide v8, 0x3fe999999999999aL    # 0.8

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    mul-double/2addr v5, v8

    .line 101
    double-to-int v5, v5

    .line 102
    invoke-virtual {v4, v7, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_2
    if-eqz v6, :cond_3

    .line 107
    .line 108
    iget-object v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 109
    .line 110
    invoke-interface {v5}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    invoke-virtual {v4, v7, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    iget v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->startBitrate:I

    .line 119
    .line 120
    invoke-virtual {v4, v7, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 121
    .line 122
    .line 123
    :goto_1
    const-string v5, "color-format"

    .line 124
    .line 125
    invoke-virtual {v4, v5, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 126
    .line 127
    .line 128
    const-string v2, "frame-rate"

    .line 129
    .line 130
    iget-object v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 131
    .line 132
    invoke-interface {v5}, Lcom/momo/rtcbase/BitrateAdjuster;->getCodecConfigFramerate()I

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    invoke-virtual {v4, v2, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 137
    .line 138
    .line 139
    const-string v2, "i-frame-interval"

    .line 140
    .line 141
    iget v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->keyFrameIntervalSec:I

    .line 142
    .line 143
    invoke-virtual {v4, v2, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 144
    .line 145
    .line 146
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 147
    .line 148
    invoke-virtual {v2}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    const/4 v5, 0x1

    .line 153
    invoke-direct {p0, v2, v5}, Lcom/momo/rtcbase/HardwareVideoEncoder;->isEncodeSupportBitrateMode(Ljava/lang/String;I)Z

    .line 154
    .line 155
    .line 156
    move-result v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 157
    const-string v6, "zhengjijian"

    .line 158
    .line 159
    const-string v7, "bitrate-mode"

    .line 160
    .line 161
    if-eqz v2, :cond_4

    .line 162
    .line 163
    :try_start_3
    const-string v2, "MediaFormat BITRATE_MODE_VBR"

    .line 164
    .line 165
    invoke-static {v6, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v4, v7, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 169
    .line 170
    .line 171
    iput v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_4
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 175
    .line 176
    invoke-virtual {v2}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-direct {p0, v2, v3}, Lcom/momo/rtcbase/HardwareVideoEncoder;->isEncodeSupportBitrateMode(Ljava/lang/String;I)Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    if-eqz v2, :cond_5

    .line 185
    .line 186
    const-string v2, "MediaFormat BITRATE_MODE_CQ"

    .line 187
    .line 188
    invoke-static {v6, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v4, v7, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 192
    .line 193
    .line 194
    iput v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_5
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 198
    .line 199
    invoke-virtual {v2}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    const/4 v8, 0x2

    .line 204
    invoke-direct {p0, v2, v8}, Lcom/momo/rtcbase/HardwareVideoEncoder;->isEncodeSupportBitrateMode(Ljava/lang/String;I)Z

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    if-eqz v2, :cond_6

    .line 209
    .line 210
    const-string v2, "MediaFormat BITRATE_MODE_CBR"

    .line 211
    .line 212
    invoke-static {v6, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v4, v7, v8}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 216
    .line 217
    .line 218
    iput v8, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 219
    .line 220
    :cond_6
    :goto_2
    iget-boolean v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->enableCQ:Z

    .line 221
    .line 222
    if-eqz v2, :cond_7

    .line 223
    .line 224
    invoke-virtual {v4, v7, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 225
    .line 226
    .line 227
    iput v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 228
    .line 229
    :cond_7
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 230
    .line 231
    sget-object v6, Lcom/momo/rtcbase/VideoCodecType;->H264:Lcom/momo/rtcbase/VideoCodecType;

    .line 232
    .line 233
    if-ne v2, v6, :cond_c

    .line 234
    .line 235
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->params:Ljava/util/Map;

    .line 236
    .line 237
    const-string v6, "profile-level-id"

    .line 238
    .line 239
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    check-cast v2, Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 244
    .line 245
    const-string v6, "42e01f"

    .line 246
    .line 247
    if-nez v2, :cond_8

    .line 248
    .line 249
    move-object v2, v6

    .line 250
    :cond_8
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 251
    .line 252
    .line 253
    move-result v7

    .line 254
    const v8, 0x5bab3b7e

    .line 255
    .line 256
    .line 257
    if-eq v7, v8, :cond_a

    .line 258
    .line 259
    const v6, 0x5f19c386

    .line 260
    .line 261
    .line 262
    if-eq v7, v6, :cond_9

    .line 263
    .line 264
    goto :goto_3

    .line 265
    :cond_9
    const-string v6, "640c1f"

    .line 266
    .line 267
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v6

    .line 271
    if-eqz v6, :cond_b

    .line 272
    .line 273
    const-string v1, "profile"

    .line 274
    .line 275
    const/16 v2, 0x8

    .line 276
    .line 277
    invoke-virtual {v4, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 278
    .line 279
    .line 280
    const-string v1, "level"

    .line 281
    .line 282
    const/16 v2, 0x100

    .line 283
    .line 284
    invoke-virtual {v4, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 285
    .line 286
    .line 287
    goto :goto_4

    .line 288
    :cond_a
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result v6

    .line 292
    if-eqz v6, :cond_b

    .line 293
    .line 294
    goto :goto_4

    .line 295
    :cond_b
    :goto_3
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    :cond_c
    :goto_4
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 306
    .line 307
    const/4 v2, 0x0

    .line 308
    invoke-interface {v1, v4, v2, v2, v5}, Lcom/momo/rtcbase/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 309
    .line 310
    .line 311
    iget-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 312
    .line 313
    if-eqz v1, :cond_d

    .line 314
    .line 315
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 316
    .line 317
    if-eqz v1, :cond_d

    .line 318
    .line 319
    new-instance v1, Lcom/momo/rtcbase/EglBase14;

    .line 320
    .line 321
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 322
    .line 323
    sget-object v4, Lcom/momo/rtcbase/EglBase;->CONFIG_RECORDABLE:[I

    .line 324
    .line 325
    invoke-direct {v1, v2, v4}, Lcom/momo/rtcbase/EglBase14;-><init>(Lcom/momo/rtcbase/EglBase14$Context;[I)V

    .line 326
    .line 327
    .line 328
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 329
    .line 330
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 331
    .line 332
    invoke-interface {v1}, Lcom/momo/rtcbase/MediaCodecWrapper;->createInputSurface()Landroid/view/Surface;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 337
    .line 338
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 339
    .line 340
    invoke-virtual {v2, v1}, Lcom/momo/rtcbase/EglBase14;->createSurface(Landroid/view/Surface;)V

    .line 341
    .line 342
    .line 343
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 344
    .line 345
    invoke-virtual {v1}, Lcom/momo/rtcbase/EglBase14;->makeCurrent()V

    .line 346
    .line 347
    .line 348
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 349
    .line 350
    invoke-interface {v1}, Lcom/momo/rtcbase/MediaCodecWrapper;->start()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 351
    .line 352
    .line 353
    iput-boolean v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->running:Z

    .line 354
    .line 355
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 356
    .line 357
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->detachThread()V

    .line 358
    .line 359
    .line 360
    invoke-direct {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->createOutputThread()Ljava/lang/Thread;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 365
    .line 366
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 367
    .line 368
    .line 369
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 370
    .line 371
    return-object p0

    .line 372
    :cond_d
    :try_start_5
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 373
    .line 374
    .line 375
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 376
    .line 377
    return-object p0

    .line 378
    :goto_5
    const-string v2, "resetCodec initEncodeInternal failed"

    .line 379
    .line 380
    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 381
    .line 382
    .line 383
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 384
    .line 385
    .line 386
    iget-boolean v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->enableCQ:Z

    .line 387
    .line 388
    if-eqz v0, :cond_e

    .line 389
    .line 390
    iput-boolean v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->enableCQ:Z

    .line 391
    .line 392
    invoke-direct {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->initEncodeInternal_ex()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 393
    .line 394
    .line 395
    move-result-object p0

    .line 396
    return-object p0

    .line 397
    :cond_e
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 398
    .line 399
    return-object p0

    .line 400
    :catch_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 401
    .line 402
    const-string v2, "Cannot create media encoder "

    .line 403
    .line 404
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 408
    .line 409
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 420
    .line 421
    .line 422
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 423
    .line 424
    return-object p0
.end method

.method private initEncodeInternal_ex()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 9

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    const-string v1, "Unknown profile level id: "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, -0x1

    .line 11
    .line 12
    iput-wide v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->lastKeyFrameNs:J

    .line 13
    .line 14
    :try_start_0
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->mediaCodecWrapperFactory:Lcom/momo/rtcbase/MediaCodecWrapperFactory;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {v2, v3}, Lcom/momo/rtcbase/MediaCodecWrapperFactory;->createByCodecName(Ljava/lang/String;)Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iput-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v3, "resetCodec initEncodeInternal startBitrate "

    .line 27
    .line 28
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->startBitrate:I

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v0, v2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->surfaceColorFormat:Ljava/lang/Integer;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->yuvColorFormat:Ljava/lang/Integer;

    .line 49
    .line 50
    :goto_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    :try_start_1
    iget-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 55
    .line 56
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->width:I

    .line 61
    .line 62
    iget v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->height:I

    .line 63
    .line 64
    invoke-static {v3, v4, v5}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    iget-boolean v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isUseVbr:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 69
    .line 70
    iget-boolean v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->needresetCodec:Z

    .line 71
    .line 72
    const-string v6, "bitrate"

    .line 73
    .line 74
    if-nez v4, :cond_2

    .line 75
    .line 76
    if-eqz v5, :cond_1

    .line 77
    .line 78
    :try_start_2
    iget-object v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 79
    .line 80
    invoke-interface {v4}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    invoke-virtual {v3, v6, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :catch_0
    move-exception v1

    .line 89
    goto/16 :goto_5

    .line 90
    .line 91
    :cond_1
    iget v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->startBitrate:I

    .line 92
    .line 93
    int-to-double v4, v4

    .line 94
    const-wide v7, 0x3fe999999999999aL    # 0.8

    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    mul-double/2addr v4, v7

    .line 100
    double-to-int v4, v4

    .line 101
    invoke-virtual {v3, v6, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    if-eqz v5, :cond_3

    .line 106
    .line 107
    iget-object v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 108
    .line 109
    invoke-interface {v4}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    invoke-virtual {v3, v6, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    iget v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->startBitrate:I

    .line 118
    .line 119
    invoke-virtual {v3, v6, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 120
    .line 121
    .line 122
    :goto_1
    const-string v4, "color-format"

    .line 123
    .line 124
    invoke-virtual {v3, v4, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 125
    .line 126
    .line 127
    const-string v2, "frame-rate"

    .line 128
    .line 129
    iget-object v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 130
    .line 131
    invoke-interface {v4}, Lcom/momo/rtcbase/BitrateAdjuster;->getCodecConfigFramerate()I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    invoke-virtual {v3, v2, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 136
    .line 137
    .line 138
    const-string v2, "i-frame-interval"

    .line 139
    .line 140
    iget v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->keyFrameIntervalSec:I

    .line 141
    .line 142
    invoke-virtual {v3, v2, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 146
    .line 147
    invoke-virtual {v2}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    const/4 v4, 0x1

    .line 152
    invoke-direct {p0, v2, v4}, Lcom/momo/rtcbase/HardwareVideoEncoder;->isEncodeSupportBitrateMode(Ljava/lang/String;I)Z

    .line 153
    .line 154
    .line 155
    move-result v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 156
    const-string v5, "bitrate-mode"

    .line 157
    .line 158
    const-string v6, "zhengjijian"

    .line 159
    .line 160
    if-eqz v2, :cond_4

    .line 161
    .line 162
    :try_start_3
    const-string v2, "MediaFormat BITRATE_MODE_VBR"

    .line 163
    .line 164
    invoke-static {v6, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v3, v5, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 168
    .line 169
    .line 170
    iput v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_4
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 174
    .line 175
    invoke-virtual {v2}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    const/4 v7, 0x0

    .line 180
    invoke-direct {p0, v2, v7}, Lcom/momo/rtcbase/HardwareVideoEncoder;->isEncodeSupportBitrateMode(Ljava/lang/String;I)Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    if-eqz v2, :cond_5

    .line 185
    .line 186
    const-string v2, "MediaFormat BITRATE_MODE_CQ"

    .line 187
    .line 188
    invoke-static {v6, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v3, v5, v7}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 192
    .line 193
    .line 194
    iput v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_5
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 198
    .line 199
    invoke-virtual {v2}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    const/4 v7, 0x2

    .line 204
    invoke-direct {p0, v2, v7}, Lcom/momo/rtcbase/HardwareVideoEncoder;->isEncodeSupportBitrateMode(Ljava/lang/String;I)Z

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    if-eqz v2, :cond_6

    .line 209
    .line 210
    const-string v2, "MediaFormat BITRATE_MODE_CBR"

    .line 211
    .line 212
    invoke-static {v6, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v3, v5, v7}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 216
    .line 217
    .line 218
    iput v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 219
    .line 220
    :cond_6
    :goto_2
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 221
    .line 222
    sget-object v5, Lcom/momo/rtcbase/VideoCodecType;->H264:Lcom/momo/rtcbase/VideoCodecType;

    .line 223
    .line 224
    if-ne v2, v5, :cond_b

    .line 225
    .line 226
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->params:Ljava/util/Map;

    .line 227
    .line 228
    const-string v5, "profile-level-id"

    .line 229
    .line 230
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    check-cast v2, Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 235
    .line 236
    const-string v5, "42e01f"

    .line 237
    .line 238
    if-nez v2, :cond_7

    .line 239
    .line 240
    move-object v2, v5

    .line 241
    :cond_7
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 242
    .line 243
    .line 244
    move-result v6

    .line 245
    const v7, 0x5bab3b7e

    .line 246
    .line 247
    .line 248
    if-eq v6, v7, :cond_9

    .line 249
    .line 250
    const v5, 0x5f19c386

    .line 251
    .line 252
    .line 253
    if-eq v6, v5, :cond_8

    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_8
    const-string v5, "640c1f"

    .line 257
    .line 258
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    if-eqz v5, :cond_a

    .line 263
    .line 264
    const-string v1, "profile"

    .line 265
    .line 266
    const/16 v2, 0x8

    .line 267
    .line 268
    invoke-virtual {v3, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 269
    .line 270
    .line 271
    const-string v1, "level"

    .line 272
    .line 273
    const/16 v2, 0x100

    .line 274
    .line 275
    invoke-virtual {v3, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 276
    .line 277
    .line 278
    goto :goto_4

    .line 279
    :cond_9
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result v5

    .line 283
    if-eqz v5, :cond_a

    .line 284
    .line 285
    goto :goto_4

    .line 286
    :cond_a
    :goto_3
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    :cond_b
    :goto_4
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 297
    .line 298
    const/4 v2, 0x0

    .line 299
    invoke-interface {v1, v3, v2, v2, v4}, Lcom/momo/rtcbase/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 300
    .line 301
    .line 302
    iget-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 303
    .line 304
    if-eqz v1, :cond_c

    .line 305
    .line 306
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 307
    .line 308
    if-eqz v1, :cond_c

    .line 309
    .line 310
    new-instance v1, Lcom/momo/rtcbase/EglBase14;

    .line 311
    .line 312
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 313
    .line 314
    sget-object v3, Lcom/momo/rtcbase/EglBase;->CONFIG_RECORDABLE:[I

    .line 315
    .line 316
    invoke-direct {v1, v2, v3}, Lcom/momo/rtcbase/EglBase14;-><init>(Lcom/momo/rtcbase/EglBase14$Context;[I)V

    .line 317
    .line 318
    .line 319
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 320
    .line 321
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 322
    .line 323
    invoke-interface {v1}, Lcom/momo/rtcbase/MediaCodecWrapper;->createInputSurface()Landroid/view/Surface;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 328
    .line 329
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 330
    .line 331
    invoke-virtual {v2, v1}, Lcom/momo/rtcbase/EglBase14;->createSurface(Landroid/view/Surface;)V

    .line 332
    .line 333
    .line 334
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 335
    .line 336
    invoke-virtual {v1}, Lcom/momo/rtcbase/EglBase14;->makeCurrent()V

    .line 337
    .line 338
    .line 339
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 340
    .line 341
    invoke-interface {v1}, Lcom/momo/rtcbase/MediaCodecWrapper;->start()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 342
    .line 343
    .line 344
    iput-boolean v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->running:Z

    .line 345
    .line 346
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 347
    .line 348
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->detachThread()V

    .line 349
    .line 350
    .line 351
    invoke-direct {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->createOutputThread()Ljava/lang/Thread;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 356
    .line 357
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 358
    .line 359
    .line 360
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 361
    .line 362
    return-object p0

    .line 363
    :cond_c
    :try_start_5
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 364
    .line 365
    .line 366
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 367
    .line 368
    return-object p0

    .line 369
    :goto_5
    const-string v2, "resetCodec initEncodeInternal failed"

    .line 370
    .line 371
    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 372
    .line 373
    .line 374
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 375
    .line 376
    .line 377
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 378
    .line 379
    return-object p0

    .line 380
    :catch_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 381
    .line 382
    const-string v2, "Cannot create media encoder "

    .line 383
    .line 384
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecName:Ljava/lang/String;

    .line 388
    .line 389
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 400
    .line 401
    .line 402
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 403
    .line 404
    return-object p0
.end method

.method private isEncodeSupportBitrateMode(Ljava/lang/String;I)Z
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    move v1, p0

    .line 9
    :goto_0
    if-ge v1, v0, :cond_3

    .line 10
    .line 11
    invoke-static {v1}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_2

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    move v4, p0

    .line 31
    :goto_1
    array-length v5, v3

    .line 32
    if-ge v4, v5, :cond_2

    .line 33
    .line 34
    aget-object v5, v3, v4

    .line 35
    .line 36
    invoke-virtual {v5, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-eqz v5, :cond_1

    .line 41
    .line 42
    invoke-virtual {v2, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    if-eqz v5, :cond_1

    .line 51
    .line 52
    invoke-virtual {v5, p2}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0

    .line 57
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    return p0
.end method

.method private releaseCodecOnOutputThread()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "Releasing MediaCodec on output thread"

    .line 7
    .line 8
    const-string v1, "HardwareVideoEncoder"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

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
    const-string v2, "Media encoder stop failed"

    .line 21
    .line 22
    invoke-static {v1, v2, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

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
    const-string v2, "Media encoder release failed"

    .line 33
    .line 34
    invoke-static {v1, v2, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->shutdownException:Ljava/lang/Exception;

    .line 38
    .line 39
    :goto_1
    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    const-string p0, "Release on output thread done"

    .line 43
    .line 44
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private requestKeyFrame(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

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
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v1, v0}, Lcom/momo/rtcbase/MediaCodecWrapper;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :cond_0
    iput-wide p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->lastKeyFrameNs:J

    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    const-string p1, "HardwareVideoEncoder"

    .line 29
    .line 30
    const-string p2, "requestKeyFrame failed"

    .line 31
    .line 32
    invoke-static {p1, p2, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private resetCodec(IIZ)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecPreTime:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecPreTime:J

    .line 19
    .line 20
    :cond_0
    iget v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    .line 21
    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iget-wide v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecPreTime:J

    .line 29
    .line 30
    sub-long/2addr v0, v2

    .line 31
    iget v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    .line 32
    .line 33
    int-to-long v2, v2

    .line 34
    cmp-long v0, v0, v2

    .line 35
    .line 36
    if-gez v0, :cond_1

    .line 37
    .line 38
    iget-boolean v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    const p1, 0x186a0

    .line 43
    .line 44
    .line 45
    iput p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->adjustedBitrate:I

    .line 46
    .line 47
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    const-string v0, "HardwareVideoEncoder"

    .line 51
    .line 52
    new-instance v1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v2, "resetCodec begin frame ="

    .line 55
    .line 56
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 60
    .line 61
    invoke-interface {v2}, Lcom/momo/rtcbase/BitrateAdjuster;->getCodecConfigFramerate()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v2, "biterate="

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 74
    .line 75
    invoke-interface {v2}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, ";resetCodecInterval ="

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v2, ";viideoModem="

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 110
    .line 111
    .line 112
    move-result-wide v0

    .line 113
    iput-wide v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecPreTime:J

    .line 114
    .line 115
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecSync:Ljava/lang/Object;

    .line 116
    .line 117
    monitor-enter v0

    .line 118
    :try_start_0
    invoke-virtual {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 119
    .line 120
    .line 121
    iput p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->width:I

    .line 122
    .line 123
    iput p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->height:I

    .line 124
    .line 125
    iput-boolean p3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 126
    .line 127
    invoke-direct {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->initEncodeInternal()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    monitor-exit v0

    .line 132
    return-object p0

    .line 133
    :catchall_0
    move-exception p0

    .line 134
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    throw p0
.end method

.method private shouldForceKeyFrame(J)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->forcedKeyFrameNs:J

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
    iget-wide v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->lastKeyFrameNs:J

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

.method private updateBitrate()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 4

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    const-string v1, "resetCodec updateBitrate adjustedBitrate:"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 11
    .line 12
    invoke-interface {v2}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iput v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->adjustedBitrate:I

    .line 17
    .line 18
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Lcom/momo/rtcbase/HardwareVideoEncoder;->isVbrDeivceSupported(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    :try_start_0
    new-instance v2, Landroid/os/Bundle;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v3, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->adjustedBitrate:I

    .line 42
    .line 43
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, "adjustframeRate:"

    .line 47
    .line 48
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 52
    .line 53
    invoke-interface {v1}, Lcom/momo/rtcbase/BitrateAdjuster;->getCodecConfigFramerate()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    const-string v1, "video-bitrate"

    .line 68
    .line 69
    iget v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->adjustedBitrate:I

    .line 70
    .line 71
    invoke-virtual {v2, v1, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 75
    .line 76
    invoke-interface {p0, v2}, Lcom/momo/rtcbase/MediaCodecWrapper;->setParameters(Landroid/os/Bundle;)V

    .line 77
    .line 78
    .line 79
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    return-object p0

    .line 82
    :catch_0
    move-exception p0

    .line 83
    const-string v1, "updateBitrate failed"

    .line 84
    .line 85
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 86
    .line 87
    .line 88
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->ERROR:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 89
    .line 90
    return-object p0
.end method


# virtual methods
.method public deliverEncodedImage()V
    .locals 9

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    const-string v1, "Prepending config frame of size "

    .line 4
    .line 5
    const-string v2, "Config frame generated. Offset: "

    .line 6
    .line 7
    iget-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 8
    .line 9
    invoke-virtual {v3}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    new-instance v3, Landroid/media/MediaCodec$BufferInfo;

    .line 13
    .line 14
    invoke-direct {v3}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 18
    .line 19
    const-wide/32 v5, 0x186a0

    .line 20
    .line 21
    .line 22
    invoke-interface {v4, v3, v5, v6}, Lcom/momo/rtcbase/MediaCodecWrapper;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-gez v4, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 30
    .line 31
    invoke-interface {v5}, Lcom/momo/rtcbase/MediaCodecWrapper;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    aget-object v5, v5, v4

    .line 36
    .line 37
    iget v6, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 38
    .line 39
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 40
    .line 41
    .line 42
    iget v6, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 43
    .line 44
    iget v7, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 45
    .line 46
    add-int/2addr v6, v7

    .line 47
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 48
    .line 49
    .line 50
    iget v6, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 51
    .line 52
    and-int/lit8 v6, v6, 0x2

    .line 53
    .line 54
    const/4 v7, 0x0

    .line 55
    if-eqz v6, :cond_1

    .line 56
    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget v2, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v2, ". Size: "

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget v2, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget v1, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 85
    .line 86
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    goto/16 :goto_4

    .line 96
    .line 97
    :catch_0
    move-exception p0

    .line 98
    goto/16 :goto_5

    .line 99
    .line 100
    :cond_1
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 101
    .line 102
    iget v6, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 103
    .line 104
    invoke-interface {v2, v6}, Lcom/momo/rtcbase/BitrateAdjuster;->reportEncodedFrame(I)V

    .line 105
    .line 106
    .line 107
    iget v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->adjustedBitrate:I

    .line 108
    .line 109
    iget-object v6, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 110
    .line 111
    invoke-interface {v6}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    const/4 v8, 0x1

    .line 116
    if-eq v2, v6, :cond_3

    .line 117
    .line 118
    iget v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    .line 119
    .line 120
    if-nez v2, :cond_2

    .line 121
    .line 122
    invoke-direct {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->updateBitrate()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_2
    iput-boolean v8, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->needresetCodec:Z

    .line 127
    .line 128
    :cond_3
    :goto_0
    iget v2, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 129
    .line 130
    and-int/2addr v2, v8

    .line 131
    if-eqz v2, :cond_4

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_4
    move v8, v7

    .line 135
    :goto_1
    if-eqz v8, :cond_5

    .line 136
    .line 137
    const-string v2, "Sync frame generated"

    .line 138
    .line 139
    invoke-static {v0, v2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_5
    if-eqz v8, :cond_6

    .line 143
    .line 144
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 145
    .line 146
    sget-object v6, Lcom/momo/rtcbase/VideoCodecType;->H264:Lcom/momo/rtcbase/VideoCodecType;

    .line 147
    .line 148
    if-ne v2, v6, :cond_6

    .line 149
    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 156
    .line 157
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v1, " to output buffer with offset "

    .line 165
    .line 166
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    iget v1, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 170
    .line 171
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v1, ", size "

    .line 175
    .line 176
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget v1, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 180
    .line 181
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    iget v1, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 192
    .line 193
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 194
    .line 195
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    add-int/2addr v1, v2

    .line 200
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 205
    .line 206
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 207
    .line 208
    .line 209
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->configBuffer:Ljava/nio/ByteBuffer;

    .line 210
    .line 211
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 218
    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_6
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    :goto_2
    if-eqz v8, :cond_7

    .line 226
    .line 227
    sget-object v2, Lcom/momo/rtcbase/EncodedImage$FrameType;->VideoFrameKey:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 228
    .line 229
    goto :goto_3

    .line 230
    :cond_7
    sget-object v2, Lcom/momo/rtcbase/EncodedImage$FrameType;->VideoFrameDelta:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 231
    .line 232
    :goto_3
    iget-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 233
    .line 234
    invoke-interface {v3}, Ljava/util/concurrent/BlockingDeque;->poll()Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    check-cast v3, Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 239
    .line 240
    invoke-virtual {v3, v1}, Lcom/momo/rtcbase/EncodedImage$Builder;->setBuffer(Ljava/nio/ByteBuffer;)Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v1, v2}, Lcom/momo/rtcbase/EncodedImage$Builder;->setFrameType(Lcom/momo/rtcbase/EncodedImage$FrameType;)Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 245
    .line 246
    .line 247
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->callback:Lcom/momo/rtcbase/VideoEncoder$Callback;

    .line 248
    .line 249
    invoke-virtual {v3}, Lcom/momo/rtcbase/EncodedImage$Builder;->createEncodedImage()Lcom/momo/rtcbase/EncodedImage;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    new-instance v3, Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfo;

    .line 254
    .line 255
    invoke-direct {v3}, Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfo;-><init>()V

    .line 256
    .line 257
    .line 258
    invoke-interface {v1, v2, v3}, Lcom/momo/rtcbase/VideoEncoder$Callback;->onEncodedFrame(Lcom/momo/rtcbase/EncodedImage;Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfo;)V

    .line 259
    .line 260
    .line 261
    :goto_4
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 262
    .line 263
    invoke-interface {p0, v4, v7}, Lcom/momo/rtcbase/MediaCodecWrapper;->releaseOutputBuffer(IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :goto_5
    const-string v1, "deliverOutput failed"

    .line 268
    .line 269
    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 270
    .line 271
    .line 272
    return-void
.end method

.method public encode(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/VideoEncoder$EncodeInfo;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecSync:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    :try_start_0
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    monitor-exit v1

    .line 16
    return-object v0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :cond_0
    iget-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    if-nez v3, :cond_1

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    iput-boolean v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 28
    .line 29
    :cond_1
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    instance-of v3, v2, Lcom/momo/rtcbase/VideoFrame$TextureBuffer;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-interface {v5}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-interface {v6}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    iget-object v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureDrawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 52
    .line 53
    if-nez v7, :cond_2

    .line 54
    .line 55
    new-instance v7, Lcom/momo/rtcbase/GlRectDrawer;

    .line 56
    .line 57
    invoke-direct {v7}, Lcom/momo/rtcbase/GlRectDrawer;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureDrawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 61
    .line 62
    :cond_2
    iget-object v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->videoFrameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 63
    .line 64
    if-nez v7, :cond_3

    .line 65
    .line 66
    new-instance v7, Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 67
    .line 68
    invoke-direct {v7}, Lcom/momo/rtcbase/VideoFrameDrawer;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->videoFrameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 72
    .line 73
    :cond_3
    iget v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodecInterval:I

    .line 74
    .line 75
    const/4 v8, 0x0

    .line 76
    if-lez v7, :cond_4

    .line 77
    .line 78
    iget v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->adjustedBitrate:I

    .line 79
    .line 80
    iget-object v9, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 81
    .line 82
    invoke-interface {v9}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    if-ne v7, v9, :cond_5

    .line 87
    .line 88
    :cond_4
    iget-boolean v7, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 89
    .line 90
    if-eqz v7, :cond_7

    .line 91
    .line 92
    :cond_5
    invoke-direct {p0, v5, v6, v3}, Lcom/momo/rtcbase/HardwareVideoEncoder;->resetCodec(IIZ)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    sget-object v6, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 97
    .line 98
    if-eq v5, v6, :cond_6

    .line 99
    .line 100
    const-string v5, "HardwareVideoEncoder"

    .line 101
    .line 102
    const-string v6, "resetCodec fail"

    .line 103
    .line 104
    invoke-static {v5, v6}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_6
    iget-object v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 109
    .line 110
    invoke-interface {v5}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    iput v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->adjustedBitrate:I

    .line 115
    .line 116
    iput-boolean v8, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 117
    .line 118
    :cond_7
    :goto_0
    iget-object v5, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 119
    .line 120
    invoke-interface {v5}, Ljava/util/concurrent/BlockingDeque;->size()I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    const/4 v6, 0x2

    .line 125
    if-le v5, v6, :cond_8

    .line 126
    .line 127
    const-string p0, "HardwareVideoEncoder"

    .line 128
    .line 129
    const-string p1, "Dropped frame, encoder queue full"

    .line 130
    .line 131
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    monitor-exit v1

    .line 135
    return-object v0

    .line 136
    :cond_8
    iget-object p2, p2, Lcom/momo/rtcbase/VideoEncoder$EncodeInfo;->frameTypes:[Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 137
    .line 138
    array-length v0, p2

    .line 139
    move v5, v8

    .line 140
    :goto_1
    if-ge v8, v0, :cond_a

    .line 141
    .line 142
    aget-object v7, p2, v8

    .line 143
    .line 144
    sget-object v9, Lcom/momo/rtcbase/EncodedImage$FrameType;->VideoFrameKey:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 145
    .line 146
    if-ne v7, v9, :cond_9

    .line 147
    .line 148
    move v5, v4

    .line 149
    :cond_9
    add-int/lit8 v8, v8, 0x1

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_a
    if-nez v5, :cond_b

    .line 153
    .line 154
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 155
    .line 156
    .line 157
    move-result-wide v7

    .line 158
    invoke-direct {p0, v7, v8}, Lcom/momo/rtcbase/HardwareVideoEncoder;->shouldForceKeyFrame(J)Z

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    if-eqz p2, :cond_c

    .line 163
    .line 164
    :cond_b
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 165
    .line 166
    .line 167
    move-result-wide v7

    .line 168
    invoke-direct {p0, v7, v8}, Lcom/momo/rtcbase/HardwareVideoEncoder;->requestKeyFrame(J)V

    .line 169
    .line 170
    .line 171
    :cond_c
    invoke-interface {v2}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getHeight()I

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    invoke-interface {v2}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getWidth()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    mul-int/2addr p2, v0

    .line 180
    mul-int/lit8 p2, p2, 0x3

    .line 181
    .line 182
    div-int/2addr p2, v6

    .line 183
    invoke-static {}, Lcom/momo/rtcbase/EncodedImage;->builder()Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 188
    .line 189
    .line 190
    move-result-wide v5

    .line 191
    invoke-virtual {v0, v5, v6}, Lcom/momo/rtcbase/EncodedImage$Builder;->setCaptureTimeNs(J)Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0, v4}, Lcom/momo/rtcbase/EncodedImage$Builder;->setCompleteFrame(Z)Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    invoke-interface {v4}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getWidth()I

    .line 204
    .line 205
    .line 206
    move-result v4

    .line 207
    invoke-virtual {v0, v4}, Lcom/momo/rtcbase/EncodedImage$Builder;->setEncodedWidth(I)Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    invoke-interface {v4}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getHeight()I

    .line 216
    .line 217
    .line 218
    move-result v4

    .line 219
    invoke-virtual {v0, v4}, Lcom/momo/rtcbase/EncodedImage$Builder;->setEncodedHeight(I)Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getRotation()I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    invoke-virtual {v0, v4}, Lcom/momo/rtcbase/EncodedImage$Builder;->setRotation(I)Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget-object v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 232
    .line 233
    invoke-interface {v4, v0}, Ljava/util/concurrent/BlockingDeque;->offer(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    sget-object v0, Lcom/momo/rtcbase/VideoCodecStatus;->NO_OUTPUT:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 237
    .line 238
    iget-boolean v4, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 239
    .line 240
    if-eqz v4, :cond_d

    .line 241
    .line 242
    if-eqz v3, :cond_d

    .line 243
    .line 244
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeTextureBuffer(Lcom/momo/rtcbase/VideoFrame;)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    goto :goto_2

    .line 249
    :cond_d
    if-nez v3, :cond_e

    .line 250
    .line 251
    invoke-direct {p0, p1, v2, p2}, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeByteBuffer(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/VideoFrame$Buffer;I)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    :cond_e
    :goto_2
    sget-object p1, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 256
    .line 257
    if-eq v0, p1, :cond_f

    .line 258
    .line 259
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 260
    .line 261
    invoke-interface {p0}, Ljava/util/Deque;->pollLast()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    :cond_f
    monitor-exit v1

    .line 265
    return-object v0

    .line 266
    :goto_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    throw p0
.end method

.method public fillInputBuffer(Ljava/nio/ByteBuffer;Lcom/momo/rtcbase/VideoFrame$Buffer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->yuvFormat:Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/momo/rtcbase/HardwareVideoEncoder$YuvFormat;->fillBuffer(Ljava/nio/ByteBuffer;Lcom/momo/rtcbase/VideoFrame$Buffer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getImplementationName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "HWEncoder"

    .line 2
    .line 3
    return-object p0
.end method

.method public getScalingSettings()Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->automaticResizeOn:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecType:Lcom/momo/rtcbase/VideoCodecType;

    .line 11
    .line 12
    sget-object v0, Lcom/momo/rtcbase/VideoCodecType;->VP8:Lcom/momo/rtcbase/VideoCodecType;

    .line 13
    .line 14
    if-ne p0, v0, :cond_0

    .line 15
    .line 16
    new-instance p0, Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;

    .line 17
    .line 18
    const/16 v0, 0x1d

    .line 19
    .line 20
    const/16 v1, 0x5f

    .line 21
    .line 22
    invoke-direct {p0, v0, v1}, Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;-><init>(II)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object v0, Lcom/momo/rtcbase/VideoCodecType;->H264:Lcom/momo/rtcbase/VideoCodecType;

    .line 27
    .line 28
    if-ne p0, v0, :cond_1

    .line 29
    .line 30
    new-instance p0, Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;

    .line 31
    .line 32
    const/16 v0, 0x18

    .line 33
    .line 34
    const/16 v1, 0x25

    .line 35
    .line 36
    invoke-direct {p0, v0, v1}, Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;-><init>(II)V

    .line 37
    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_1
    sget-object p0, Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;->OFF:Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;

    .line 41
    .line 42
    return-object p0
.end method

.method public getVideoMode()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateMode:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initEncode(Lcom/momo/rtcbase/VideoEncoder$Settings;Lcom/momo/rtcbase/VideoEncoder$Callback;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->callback:Lcom/momo/rtcbase/VideoEncoder$Callback;

    .line 7
    .line 8
    iget-boolean p2, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->automaticResizeOn:Z

    .line 9
    .line 10
    iput-boolean p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->automaticResizeOn:Z

    .line 11
    .line 12
    iget p2, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->width:I

    .line 13
    .line 14
    iput p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->width:I

    .line 15
    .line 16
    iget p2, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->height:I

    .line 17
    .line 18
    iput p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->height:I

    .line 19
    .line 20
    iget-boolean p2, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->useVbr:Z

    .line 21
    .line 22
    iput-boolean p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isUseVbr:Z

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->canUseSurface()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iput-boolean p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 29
    .line 30
    iget p2, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->startBitrate:I

    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    iget v0, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->maxFramerate:I

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 39
    .line 40
    mul-int/lit16 p2, p2, 0x3e8

    .line 41
    .line 42
    invoke-interface {v1, p2, v0}, Lcom/momo/rtcbase/BitrateAdjuster;->setTargets(II)V

    .line 43
    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 47
    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    mul-int/lit16 p2, p2, 0x3e8

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const p2, 0xf4240

    .line 54
    .line 55
    .line 56
    :goto_0
    iget v1, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->maxFramerate:I

    .line 57
    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    const/16 v1, 0xf

    .line 62
    .line 63
    :goto_1
    invoke-interface {v0, p2, v1}, Lcom/momo/rtcbase/BitrateAdjuster;->setTargets(II)V

    .line 64
    .line 65
    .line 66
    :goto_2
    iget-object p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 67
    .line 68
    invoke-interface {p2}, Lcom/momo/rtcbase/BitrateAdjuster;->getAdjustedBitrateBps()I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    iput p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->adjustedBitrate:I

    .line 73
    .line 74
    iput p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->startBitrate:I

    .line 75
    .line 76
    const-string p2, "HardwareVideoEncoder"

    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v1, "initEncode: "

    .line 81
    .line 82
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->width:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v1, " x "

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->height:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v1, ". @ "

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    iget v1, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->startBitrate:I

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v1, "kbps. Fps: "

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget p1, p1, Lcom/momo/rtcbase/VideoEncoder$Settings;->maxFramerate:I

    .line 116
    .line 117
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string p1, " Use surface mode: "

    .line 121
    .line 122
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-boolean p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 126
    .line 127
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {p2, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecSync:Ljava/lang/Object;

    .line 138
    .line 139
    monitor-enter p1

    .line 140
    :try_start_0
    invoke-direct {p0}, Lcom/momo/rtcbase/HardwareVideoEncoder;->initEncodeInternal()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    monitor-exit p1

    .line 145
    return-object p0

    .line 146
    :catchall_0
    move-exception p0

    .line 147
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    throw p0
.end method

.method public isVbrDeivceSupported(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isUseVbr:Z

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

.method public release()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "HardwareVideoEncoder"

    .line 7
    .line 8
    const-string v1, "HardwareVideoEncoder release"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codecSync:Ljava/lang/Object;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    const/4 v1, 0x1

    .line 17
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    sget-object v1, Lcom/momo/rtcbase/VideoCodecStatus;->REQUEST_SLI:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/4 v1, 0x0

    .line 29
    iput-boolean v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->running:Z

    .line 30
    .line 31
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 32
    .line 33
    const-wide/16 v2, 0x1388

    .line 34
    .line 35
    invoke-static {v1, v2, v3}, Lcom/momo/rtcbase/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    const-string v1, "HardwareVideoEncoder"

    .line 42
    .line 43
    const-string v2, "Media encoder release timeout"

    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object v1, Lcom/momo/rtcbase/VideoCodecStatus;->REQUEST_SLI:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->shutdownException:Ljava/lang/Exception;

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    const-string v1, "HardwareVideoEncoder"

    .line 56
    .line 57
    const-string v2, "Media encoder release exception"

    .line 58
    .line 59
    iget-object v3, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->shutdownException:Ljava/lang/Exception;

    .line 60
    .line 61
    invoke-static {v1, v2, v3}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    sget-object v1, Lcom/momo/rtcbase/VideoCodecStatus;->REQUEST_SLI:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    sget-object v1, Lcom/momo/rtcbase/VideoCodecStatus;->REQUEST_SLI:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 68
    .line 69
    :goto_0
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureDrawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/momo/rtcbase/GlRectDrawer;->release()V

    .line 72
    .line 73
    .line 74
    const/4 v1, 0x0

    .line 75
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureDrawer:Lcom/momo/rtcbase/GlRectDrawer;

    .line 76
    .line 77
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->videoFrameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/momo/rtcbase/VideoFrameDrawer;->release()V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->videoFrameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 83
    .line 84
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 85
    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/momo/rtcbase/EglBase14;->release()V

    .line 89
    .line 90
    .line 91
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 92
    .line 93
    :cond_3
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 94
    .line 95
    if-eqz v2, :cond_4

    .line 96
    .line 97
    invoke-virtual {v2}, Landroid/view/Surface;->release()V

    .line 98
    .line 99
    .line 100
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 101
    .line 102
    :cond_4
    iget-object v2, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 103
    .line 104
    invoke-interface {v2}, Ljava/util/Collection;->clear()V

    .line 105
    .line 106
    .line 107
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 108
    .line 109
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 110
    .line 111
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->detachThread()V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 118
    .line 119
    return-object p0

    .line 120
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    throw p0
.end method

.method public releaseResource()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 4

    .line 1
    const-string v0, "HardwareVideoEncoder releaseResource"

    .line 2
    .line 3
    const-string v1, "HardwareVideoEncoder"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->running:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-wide/16 v2, 0x1388

    .line 16
    .line 17
    invoke-static {v0, v2, v3}, Lcom/momo/rtcbase/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const-string v0, "Media encoder release timeout"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/momo/rtcbase/EglBase14;->release()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureInputSurface:Landroid/view/Surface;

    .line 53
    .line 54
    :cond_3
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputBuilders:Ljava/util/concurrent/BlockingDeque;

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->codec:Lcom/momo/rtcbase/MediaCodecWrapper;

    .line 60
    .line 61
    iput-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->outputThread:Ljava/lang/Thread;

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    iput-boolean v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 65
    .line 66
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 67
    .line 68
    return-object p0
.end method

.method public setRateAllocation(Lcom/momo/rtcbase/VideoEncoder$BitrateAllocation;I)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->encodeThreadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x1e

    .line 7
    .line 8
    if-le p2, v0, :cond_0

    .line 9
    .line 10
    move p2, v0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoEncoder$BitrateAllocation;->getSum()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "resetCodec setRateAllocation:Bitrate = "

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ";framerate="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "HardwareVideoEncoder"

    .line 38
    .line 39
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->bitrateAdjuster:Lcom/momo/rtcbase/BitrateAdjuster;

    .line 43
    .line 44
    invoke-interface {p0, p1, p2}, Lcom/momo/rtcbase/BitrateAdjuster;->setTargets(II)V

    .line 45
    .line 46
    .line 47
    sget-object p0, Lcom/momo/rtcbase/VideoCodecStatus;->OK:Lcom/momo/rtcbase/VideoCodecStatus;

    .line 48
    .line 49
    return-object p0
.end method

.method public updateSharedContext(Lcom/momo/rtcbase/EglBase$Context;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->useSurfaceMode:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 5
    .line 6
    check-cast p1, Lcom/momo/rtcbase/EglBase14$Context;

    .line 7
    .line 8
    if-ne v1, p1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->textureEglBase:Lcom/momo/rtcbase/EglBase14;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    :cond_0
    const-string v1, "HardwareVideoEncoder"

    .line 15
    .line 16
    const-string v2, "need release codec"

    .line 17
    .line 18
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->isNeedUpdateShareContext:Z

    .line 22
    .line 23
    :cond_1
    iput-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoder;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 24
    .line 25
    return-void
.end method
