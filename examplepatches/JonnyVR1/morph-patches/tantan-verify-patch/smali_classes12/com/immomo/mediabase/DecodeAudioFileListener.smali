.class public interface abstract Lcom/immomo/mediabase/DecodeAudioFileListener;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DECODE_EXTRACTOR_ERROR:I = -0x1

.field public static final DECODE_EXTRACTOR_NO_AUDIO:I = -0x2

.field public static final DECODE_EXTRACTOR_SEEK_ERROR:I = -0x3


# virtual methods
.method public abstract onDecoderError(I)V
.end method

.method public abstract onFinished()V
.end method

.method public abstract onForamtChange(Landroid/media/MediaFormat;)V
.end method

.method public abstract onFrameAvailable(Ljava/nio/ByteBuffer;J)V
.end method
