.class public interface abstract Lcom/momo/xengine/media/IPCMDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract DecodeAudioFile(Ljava/lang/String;)Lcom/momo/xengine/media/types/AudioFrame;
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract addSupportChannels(Lcom/momo/xengine/media/types/AudioChannelLayout;)V
    .param p1    # Lcom/momo/xengine/media/types/AudioChannelLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract addSupportFormat(Lcom/momo/xengine/media/types/SampleFormat;)V
    .param p1    # Lcom/momo/xengine/media/types/SampleFormat;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract init()V
.end method
