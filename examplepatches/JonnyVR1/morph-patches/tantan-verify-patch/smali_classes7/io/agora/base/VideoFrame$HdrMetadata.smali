.class public interface abstract Lio/agora/base/VideoFrame$HdrMetadata;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "HdrMetadata"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/VideoFrame$HdrMetadata$Chromaticity;
    }
.end annotation


# virtual methods
.method public abstract getLuminanceMax()I
.end method

.method public abstract getLuminanceMin()I
.end method

.method public abstract getMaxContentLightLevel()I
.end method

.method public abstract getMaxFrameAverageLightLevel()I
.end method

.method public abstract getWhitePoint()Lio/agora/base/VideoFrame$HdrMetadata$Chromaticity;
.end method

.method public abstract getprimaryB()Lio/agora/base/VideoFrame$HdrMetadata$Chromaticity;
.end method

.method public abstract getprimaryG()Lio/agora/base/VideoFrame$HdrMetadata$Chromaticity;
.end method

.method public abstract getprimaryR()Lio/agora/base/VideoFrame$HdrMetadata$Chromaticity;
.end method
