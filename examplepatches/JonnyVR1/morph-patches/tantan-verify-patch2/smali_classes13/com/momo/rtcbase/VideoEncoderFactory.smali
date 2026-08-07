.class public interface abstract Lcom/momo/rtcbase/VideoEncoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract createEncoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoEncoder;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method
