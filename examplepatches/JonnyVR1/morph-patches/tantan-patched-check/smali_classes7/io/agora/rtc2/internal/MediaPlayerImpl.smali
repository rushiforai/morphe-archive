.class public Lio/agora/rtc2/internal/MediaPlayerImpl;
.super Ljava/lang/Object;

# interfaces
.implements Lio/agora/mediaplayer/IMediaPlayer;


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaPlayerImpl"


# instance fields
.field private final mNativeMediaPlayerSourceId:I

.field private final mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lio/agora/rtc2/internal/RtcEngineImpl;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iput p2, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    return-void
.end method


# virtual methods
.method public adjustPlayoutVolume(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerAdjustPlayoutVolume(II)I

    move-result p0

    return p0
.end method

.method public adjustPublishSignalVolume(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerAdjustPublishSignalVolume(II)I

    move-result p0

    return p0
.end method

.method public destroy()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerDestroy(I)I

    move-result p0

    return p0
.end method

.method public enableAutoSwitchAgoraCDN(Z)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerEnableAutoSwitchAgoraCDN(IZ)I

    move-result p0

    return p0
.end method

.method public getAgoraCDNLineCount()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetAgoraCDNLineCount(I)I

    move-result p0

    return p0
.end method

.method public getCurrentAgoraCDNIndex()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetCurrentAgoraCDNIndex(I)I

    move-result p0

    return p0
.end method

.method public getDuration()J
    .locals 2

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetDuration(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMediaPlayerId()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    return p0
.end method

.method public getMute()Z
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetMute(I)Z

    move-result p0

    return p0
.end method

.method public getPlayPosition()J
    .locals 2

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetPlayPosition(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getPlaySrc()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetPlaySrc(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getPlayoutVolume()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetPlayoutVolume(I)I

    move-result p0

    return p0
.end method

.method public getPublishSignalVolume()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetPublishSignalVolume(I)I

    move-result p0

    return p0
.end method

.method public getState()Lio/agora/mediaplayer/Constants$MediaPlayerState;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetState(I)I

    move-result p0

    invoke-static {p0}, Lio/agora/mediaplayer/Constants$MediaPlayerState;->getStateByValue(I)Lio/agora/mediaplayer/Constants$MediaPlayerState;

    move-result-object p0

    return-object p0
.end method

.method public getStreamCount()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetStreamCount(I)I

    move-result p0

    return p0
.end method

.method public getStreamInfo(I)Lio/agora/mediaplayer/data/MediaStreamInfo;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerGetStreamInfo(II)Lio/agora/mediaplayer/data/MediaStreamInfo;

    move-result-object p0

    return-object p0
.end method

.method public mute(Z)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerMute(IZ)I

    move-result p0

    return p0
.end method

.method public open(Landroid/net/Uri;J)I
    .locals 1

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v0}, Lio/agora/rtc2/internal/RtcEngineImpl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lio/agora/utils2/internal/CommonUtility;->getContentFilePath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2, p3}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerOpen(ILjava/lang/String;J)I

    move-result p0

    return p0

    :cond_1
    :goto_0
    sget-object p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->TAG:Ljava/lang/String;

    const-string p1, "Media Player Can not open incorrect Uri Param"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x2

    return p0
.end method

.method public open(Ljava/lang/String;J)I
    .locals 1

    .line 2
    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2, p3}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerOpen(ILjava/lang/String;J)I

    move-result p0

    return p0
.end method

.method public openWithAgoraCDNSrc(Ljava/lang/String;J)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2, p3}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerOpenWithAgoraCDNSrc(ILjava/lang/String;J)I

    move-result p0

    return p0
.end method

.method public openWithMediaSource(Lio/agora/mediaplayer/data/MediaPlayerSource;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerOpenWithMediaSource(ILio/agora/mediaplayer/data/MediaPlayerSource;)I

    move-result p0

    return p0
.end method

.method public pause()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerPause(I)I

    move-result p0

    return p0
.end method

.method public play()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerPlay(I)I

    move-result p0

    return p0
.end method

.method public playPreloadedSrc(Ljava/lang/String;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerPlayPreloadedSrc(ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public preloadSrc(Ljava/lang/String;J)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2, p3}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerPreloadSrc(ILjava/lang/String;J)I

    move-result p0

    return p0
.end method

.method public registerAudioFrameObserver(Lio/agora/mediaplayer/IMediaPlayerAudioFrameObserver;I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerRegisterAudioFrameObserver(ILio/agora/mediaplayer/IMediaPlayerAudioFrameObserver;I)I

    move-result p0

    return p0
.end method

.method public registerMediaPlayerAudioSpectrumObserver(Lio/agora/rtc2/audio/IAudioSpectrumObserver;I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->registerMediaPlayerAudioSpectrumObserver(ILio/agora/rtc2/audio/IAudioSpectrumObserver;I)I

    move-result p0

    return p0
.end method

.method public registerPlayerObserver(Lio/agora/mediaplayer/IMediaPlayerObserver;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerRegisterPlayerObserver(ILio/agora/mediaplayer/IMediaPlayerObserver;)I

    move-result p0

    return p0
.end method

.method public registerVideoFrameObserver(Lio/agora/mediaplayer/IMediaPlayerVideoFrameObserver;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerRegisterVideoFrameObserver(ILio/agora/mediaplayer/IMediaPlayerVideoFrameObserver;)I

    move-result p0

    return p0
.end method

.method public renewAgoraCDNSrcToken(Ljava/lang/String;J)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2, p3}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerRenewAgoraCDNSrcToken(ILjava/lang/String;J)I

    move-result p0

    return p0
.end method

.method public resume()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerResume(I)I

    move-result p0

    return p0
.end method

.method public seek(J)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSeek(IJ)I

    move-result p0

    return p0
.end method

.method public selectAudioTrack(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSelectAudioTrack(II)I

    move-result p0

    return p0
.end method

.method public selectInternalSubtitle(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSelectInternalSubtitle(II)I

    move-result p0

    return p0
.end method

.method public selectMultiAudioTrack(II)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSelectMultiAudioTrack(III)I

    move-result p0

    return p0
.end method

.method public setAudioDualMonoMode(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetAudioDualMonoMode(II)I

    move-result p0

    return p0
.end method

.method public setAudioPitch(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetAudioPitch(II)I

    move-result p0

    return p0
.end method

.method public setExternalSubtitle(Ljava/lang/String;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetExternalSubtitle(ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public setLoopCount(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetLoopCount(II)I

    move-result p0

    return p0
.end method

.method public setPlaybackSpeed(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerChangePlaybackSpeed(II)I

    move-result p0

    return p0
.end method

.method public setPlayerOption(Ljava/lang/String;I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetPlayerOption(ILjava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public setPlayerOptionString(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetPlayerOptionString(ILjava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public setRenderMode(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetRenderMode(II)I

    move-result p0

    return p0
.end method

.method public setSpatialAudioParams(Lio/agora/rtc2/SpatialAudioParams;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetSpatialAudioParams(ILio/agora/rtc2/SpatialAudioParams;)I

    move-result p0

    return p0
.end method

.method public setView(Landroid/view/View;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSetView(ILandroid/view/View;)I

    move-result p0

    return p0
.end method

.method public stop()I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerStop(I)I

    move-result p0

    return p0
.end method

.method public switchAgoraCDNLineByIndex(I)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSwitchAgoraCDNLineByIndex(II)I

    move-result p0

    return p0
.end method

.method public switchAgoraCDNSrc(Ljava/lang/String;Z)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSwitchAgoraCDNSrc(ILjava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public switchSrc(Ljava/lang/String;Z)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerSwitchSrc(ILjava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public takeScreenshot(Ljava/lang/String;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerTakeScreenshot(ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public unRegisterPlayerObserver(Lio/agora/mediaplayer/IMediaPlayerObserver;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerUnRegisterPlayerObserver(ILio/agora/mediaplayer/IMediaPlayerObserver;)I

    move-result p0

    return p0
.end method

.method public unloadSrc(Ljava/lang/String;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerUnloadSrc(ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public unregisterMediaPlayerAudioSpectrumObserver(Lio/agora/rtc2/audio/IAudioSpectrumObserver;)I
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerImpl;->mNativeMediaPlayerSourceId:I

    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->unregisterMediaPlayerAudioSpectrumObserver(ILio/agora/rtc2/audio/IAudioSpectrumObserver;)I

    move-result p0

    return p0
.end method
