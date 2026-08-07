.class public interface abstract Lio/agora/mediaplayer/IMediaPlayer;
.super Ljava/lang/Object;


# virtual methods
.method public abstract adjustPlayoutVolume(I)I
.end method

.method public abstract adjustPublishSignalVolume(I)I
.end method

.method public abstract destroy()I
.end method

.method public abstract enableAutoSwitchAgoraCDN(Z)I
.end method

.method public abstract getAgoraCDNLineCount()I
.end method

.method public abstract getCurrentAgoraCDNIndex()I
.end method

.method public abstract getDuration()J
.end method

.method public abstract getMediaPlayerId()I
.end method

.method public abstract getMute()Z
.end method

.method public abstract getPlayPosition()J
.end method

.method public abstract getPlaySrc()Ljava/lang/String;
.end method

.method public abstract getPlayoutVolume()I
.end method

.method public abstract getPublishSignalVolume()I
.end method

.method public abstract getState()Lio/agora/mediaplayer/Constants$MediaPlayerState;
.end method

.method public abstract getStreamCount()I
.end method

.method public abstract getStreamInfo(I)Lio/agora/mediaplayer/data/MediaStreamInfo;
.end method

.method public abstract mute(Z)I
.end method

.method public abstract open(Landroid/net/Uri;J)I
.end method

.method public abstract open(Ljava/lang/String;J)I
.end method

.method public abstract openWithAgoraCDNSrc(Ljava/lang/String;J)I
.end method

.method public abstract openWithMediaSource(Lio/agora/mediaplayer/data/MediaPlayerSource;)I
.end method

.method public abstract pause()I
.end method

.method public abstract play()I
.end method

.method public abstract playPreloadedSrc(Ljava/lang/String;)I
.end method

.method public abstract preloadSrc(Ljava/lang/String;J)I
.end method

.method public abstract registerAudioFrameObserver(Lio/agora/mediaplayer/IMediaPlayerAudioFrameObserver;I)I
.end method

.method public abstract registerMediaPlayerAudioSpectrumObserver(Lio/agora/rtc2/audio/IAudioSpectrumObserver;I)I
.end method

.method public abstract registerPlayerObserver(Lio/agora/mediaplayer/IMediaPlayerObserver;)I
.end method

.method public abstract registerVideoFrameObserver(Lio/agora/mediaplayer/IMediaPlayerVideoFrameObserver;)I
.end method

.method public abstract renewAgoraCDNSrcToken(Ljava/lang/String;J)I
.end method

.method public abstract resume()I
.end method

.method public abstract seek(J)I
.end method

.method public abstract selectAudioTrack(I)I
.end method

.method public abstract selectInternalSubtitle(I)I
.end method

.method public abstract selectMultiAudioTrack(II)I
.end method

.method public abstract setAudioDualMonoMode(I)I
.end method

.method public abstract setAudioPitch(I)I
.end method

.method public abstract setExternalSubtitle(Ljava/lang/String;)I
.end method

.method public abstract setLoopCount(I)I
.end method

.method public abstract setPlaybackSpeed(I)I
.end method

.method public abstract setPlayerOption(Ljava/lang/String;I)I
.end method

.method public abstract setPlayerOptionString(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract setRenderMode(I)I
.end method

.method public abstract setSpatialAudioParams(Lio/agora/rtc2/SpatialAudioParams;)I
.end method

.method public abstract setView(Landroid/view/View;)I
.end method

.method public abstract stop()I
.end method

.method public abstract switchAgoraCDNLineByIndex(I)I
.end method

.method public abstract switchAgoraCDNSrc(Ljava/lang/String;Z)I
.end method

.method public abstract switchSrc(Ljava/lang/String;Z)I
.end method

.method public abstract takeScreenshot(Ljava/lang/String;)I
.end method

.method public abstract unRegisterPlayerObserver(Lio/agora/mediaplayer/IMediaPlayerObserver;)I
.end method

.method public abstract unloadSrc(Ljava/lang/String;)I
.end method

.method public abstract unregisterMediaPlayerAudioSpectrumObserver(Lio/agora/rtc2/audio/IAudioSpectrumObserver;)I
.end method
