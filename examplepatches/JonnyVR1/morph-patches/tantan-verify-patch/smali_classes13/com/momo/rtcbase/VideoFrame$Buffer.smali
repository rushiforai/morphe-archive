.class public interface abstract Lcom/momo/rtcbase/VideoFrame$Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/RefCounted;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Buffer"
.end annotation


# virtual methods
.method public abstract cropAndScale(IIIIII)Lcom/momo/rtcbase/VideoFrame$Buffer;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract getHeight()I
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract getWidth()I
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract release()V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract retain()V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Buffer"
    .end annotation
.end method

.method public abstract toI420()Lcom/momo/rtcbase/VideoFrame$I420Buffer;
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Buffer"
    .end annotation
.end method
