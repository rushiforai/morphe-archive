.class public interface abstract Lcom/bytedance/realx/video/VideoDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/VideoDecoder$Callback;,
        Lcom/bytedance/realx/video/VideoDecoder$DecodeInfo;,
        Lcom/bytedance/realx/video/VideoDecoder$Settings;
    }
.end annotation


# virtual methods
.method public createNativeVideoDecoder()J
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public abstract decode(Lcom/bytedance/realx/video/EncodedImage;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract disableExternalSurface()V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getImplementationName()Ljava/lang/String;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getPrefersLateDecoding()Z
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract initDecode(Lcom/bytedance/realx/video/VideoDecoder$Settings;Lcom/bytedance/realx/video/VideoDecoder$Callback;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract release()Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract setDeliverParams(ZIFFI)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract setExternalSurface(Landroid/view/Surface;)V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract setPrivateParam(Ljava/lang/String;Ljava/lang/String;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract updateSettings(Lcom/bytedance/realx/video/VideoDecoder$Settings;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method
