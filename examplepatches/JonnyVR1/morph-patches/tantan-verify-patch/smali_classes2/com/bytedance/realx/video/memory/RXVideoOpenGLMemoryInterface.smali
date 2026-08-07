.class public interface abstract Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;


# virtual methods
.method public abstract getAndroidTextureMatrix()Landroid/graphics/Matrix;
.end method

.method public abstract getEGLContext()Landroid/opengl/EGLContext;
.end method

.method public abstract getNativeEGLContext()J
.end method

.method public abstract getRotation()Lcom/bytedance/realx/video/RXVideoRotation;
.end method

.method public abstract getScaleFilter()Lcom/bytedance/realx/video/RXVideoScaleFilter;
.end method

.method public abstract getTextureId()I
.end method

.method public abstract getTextureMatrix()[F
.end method

.method public abstract getTextureTarget()Lcom/bytedance/realx/video/RXPixelFormat;
.end method

.method public abstract getUnScaledHeight()I
.end method

.method public abstract getUnScaledWidth()I
.end method
