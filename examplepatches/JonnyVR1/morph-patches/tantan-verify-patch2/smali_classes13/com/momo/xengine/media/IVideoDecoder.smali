.class public interface abstract Lcom/momo/xengine/media/IVideoDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getFrameAt(JI)Lcom/momo/xengine/media/types/VideoFrame;
.end method

.method public abstract getFrameInMicrosecond(J)Lcom/momo/xengine/media/types/VideoFrame;
.end method

.method public abstract init(Lcom/momo/xengine/media/DecodeConfig;)V
    .param p1    # Lcom/momo/xengine/media/DecodeConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract release()V
.end method
