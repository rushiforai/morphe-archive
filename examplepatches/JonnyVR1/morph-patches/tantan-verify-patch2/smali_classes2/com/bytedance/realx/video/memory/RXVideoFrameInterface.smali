.class public interface abstract Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/base/RefCounted;


# virtual methods
.method public abstract getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;
.end method

.method public abstract getColorSpace()Lcom/bytedance/realx/video/RXColorSpace;
.end method

.method public abstract getHeight()I
.end method

.method public abstract getNativeHandle()J
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getRotatedHeight()I
.end method

.method public abstract getRotatedWidth()I
.end method

.method public abstract getRotation()Lcom/bytedance/realx/video/RXVideoRotation;
.end method

.method public abstract getSupplementData()Ljava/nio/ByteBuffer;
.end method

.method public abstract getTimestampNs()J
.end method

.method public abstract getTimestampUs()J
.end method

.method public abstract getWidth()I
.end method

.method public abstract release()V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract retain()V
.end method

.method public abstract setRotation(Lcom/bytedance/realx/video/RXVideoRotation;)V
.end method

.method public abstract setTimestampNs(J)V
.end method

.method public abstract setTimestampUs(J)V
.end method

.method public abstract toI420()Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;
.end method
