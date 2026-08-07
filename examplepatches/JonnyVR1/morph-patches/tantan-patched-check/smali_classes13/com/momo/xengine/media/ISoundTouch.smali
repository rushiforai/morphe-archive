.class public interface abstract Lcom/momo/xengine/media/ISoundTouch;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract clear()V
.end method

.method public abstract flush()V
.end method

.method public abstract init(Lcom/momo/xengine/media/types/AudioFormat;)V
    .param p1    # Lcom/momo/xengine/media/types/AudioFormat;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract putSamples([BI)V
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract receiveSamples(I)Lcom/momo/xengine/media/types/AudioFrame;
.end method

.method public abstract release()V
.end method

.method public abstract setPitchSemiTones(I)V
.end method

.method public abstract setRate(D)V
.end method

.method public abstract setSetting(II)V
.end method

.method public abstract setSpeed(D)V
.end method
