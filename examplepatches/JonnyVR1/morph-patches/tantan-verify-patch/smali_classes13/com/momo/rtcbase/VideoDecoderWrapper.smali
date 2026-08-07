.class Lcom/momo/rtcbase/VideoDecoderWrapper;
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

.method public static synthetic a(JLcom/momo/rtcbase/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/momo/rtcbase/VideoDecoderWrapper;->nativeOnDecodedFrame(JLcom/momo/rtcbase/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createDecoderCallback(J)Lcom/momo/rtcbase/VideoDecoder$Callback;
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/momo/rtcbase/e;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/e;-><init>(J)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static native nativeOnDecodedFrame(JLcom/momo/rtcbase/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;)V
.end method
