.class public interface abstract Lcom/bytedance/realx/video/VideoFrame$Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/base/RefCounted;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Buffer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/VideoFrame$Buffer$BufferType;
    }
.end annotation


# virtual methods
.method public abstract copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract getBufferType()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract getHeight()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract getWidth()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract release()V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract retain()V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public toNV12()Lcom/bytedance/realx/video/VideoFrame$NV12Buffer;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation

    .line 1
    const-string p0, "VideoFrame"

    .line 2
    .line 3
    const-string v0, "toNV12 has not been implemented, default return null"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method
