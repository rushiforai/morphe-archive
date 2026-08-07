.class public interface abstract Lio/agora/rtc2/IAudioEncodedFrameObserver;
.super Ljava/lang/Object;


# virtual methods
.method public abstract onMixedAudioEncodedFrame(Ljava/nio/ByteBuffer;IIII)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlaybackAudioEncodedFrame(Ljava/nio/ByteBuffer;IIII)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onRecordAudioEncodedFrame(Ljava/nio/ByteBuffer;IIII)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
