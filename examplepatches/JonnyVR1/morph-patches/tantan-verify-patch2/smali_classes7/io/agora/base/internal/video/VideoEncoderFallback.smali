.class public Lio/agora/base/internal/video/VideoEncoderFallback;
.super Lio/agora/base/internal/video/WrappedNativeVideoEncoder;
.source "SourceFile"


# instance fields
.field private final fallback:Lio/agora/base/internal/video/VideoEncoder;

.field private final primary:Lio/agora/base/internal/video/VideoEncoder;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/VideoEncoder;Lio/agora/base/internal/video/VideoEncoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/internal/video/VideoEncoderFallback;->fallback:Lio/agora/base/internal/video/VideoEncoder;

    .line 5
    .line 6
    iput-object p2, p0, Lio/agora/base/internal/video/VideoEncoderFallback;->primary:Lio/agora/base/internal/video/VideoEncoder;

    .line 7
    .line 8
    return-void
.end method

.method private static native nativeCreateEncoder(Lio/agora/base/internal/video/VideoEncoder;Lio/agora/base/internal/video/VideoEncoder;)J
.end method


# virtual methods
.method public bridge synthetic attachProxyThread()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->attachProxyThread()Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public createNativeVideoEncoder()J
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/VideoEncoderFallback;->fallback:Lio/agora/base/internal/video/VideoEncoder;

    .line 2
    .line 3
    iget-object p0, p0, Lio/agora/base/internal/video/VideoEncoderFallback;->primary:Lio/agora/base/internal/video/VideoEncoder;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lio/agora/base/internal/video/VideoEncoderFallback;->nativeCreateEncoder(Lio/agora/base/internal/video/VideoEncoder;Lio/agora/base/internal/video/VideoEncoder;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public bridge synthetic detachProxyThread()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->detachProxyThread()Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic encode(Lio/agora/base/VideoFrame;Lio/agora/base/internal/video/VideoEncoder$EncodeInfo;Lio/agora/base/internal/video/CodecSpecificInfo;)Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->encode(Lio/agora/base/VideoFrame;Lio/agora/base/internal/video/VideoEncoder$EncodeInfo;Lio/agora/base/internal/video/CodecSpecificInfo;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic flush()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->flush()Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getEncoderStyle()Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->getEncoderStyle()Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;

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
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->getImplementationName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getResetCoolDownTimeMs()J
    .locals 2

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->getResetCoolDownTimeMs()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public bridge synthetic getScalingSettings()Lio/agora/base/internal/video/VideoEncoder$ScalingSettings;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->getScalingSettings()Lio/agora/base/internal/video/VideoEncoder$ScalingSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getVideoHWCodecSpec()Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public bridge synthetic initEncode(Lio/agora/base/internal/video/VideoEncoder$Settings;Lio/agora/base/internal/video/VideoEncoder$Callback;)Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->initEncode(Lio/agora/base/internal/video/VideoEncoder$Settings;Lio/agora/base/internal/video/VideoEncoder$Callback;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public isHardwareEncoder()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoEncoderFallback;->primary:Lio/agora/base/internal/video/VideoEncoder;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/base/internal/video/VideoEncoder;->isHardwareEncoder()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic isQcomHardware()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->isQcomHardware()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic release()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->release()Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic resume()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->resume()Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic setChannelParameters(SJ)Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->setChannelParameters(SJ)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic setRateAllocation(Lio/agora/base/internal/video/VideoEncoder$BitrateAllocation;I)Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lio/agora/base/internal/video/WrappedNativeVideoEncoder;->setRateAllocation(Lio/agora/base/internal/video/VideoEncoder$BitrateAllocation;I)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
