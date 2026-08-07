.class public interface abstract Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/base/RefCounted;


# virtual methods
.method public abstract getHeight()I
.end method

.method public abstract getMemoryType()Lcom/bytedance/realx/video/RXVideoMemoryType;
.end method

.method public abstract getNativeHandle()J
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getPixelFormat()Lcom/bytedance/realx/video/RXPixelFormat;
.end method

.method public abstract getWidth()I
.end method

.method public abstract release()V
.end method

.method public abstract retain()V
.end method
