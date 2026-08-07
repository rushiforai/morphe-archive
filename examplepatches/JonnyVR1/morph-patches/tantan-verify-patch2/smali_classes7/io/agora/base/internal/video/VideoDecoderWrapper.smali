.class Lio/agora/base/internal/video/VideoDecoderWrapper;
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

.method public static synthetic access$000(JLio/agora/base/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;IIILio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p9}, Lio/agora/base/internal/video/VideoDecoderWrapper;->nativeOnDecodedFrame(JLio/agora/base/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;IIILio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(J)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lio/agora/base/internal/video/VideoDecoderWrapper;->nativeOnDecodeReset(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(JJ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lio/agora/base/internal/video/VideoDecoderWrapper;->nativeOnDecodeBufferPrepared(JJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createDecoderCallback(J)Lio/agora/base/internal/video/VideoDecoder$Callback;
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lio/agora/base/internal/video/VideoDecoderWrapper$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lio/agora/base/internal/video/VideoDecoderWrapper$1;-><init>(J)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static native nativeOnDecodeBufferPrepared(JJ)V
.end method

.method private static native nativeOnDecodeReset(J)V
.end method

.method private static native nativeOnDecodedFrame(JLio/agora/base/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;IIILio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)V
.end method
