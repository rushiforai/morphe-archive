.class public interface abstract Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediabase/mediacodec/MediaCodecBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MediaCodecListener"
.end annotation


# virtual methods
.method public abstract onError(ILjava/lang/String;)V
.end method

.method public abstract onFinished()V
.end method

.method public abstract onForamtChange(Landroid/media/MediaFormat;)V
.end method

.method public abstract onFrameAvailable(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
.end method
