.class public interface abstract Lio/agora/base/internal/video/VideoDecoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract createDecoder(Lio/agora/base/internal/video/VideoCodecInfo;)Lio/agora/base/internal/video/VideoDecoder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract createDecoder(Lio/agora/base/internal/video/VideoCodecInfo;Z)Lio/agora/base/internal/video/VideoDecoder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract createDecoder(Ljava/lang/String;)Lio/agora/base/internal/video/VideoDecoder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getSupportedCodecs()[Lio/agora/base/internal/video/VideoCodecInfo;
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
