.class public Lio/agora/base/internal/video/VideoDecoderFallback;
.super Lio/agora/base/internal/video/WrappedNativeVideoDecoder;
.source "SourceFile"


# instance fields
.field private final fallback:Lio/agora/base/internal/video/VideoDecoder;

.field private final primary:Lio/agora/base/internal/video/VideoDecoder;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/VideoDecoder;Lio/agora/base/internal/video/VideoDecoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/WrappedNativeVideoDecoder;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/internal/video/VideoDecoderFallback;->fallback:Lio/agora/base/internal/video/VideoDecoder;

    .line 5
    .line 6
    iput-object p2, p0, Lio/agora/base/internal/video/VideoDecoderFallback;->primary:Lio/agora/base/internal/video/VideoDecoder;

    .line 7
    .line 8
    return-void
.end method

.method private static native nativeCreateDecoder(Lio/agora/base/internal/video/VideoDecoder;Lio/agora/base/internal/video/VideoDecoder;)J
.end method


# virtual methods
.method public bridge synthetic attachProxyThread()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoDecoder;->attachProxyThread()Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public createNativeVideoDecoder()J
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/VideoDecoderFallback;->fallback:Lio/agora/base/internal/video/VideoDecoder;

    .line 2
    .line 3
    iget-object p0, p0, Lio/agora/base/internal/video/VideoDecoderFallback;->primary:Lio/agora/base/internal/video/VideoDecoder;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lio/agora/base/internal/video/VideoDecoderFallback;->nativeCreateDecoder(Lio/agora/base/internal/video/VideoDecoder;Lio/agora/base/internal/video/VideoDecoder;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public bridge synthetic decode(Lio/agora/base/internal/video/EncodedImage;Lio/agora/base/internal/video/VideoDecoder$DecodeInfo;Lio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lio/agora/base/internal/video/WrappedNativeVideoDecoder;->decode(Lio/agora/base/internal/video/EncodedImage;Lio/agora/base/internal/video/VideoDecoder$DecodeInfo;Lio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic detachProxyThread()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoDecoder;->detachProxyThread()Lio/agora/base/internal/video/VideoCodecStatus;

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
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoDecoder;->getImplementationName()Ljava/lang/String;

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
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoDecoder;->getPrefersLateDecoding()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic initDecode(Lio/agora/base/internal/video/VideoDecoder$Settings;Lio/agora/base/internal/video/VideoDecoder$Callback;)Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lio/agora/base/internal/video/WrappedNativeVideoDecoder;->initDecode(Lio/agora/base/internal/video/VideoDecoder$Settings;Lio/agora/base/internal/video/VideoDecoder$Callback;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public isHardwareDecoder()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoDecoderFallback;->primary:Lio/agora/base/internal/video/VideoDecoder;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/base/internal/video/VideoDecoder;->isHardwareDecoder()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic release()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoDecoder;->release()Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
