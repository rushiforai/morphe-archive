.class public interface abstract Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$Buffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "TextureBuffer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;
    }
.end annotation


# virtual methods
.method public abstract cropAndScaleWithFilter(IIIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public getBufferType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation

    const/4 p0, 0x4

    return p0
.end method

.method public abstract getEglContext()Landroid/opengl/EGLContext;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getNativeEglContext()J
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getScaleFilter()Lcom/bytedance/realx/video/FilterType;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getTextureId()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getTransformMatrix()Landroid/graphics/Matrix;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getTypeGlTarget()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getUnscaledHeight()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract getUnscaledWidth()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method

.method public abstract nativeGetTransFormMatrix()[F
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "TextureBuffer"
    .end annotation
.end method
