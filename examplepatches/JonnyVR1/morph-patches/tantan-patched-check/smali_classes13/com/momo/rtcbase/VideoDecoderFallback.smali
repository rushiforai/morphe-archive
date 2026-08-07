.class public Lcom/momo/rtcbase/VideoDecoderFallback;
.super Lcom/momo/rtcbase/WrappedNativeVideoDecoder;
.source "SourceFile"


# instance fields
.field private final fallback:Lcom/momo/rtcbase/VideoDecoder;

.field private final primary:Lcom/momo/rtcbase/VideoDecoder;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/VideoDecoder;Lcom/momo/rtcbase/VideoDecoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/WrappedNativeVideoDecoder;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/VideoDecoderFallback;->fallback:Lcom/momo/rtcbase/VideoDecoder;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/VideoDecoderFallback;->primary:Lcom/momo/rtcbase/VideoDecoder;

    .line 7
    .line 8
    return-void
.end method

.method private static native nativeCreateDecoder(Lcom/momo/rtcbase/VideoDecoder;Lcom/momo/rtcbase/VideoDecoder;)J
.end method


# virtual methods
.method public createNativeVideoDecoder()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/VideoDecoderFallback;->fallback:Lcom/momo/rtcbase/VideoDecoder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/rtcbase/VideoDecoderFallback;->primary:Lcom/momo/rtcbase/VideoDecoder;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/momo/rtcbase/VideoDecoderFallback;->nativeCreateDecoder(Lcom/momo/rtcbase/VideoDecoder;Lcom/momo/rtcbase/VideoDecoder;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
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
