.class public interface abstract Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
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
    name = "I420Buffer"
.end annotation


# virtual methods
.method public getBufferType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "I420Buffer"
    .end annotation

    const/4 p0, 0x3

    return p0
.end method

.method public abstract getDataU()Ljava/nio/ByteBuffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "I420Buffer"
    .end annotation
.end method

.method public abstract getDataV()Ljava/nio/ByteBuffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "I420Buffer"
    .end annotation
.end method

.method public abstract getDataY()Ljava/nio/ByteBuffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "I420Buffer"
    .end annotation
.end method

.method public abstract getStrideU()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "I420Buffer"
    .end annotation
.end method

.method public abstract getStrideV()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "I420Buffer"
    .end annotation
.end method

.method public abstract getStrideY()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "I420Buffer"
    .end annotation
.end method
