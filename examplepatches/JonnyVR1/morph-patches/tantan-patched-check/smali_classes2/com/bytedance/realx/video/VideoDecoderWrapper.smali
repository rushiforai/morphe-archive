.class Lcom/bytedance/realx/video/VideoDecoderWrapper;
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

.method public static synthetic access$000(JLcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/bytedance/realx/video/VideoDecoderWrapper;->nativeOnDecodedFrame(JLcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(JLcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/bytedance/realx/video/VideoDecoderWrapper;->nativeOnMediaCodecStatus(JLcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createDecoderCallback(J)Lcom/bytedance/realx/video/VideoDecoder$Callback;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/VideoDecoderWrapper$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/bytedance/realx/video/VideoDecoderWrapper$1;-><init>(J)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static native nativeOnDecodedFrame(JLcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
.end method

.method private static native nativeOnMediaCodecStatus(JLcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V
.end method
