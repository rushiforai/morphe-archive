.class public abstract Lcom/bytedance/realx/video/memory/RXVideoTextureMemory;
.super Lcom/bytedance/realx/video/memory/RTCVideoMemory;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/memory/RTCVideoMemory;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract getEGLContext()Landroid/opengl/EGLContext;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getNativeEGLContext()J
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getScaleFilter()Lcom/bytedance/realx/video/RXVideoScaleFilter;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getTextureId()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getTextureMatrix()[F
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getTextureTarget()Lcom/bytedance/realx/video/RXPixelFormat;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getUnScaledHeight()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getUnScaledWidth()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method
