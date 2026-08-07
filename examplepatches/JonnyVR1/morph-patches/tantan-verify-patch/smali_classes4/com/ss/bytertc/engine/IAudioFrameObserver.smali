.class public interface abstract Lcom/ss/bytertc/engine/IAudioFrameObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract onCaptureMixedAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onMixedAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onPlaybackAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onRecordAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onRemoteUserAudioFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method
