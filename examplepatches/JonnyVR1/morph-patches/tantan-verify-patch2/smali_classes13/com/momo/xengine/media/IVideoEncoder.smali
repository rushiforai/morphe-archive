.class public interface abstract Lcom/momo/xengine/media/IVideoEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract appendAudioSamples(Lcom/momo/xengine/media/AudioSamples;)Z
    .param p1    # Lcom/momo/xengine/media/AudioSamples;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract appendVideoFrame(Lcom/momo/xengine/media/types/VideoFrame;)Z
    .param p1    # Lcom/momo/xengine/media/types/VideoFrame;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract init(Lcom/momo/xengine/media/EncodeConfig;)V
    .param p1    # Lcom/momo/xengine/media/EncodeConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract release()V
.end method

.method public abstract start()Z
.end method

.method public abstract stop()Z
.end method
