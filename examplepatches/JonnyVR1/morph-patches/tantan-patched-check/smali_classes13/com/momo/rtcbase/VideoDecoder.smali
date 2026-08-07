.class public interface abstract Lcom/momo/rtcbase/VideoDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/VideoDecoder$Callback;,
        Lcom/momo/rtcbase/VideoDecoder$DecodeInfo;,
        Lcom/momo/rtcbase/VideoDecoder$Settings;
    }
.end annotation


# virtual methods
.method public createNativeVideoDecoder()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public abstract decode(Lcom/momo/rtcbase/EncodedImage;Lcom/momo/rtcbase/VideoDecoder$DecodeInfo;)Lcom/momo/rtcbase/VideoCodecStatus;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract getImplementationName()Ljava/lang/String;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract getPrefersLateDecoding()Z
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract initDecode(Lcom/momo/rtcbase/VideoDecoder$Settings;Lcom/momo/rtcbase/VideoDecoder$Callback;)Lcom/momo/rtcbase/VideoCodecStatus;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract release()Lcom/momo/rtcbase/VideoCodecStatus;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method
