.class public interface abstract Lio/agora/base/VideoFrame$TextureBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/VideoFrame$Buffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "TextureBuffer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/VideoFrame$TextureBuffer$ContextType;,
        Lio/agora/base/VideoFrame$TextureBuffer$Type;
    }
.end annotation


# virtual methods
.method public abstract getEglBaseContext()Lio/agora/base/internal/video/EglBase$Context;
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getEglContextType()I
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getFenceObject()J
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getNativeEglContext()J
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getSequence()I
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getSourceTexturePool()Ljava/lang/Object;
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getTextureId()I
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getTransformMatrix()Landroid/graphics/Matrix;
.end method

.method public abstract getTransformMatrixArray()[F
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getType()Lio/agora/base/VideoFrame$TextureBuffer$Type;
.end method

.method public abstract is10BitTexture()Z
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract toI010()Lio/agora/base/VideoFrame$I010Buffer;
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method
