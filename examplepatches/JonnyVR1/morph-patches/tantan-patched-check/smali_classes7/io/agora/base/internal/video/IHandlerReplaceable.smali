.class public interface abstract Lio/agora/base/internal/video/IHandlerReplaceable;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract applyNewI420Handler(Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;)Lio/agora/base/VideoFrame$Buffer;
    .param p1    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lio/agora/base/internal/video/YuvConverter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract getToI420Handler()Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getYuvConverter()Lio/agora/base/internal/video/YuvConverter;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method
