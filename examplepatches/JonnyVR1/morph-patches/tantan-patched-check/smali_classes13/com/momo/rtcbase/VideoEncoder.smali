.class public interface abstract Lcom/momo/rtcbase/VideoEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/VideoEncoder$Callback;,
        Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;,
        Lcom/momo/rtcbase/VideoEncoder$BitrateAllocation;,
        Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfoH264;,
        Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfoVP9;,
        Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfoVP8;,
        Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfo;,
        Lcom/momo/rtcbase/VideoEncoder$EncodeInfo;,
        Lcom/momo/rtcbase/VideoEncoder$Settings;
    }
.end annotation


# virtual methods
.method public createNativeVideoEncoder()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public abstract encode(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/VideoEncoder$EncodeInfo;)Lcom/momo/rtcbase/VideoCodecStatus;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract getImplementationName()Ljava/lang/String;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract getScalingSettings()Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract getVideoMode()Ljava/lang/Integer;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract initEncode(Lcom/momo/rtcbase/VideoEncoder$Settings;Lcom/momo/rtcbase/VideoEncoder$Callback;)Lcom/momo/rtcbase/VideoCodecStatus;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public isHardwareEncoder()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    const/4 p0, 0x1

    return p0
.end method

.method public abstract release()Lcom/momo/rtcbase/VideoCodecStatus;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract setRateAllocation(Lcom/momo/rtcbase/VideoEncoder$BitrateAllocation;I)Lcom/momo/rtcbase/VideoCodecStatus;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract updateSharedContext(Lcom/momo/rtcbase/EglBase$Context;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method
