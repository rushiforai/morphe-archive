.class Lio/agora/base/internal/video/VideoEncoderWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic access$000(JLjava/nio/ByteBuffer;IIJIIZLjava/lang/Integer;IIIIILio/agora/base/internal/video/CodecSpecificInfo;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p16}, Lio/agora/base/internal/video/VideoEncoderWrapper;->nativeOnEncodedFrame(JLjava/nio/ByteBuffer;IIJIIZLjava/lang/Integer;IIIIILio/agora/base/internal/video/CodecSpecificInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(J)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lio/agora/base/internal/video/VideoEncoderWrapper;->nativeOnEncodeReset(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(JJ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lio/agora/base/internal/video/VideoEncoderWrapper;->nativeOnEncodeBufferPrepared(JJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createEncoderCallback(J)Lio/agora/base/internal/video/VideoEncoder$Callback;
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lio/agora/base/internal/video/VideoEncoderWrapper$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lio/agora/base/internal/video/VideoEncoderWrapper$1;-><init>(J)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static getCpuName()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lio/agora/base/internal/video/VideoEncoderWrapper;->nativeGetCpuName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static getScalingSettingsHigh(Lio/agora/base/internal/video/VideoEncoder$ScalingSettings;)Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoEncoder$ScalingSettings;->high:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getScalingSettingsLow(Lio/agora/base/internal/video/VideoEncoder$ScalingSettings;)Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoEncoder$ScalingSettings;->low:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getScalingSettingsOn(Lio/agora/base/internal/video/VideoEncoder$ScalingSettings;)Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/VideoEncoder$ScalingSettings;->on:Z

    .line 2
    .line 3
    return p0
.end method

.method private static native nativeGetCpuName()Ljava/lang/String;
.end method

.method private static native nativeOnEncodeBufferPrepared(JJ)V
.end method

.method private static native nativeOnEncodeReset(J)V
.end method

.method private static native nativeOnEncodedFrame(JLjava/nio/ByteBuffer;IIJIIZLjava/lang/Integer;IIIIILio/agora/base/internal/video/CodecSpecificInfo;)V
.end method

.method private static native nativeRewriteSpsInConfigBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)I
.end method

.method private static native nativeShouldUseBaseline()Z
.end method

.method public static rewriteSpsInConfigBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lio/agora/base/internal/video/VideoEncoderWrapper;->nativeRewriteSpsInConfigBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static shouldUseBaseline()Z
    .locals 1

    .line 1
    invoke-static {}, Lio/agora/base/internal/video/VideoEncoderWrapper;->nativeShouldUseBaseline()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method
