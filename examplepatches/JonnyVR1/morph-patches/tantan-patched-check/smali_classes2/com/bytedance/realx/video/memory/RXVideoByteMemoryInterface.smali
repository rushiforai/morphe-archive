.class public interface abstract Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;


# virtual methods
.method public abstract getNumberOfPlanes()I
.end method

.method public abstract getPlaneData(I)Ljava/nio/ByteBuffer;
.end method

.method public abstract getPlaneLineSize(I)I
.end method
