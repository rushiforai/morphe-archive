.class public Lcom/momo/rtcbase/LibvpxVp9Decoder;
.super Lcom/momo/rtcbase/WrappedNativeVideoDecoder;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/WrappedNativeVideoDecoder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native nativeCreateDecoder()J
.end method

.method public static native nativeIsSupported()Z
.end method


# virtual methods
.method public createNativeVideoDecoder()J
    .locals 2

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/LibvpxVp9Decoder;->nativeCreateDecoder()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public bridge synthetic decode(Lcom/momo/rtcbase/EncodedImage;Lcom/momo/rtcbase/VideoDecoder$DecodeInfo;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/rtcbase/WrappedNativeVideoDecoder;->decode(Lcom/momo/rtcbase/EncodedImage;Lcom/momo/rtcbase/VideoDecoder$DecodeInfo;)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getImplementationName()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/WrappedNativeVideoDecoder;->getImplementationName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getPrefersLateDecoding()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/WrappedNativeVideoDecoder;->getPrefersLateDecoding()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic initDecode(Lcom/momo/rtcbase/VideoDecoder$Settings;Lcom/momo/rtcbase/VideoDecoder$Callback;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/rtcbase/WrappedNativeVideoDecoder;->initDecode(Lcom/momo/rtcbase/VideoDecoder$Settings;Lcom/momo/rtcbase/VideoDecoder$Callback;)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic release()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/WrappedNativeVideoDecoder;->release()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
