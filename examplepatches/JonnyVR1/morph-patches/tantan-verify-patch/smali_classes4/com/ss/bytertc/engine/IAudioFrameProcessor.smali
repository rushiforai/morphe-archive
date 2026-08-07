.class public interface abstract Lcom/ss/bytertc/engine/IAudioFrameProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract onProcessEarMonitorAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onProcessPlayBackAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onProcessRecordAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onProcessRemoteUserAudioFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract onProcessScreenAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method
