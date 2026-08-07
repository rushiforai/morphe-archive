.class public interface abstract Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DECODE_EXTRACTOR_ERROR:I = -0x1

.field public static final DECODE_EXTRACTOR_NO_AUDIO:I = -0x2

.field public static final DECODE_EXTRACTOR_SEEK_ERROR:I = -0x3


# virtual methods
.method public abstract onDecodeFinished(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
.end method

.method public abstract onDecoderError(ILcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
.end method

.method public abstract onForamtChange(Landroid/media/MediaFormat;Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
.end method

.method public abstract onPlayFinished(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
.end method

.method public abstract onPlayStart(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
.end method

.method public abstract onProcessFrame(Ljava/nio/ByteBuffer;JLcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
.end method

.method public abstract onResampleOpen(Lcom/immomo/mediabase/AudioParameter;Lcom/immomo/mediabase/AudioParameter;Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
.end method
