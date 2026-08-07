.class public interface abstract Lio/agora/base/internal/video/VideoEncoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract createEncoder(Lio/agora/base/internal/video/VideoCodecInfo;Z)Lio/agora/base/internal/video/VideoEncoder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract createEncoder(Lio/agora/base/internal/video/VideoCodecInfo;ZZ)Lio/agora/base/internal/video/VideoEncoder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getSupportedCodecs(Z)[Lio/agora/base/internal/video/VideoCodecInfo;
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
