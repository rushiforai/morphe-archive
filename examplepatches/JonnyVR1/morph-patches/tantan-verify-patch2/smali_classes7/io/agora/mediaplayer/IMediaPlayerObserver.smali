.class public interface abstract Lio/agora/mediaplayer/IMediaPlayerObserver;
.super Ljava/lang/Object;


# virtual methods
.method public abstract onAgoraCDNTokenWillExpire()V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onAudioVolumeIndication(I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onMetaData(Lio/agora/mediaplayer/Constants$MediaPlayerMetadataType;[B)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlayBufferUpdated(J)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlayerCacheStats(Lio/agora/mediaplayer/data/CacheStatistics;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlayerEvent(Lio/agora/mediaplayer/Constants$MediaPlayerEvent;JLjava/lang/String;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlayerInfoUpdated(Lio/agora/mediaplayer/data/PlayerUpdatedInfo;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlayerPlaybackStats(Lio/agora/mediaplayer/data/PlayerPlaybackStats;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlayerSrcInfoChanged(Lio/agora/mediaplayer/data/SrcInfo;Lio/agora/mediaplayer/data/SrcInfo;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPlayerStateChanged(Lio/agora/mediaplayer/Constants$MediaPlayerState;Lio/agora/mediaplayer/Constants$MediaPlayerReason;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPositionChanged(JJ)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPreloadEvent(Ljava/lang/String;Lio/agora/mediaplayer/Constants$MediaPlayerPreloadEvent;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
