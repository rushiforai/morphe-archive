.class public interface abstract Lcom/bytedance/realx/video/VideoDecoder$Callback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/VideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onDecodedFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
.end method

.method public abstract onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V
.end method
