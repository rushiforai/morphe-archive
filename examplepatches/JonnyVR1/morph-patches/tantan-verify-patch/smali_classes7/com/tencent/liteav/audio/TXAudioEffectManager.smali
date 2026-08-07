.class public interface abstract Lcom/tencent/liteav/audio/TXAudioEffectManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;,
        Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;,
        Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;,
        Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;
    }
.end annotation


# virtual methods
.method public abstract enableVoiceEarMonitor(Z)V
.end method

.method public abstract getMusicCurrentPosInMS(I)J
.end method

.method public abstract getMusicDurationInMS(Ljava/lang/String;)J
.end method

.method public abstract pausePlayMusic(I)V
.end method

.method public abstract resumePlayMusic(I)V
.end method

.method public abstract seekMusicToPosInMS(II)V
.end method

.method public abstract setAllMusicVolume(I)V
.end method

.method public abstract setMusicObserver(ILcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;)V
.end method

.method public abstract setMusicPitch(IF)V
.end method

.method public abstract setMusicPlayoutVolume(II)V
.end method

.method public abstract setMusicPublishVolume(II)V
.end method

.method public abstract setMusicSpeedRate(IF)V
.end method

.method public abstract setVoiceCaptureVolume(I)V
.end method

.method public abstract setVoiceChangerType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;)V
.end method

.method public abstract setVoiceEarMonitorVolume(I)V
.end method

.method public abstract setVoiceReverbType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;)V
.end method

.method public abstract startPlayMusic(Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;)Z
.end method

.method public abstract stopPlayMusic(I)V
.end method
