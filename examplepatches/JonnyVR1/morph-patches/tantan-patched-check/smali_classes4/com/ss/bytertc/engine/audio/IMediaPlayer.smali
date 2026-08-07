.class public abstract Lcom/ss/bytertc/engine/audio/IMediaPlayer;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract getAudioTrackCount()I
.end method

.method public abstract getPlaybackDuration()I
.end method

.method public abstract getPosition()I
.end method

.method public abstract getState()Lcom/ss/bytertc/engine/data/PlayerState;
.end method

.method public abstract getTotalDuration()I
.end method

.method public abstract getVolume(Lcom/ss/bytertc/engine/data/AudioMixingType;)I
.end method

.method public abstract open(Ljava/lang/String;Lcom/ss/bytertc/engine/data/MediaPlayerConfig;)I
.end method

.method public abstract openWithCustomSource(Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;Lcom/ss/bytertc/engine/data/MediaPlayerConfig;)I
.end method

.method public abstract pause()I
.end method

.method public abstract pushExternalAudioFrame(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
.end method

.method public abstract registerAudioFrameObserver(Lcom/ss/bytertc/engine/IMediaPlayerAudioFrameObserver;)I
.end method

.method public abstract resume()I
.end method

.method public abstract selectAudioTrack(I)I
.end method

.method public abstract setAudioDualMonoMode(Lcom/ss/bytertc/engine/data/AudioMixingDualMonoMode;)I
.end method

.method public abstract setAudioPitch(I)I
.end method

.method public abstract setEventHandler(Lcom/ss/bytertc/engine/IMediaPlayerEventHandler;)I
.end method

.method public abstract setLoudness(F)I
.end method

.method public abstract setPlaybackSpeed(I)I
.end method

.method public abstract setPosition(I)I
.end method

.method public abstract setProgressInterval(J)I
.end method

.method public abstract setVolume(ILcom/ss/bytertc/engine/data/AudioMixingType;)I
.end method

.method public abstract start()I
.end method

.method public abstract stop()I
.end method
