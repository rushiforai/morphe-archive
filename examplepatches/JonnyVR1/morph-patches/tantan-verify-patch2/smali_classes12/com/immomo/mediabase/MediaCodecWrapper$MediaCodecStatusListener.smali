.class public interface abstract Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediabase/MediaCodecWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MediaCodecStatusListener"
.end annotation


# virtual methods
.method public abstract onCodecIdle()V
.end method

.method public abstract onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
.end method

.method public abstract onError(IILjava/lang/String;)V
.end method

.method public abstract onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
.end method

.method public abstract onFinished()V
.end method

.method public abstract onFormatChanged(Landroid/media/MediaFormat;)V
.end method
