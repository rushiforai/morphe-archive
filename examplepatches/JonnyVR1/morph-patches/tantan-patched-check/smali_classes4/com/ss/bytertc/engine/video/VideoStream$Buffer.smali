.class public interface abstract Lcom/ss/bytertc/engine/video/VideoStream$Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/base/RefCounted;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/video/VideoStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Buffer"
.end annotation


# virtual methods
.method public abstract getData()Ljava/nio/ByteBuffer;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract getDataSize()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract release()V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "VideoStreamBuffer"
    .end annotation
.end method

.method public abstract retain()V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "VideoStreamBuffer"
    .end annotation
.end method
