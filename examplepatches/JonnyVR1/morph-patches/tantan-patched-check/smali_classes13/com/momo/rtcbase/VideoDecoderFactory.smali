.class public interface abstract Lcom/momo/rtcbase/VideoDecoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public createDecoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoDecoder;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/VideoDecoderFactory;->createDecoder(Ljava/lang/String;)Lcom/momo/rtcbase/VideoDecoder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public createDecoder(Ljava/lang/String;)Lcom/momo/rtcbase/VideoDecoder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Deprecated and not implemented."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 3
    .line 4
    return-object p0
.end method
