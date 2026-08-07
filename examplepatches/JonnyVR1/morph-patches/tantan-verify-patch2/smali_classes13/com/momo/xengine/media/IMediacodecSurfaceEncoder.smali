.class public interface abstract Lcom/momo/xengine/media/IMediacodecSurfaceEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getEncoderSurface()Landroid/view/Surface;
.end method

.method public abstract init(Lcom/momo/xengine/media/EncodeConfig;)Z
    .param p1    # Lcom/momo/xengine/media/EncodeConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract putAudioData(Lcom/momo/xengine/media/AudioSamples;)V
    .param p1    # Lcom/momo/xengine/media/AudioSamples;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract release()V
.end method

.method public abstract start()Z
.end method

.method public abstract stop()V
.end method
