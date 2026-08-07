.class public interface abstract Lcom/bytedance/realx/video/VideoFrame$NV12Buffer;
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
    name = "NV12Buffer"
.end annotation


# virtual methods
.method public getBufferType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "NV12Buffer"
    .end annotation

    const/4 p0, 0x1

    return p0
.end method

.method public abstract getDataUV()Ljava/nio/ByteBuffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "NV12Buffer"
    .end annotation
.end method

.method public abstract getDataY()Ljava/nio/ByteBuffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "NV12Buffer"
    .end annotation
.end method

.method public abstract getStrideUV()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "NV12Buffer"
    .end annotation
.end method

.method public abstract getStrideY()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "NV12Buffer"
    .end annotation
.end method
