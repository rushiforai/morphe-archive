.class public interface abstract Lio/agora/rtc2/IAudioFrameObserver;
.super Ljava/lang/Object;


# virtual methods
.method public abstract getEarMonitoringAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getMixedAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getObservedAudioFramePosition()I
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getPlaybackAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getRecordAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onEarMonitoringAudioFrame(IIIIILjava/nio/ByteBuffer;JI)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onMixedAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlaybackAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlaybackAudioFrameBeforeMixing(Ljava/lang/String;IIIIIILjava/nio/ByteBuffer;JIIJ)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onRecordAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
