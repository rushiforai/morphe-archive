.class public interface abstract Lcom/bytedance/realx/video/VideoEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/VideoEncoder$Callback;,
        Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;,
        Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;,
        Lcom/bytedance/realx/video/VideoEncoder$Settings;,
        Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;,
        Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;,
        Lcom/bytedance/realx/video/VideoEncoder$ScaleMode;
    }
.end annotation


# virtual methods
.method public abstract encode(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Z)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract initEncode(Lcom/bytedance/realx/video/VideoEncoder$Settings;Lcom/bytedance/realx/video/VideoEncoder$Callback;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract release()Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract requestKeyFrame()Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract setPrivateParam(Ljava/lang/String;Ljava/lang/String;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract setRateAllocation(II)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method
