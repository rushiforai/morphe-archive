.class public interface abstract Lio/agora/base/VideoFrame$Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/RefCounted;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Buffer"
.end annotation


# virtual methods
.method public abstract cropAndScale(IIIIII)Lio/agora/base/VideoFrame$Buffer;
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract getHeight()I
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract getWidth()I
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract mirror(I)Lio/agora/base/VideoFrame$Buffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract release()V
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract retain()V
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract rotate(I)Lio/agora/base/VideoFrame$Buffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract toI420()Lio/agora/base/VideoFrame$I420Buffer;
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract transform(IIIIIII)Lio/agora/base/VideoFrame$Buffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "Buffer"
    .end annotation
.end method
