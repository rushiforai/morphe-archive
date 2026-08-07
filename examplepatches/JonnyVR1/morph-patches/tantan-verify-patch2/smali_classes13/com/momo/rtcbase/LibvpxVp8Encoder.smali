.class public Lcom/momo/rtcbase/LibvpxVp8Encoder;
.super Lcom/momo/rtcbase/WrappedNativeVideoEncoder;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native nativeCreateEncoder()J
.end method


# virtual methods
.method public createNativeVideoEncoder()J
    .locals 2

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/LibvpxVp8Encoder;->nativeCreateEncoder()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public bridge synthetic encode(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/VideoEncoder$EncodeInfo;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;->encode(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/VideoEncoder$EncodeInfo;)Lcom/momo/rtcbase/VideoCodecStatus;

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
    invoke-super {p0}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;->getImplementationName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getScalingSettings()Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;->getScalingSettings()Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getVideoMode()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;->getVideoMode()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic initEncode(Lcom/momo/rtcbase/VideoEncoder$Settings;Lcom/momo/rtcbase/VideoEncoder$Callback;)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;->initEncode(Lcom/momo/rtcbase/VideoEncoder$Settings;Lcom/momo/rtcbase/VideoEncoder$Callback;)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public isHardwareEncoder()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic release()Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;->release()Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic setRateAllocation(Lcom/momo/rtcbase/VideoEncoder$BitrateAllocation;I)Lcom/momo/rtcbase/VideoCodecStatus;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;->setRateAllocation(Lcom/momo/rtcbase/VideoEncoder$BitrateAllocation;I)Lcom/momo/rtcbase/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic updateSharedContext(Lcom/momo/rtcbase/EglBase$Context;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;->updateSharedContext(Lcom/momo/rtcbase/EglBase$Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
