.class public interface abstract Lcom/google/android/exoplayer2/ExoPlayer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/t;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/ExoPlayer$c;,
        Lcom/google/android/exoplayer2/ExoPlayer$b;,
        Lcom/google/android/exoplayer2/ExoPlayer$d;,
        Lcom/google/android/exoplayer2/ExoPlayer$e;,
        Lcom/google/android/exoplayer2/ExoPlayer$f;,
        Lcom/google/android/exoplayer2/ExoPlayer$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final DEFAULT_DETACH_SURFACE_TIMEOUT_MS:J = 0x7d0L

.field public static final DEFAULT_RELEASE_TIMEOUT_MS:J = 0x1f4L


# virtual methods
.method public abstract addAnalyticsListener(Ll/hk0;)V
.end method

.method public abstract addAudioOffloadListener(Lcom/google/android/exoplayer2/ExoPlayer$b;)V
.end method

.method public abstract synthetic addListener(Lcom/google/android/exoplayer2/t$d;)V
.end method

.method public abstract synthetic addMediaItem(ILcom/google/android/exoplayer2/n;)V
.end method

.method public abstract synthetic addMediaItem(Lcom/google/android/exoplayer2/n;)V
.end method

.method public abstract synthetic addMediaItems(ILjava/util/List;)V
.end method

.method public abstract synthetic addMediaItems(Ljava/util/List;)V
.end method

.method public abstract addMediaSource(ILcom/google/android/exoplayer2/source/i;)V
.end method

.method public abstract addMediaSource(Lcom/google/android/exoplayer2/source/i;)V
.end method

.method public abstract addMediaSources(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract addMediaSources(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract synthetic canAdvertiseSession()Z
.end method

.method public abstract clearAuxEffectInfo()V
.end method

.method public abstract clearCameraMotionListener(Ll/gb4;)V
.end method

.method public abstract synthetic clearMediaItems()V
.end method

.method public abstract clearVideoFrameMetadataListener(Ll/iel0;)V
.end method

.method public abstract synthetic clearVideoSurface()V
.end method

.method public abstract synthetic clearVideoSurface(Landroid/view/Surface;)V
    .param p1    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic clearVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .param p1    # Landroid/view/SurfaceHolder;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic clearVideoSurfaceView(Landroid/view/SurfaceView;)V
    .param p1    # Landroid/view/SurfaceView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic clearVideoTextureView(Landroid/view/TextureView;)V
    .param p1    # Landroid/view/TextureView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract createMessage(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;
.end method

.method public abstract synthetic decreaseDeviceVolume()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic decreaseDeviceVolume(I)V
.end method

.method public abstract experimentalIsSleepingForOffload()Z
.end method

.method public abstract experimentalSetOffloadSchedulingEnabled(Z)V
.end method

.method public abstract getAnalyticsCollector()Ll/dk0;
.end method

.method public abstract synthetic getApplicationLooper()Landroid/os/Looper;
.end method

.method public abstract synthetic getAudioAttributes()Lcom/google/android/exoplayer2/audio/a;
.end method

.method public abstract getAudioComponent()Lcom/google/android/exoplayer2/ExoPlayer$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getAudioDecoderCounters()Ll/jid;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getAudioFormat()Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getAudioSessionId()I
.end method

.method public abstract synthetic getAvailableCommands()Lcom/google/android/exoplayer2/t$b;
.end method

.method public abstract synthetic getBufferedPercentage()I
    .annotation build Landroidx/annotation/IntRange;
        from = 0x0L
        to = 0x64L
    .end annotation
.end method

.method public abstract synthetic getBufferedPosition()J
.end method

.method public abstract getClock()Ll/qa5;
.end method

.method public abstract synthetic getContentBufferedPosition()J
.end method

.method public abstract synthetic getContentDuration()J
.end method

.method public abstract synthetic getContentPosition()J
.end method

.method public abstract synthetic getCurrentAdGroupIndex()I
.end method

.method public abstract synthetic getCurrentAdIndexInAdGroup()I
.end method

.method public abstract synthetic getCurrentCues()Ll/qyb;
.end method

.method public abstract synthetic getCurrentLiveOffset()J
.end method

.method public abstract synthetic getCurrentManifest()Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract synthetic getCurrentMediaItem()Lcom/google/android/exoplayer2/n;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract synthetic getCurrentMediaItemIndex()I
.end method

.method public abstract synthetic getCurrentPeriodIndex()I
.end method

.method public abstract synthetic getCurrentPosition()J
.end method

.method public abstract synthetic getCurrentTimeline()Lcom/google/android/exoplayer2/c0;
.end method

.method public abstract getCurrentTrackGroups()Ll/ffj0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getCurrentTrackSelections()Ll/wfj0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic getCurrentTracks()Lcom/google/android/exoplayer2/d0;
.end method

.method public abstract synthetic getCurrentWindowIndex()I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getDeviceComponent()Lcom/google/android/exoplayer2/ExoPlayer$d;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic getDeviceInfo()Lcom/google/android/exoplayer2/h;
.end method

.method public abstract synthetic getDeviceVolume()I
    .annotation build Landroidx/annotation/IntRange;
        from = 0x0L
    .end annotation
.end method

.method public abstract synthetic getDuration()J
.end method

.method public abstract synthetic getMaxSeekToPreviousPosition()J
.end method

.method public abstract synthetic getMediaItemAt(I)Lcom/google/android/exoplayer2/n;
.end method

.method public abstract synthetic getMediaItemCount()I
.end method

.method public abstract synthetic getMediaMetadata()Lcom/google/android/exoplayer2/o;
.end method

.method public abstract synthetic getNextMediaItemIndex()I
.end method

.method public abstract synthetic getNextWindowIndex()I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getPauseAtEndOfMediaItems()Z
.end method

.method public abstract synthetic getPlayWhenReady()Z
.end method

.method public abstract getPlaybackLooper()Landroid/os/Looper;
.end method

.method public abstract synthetic getPlaybackParameters()Lcom/google/android/exoplayer2/s;
.end method

.method public abstract synthetic getPlaybackState()I
.end method

.method public abstract synthetic getPlaybackSuppressionReason()I
.end method

.method public abstract getPlayerError()Lcom/google/android/exoplayer2/ExoPlaybackException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public bridge synthetic getPlayerError()Lcom/google/android/exoplayer2/PlaybackException;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-interface {p0}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlayerError()Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract synthetic getPlaylistMetadata()Lcom/google/android/exoplayer2/o;
.end method

.method public abstract synthetic getPreviousMediaItemIndex()I
.end method

.method public abstract synthetic getPreviousWindowIndex()I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getRenderer(I)Lcom/google/android/exoplayer2/x;
.end method

.method public abstract getRendererCount()I
.end method

.method public abstract getRendererType(I)I
.end method

.method public abstract synthetic getRepeatMode()I
.end method

.method public abstract synthetic getSeekBackIncrement()J
.end method

.method public abstract synthetic getSeekForwardIncrement()J
.end method

.method public abstract getSeekParameters()Ll/nke0;
.end method

.method public abstract synthetic getShuffleModeEnabled()Z
.end method

.method public abstract getSkipSilenceEnabled()Z
.end method

.method public abstract synthetic getSurfaceSize()Ll/brf0;
.end method

.method public abstract getTextComponent()Lcom/google/android/exoplayer2/ExoPlayer$e;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic getTotalBufferedDuration()J
.end method

.method public abstract synthetic getTrackSelectionParameters()Ll/agj0;
.end method

.method public abstract getTrackSelector()Ll/cgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getVideoChangeFrameRateStrategy()I
.end method

.method public abstract getVideoComponent()Lcom/google/android/exoplayer2/ExoPlayer$f;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getVideoDecoderCounters()Ll/jid;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getVideoFormat()Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getVideoScalingMode()I
.end method

.method public abstract synthetic getVideoSize()Ll/zjl0;
.end method

.method public abstract synthetic getVolume()F
    .annotation build Landroidx/annotation/FloatRange;
        from = 0.0
        to = 1.0
    .end annotation
.end method

.method public abstract synthetic hasNext()Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic hasNextMediaItem()Z
.end method

.method public abstract synthetic hasNextWindow()Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic hasPrevious()Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic hasPreviousMediaItem()Z
.end method

.method public abstract synthetic hasPreviousWindow()Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic increaseDeviceVolume()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic increaseDeviceVolume(I)V
.end method

.method public abstract synthetic isCommandAvailable(I)Z
.end method

.method public abstract synthetic isCurrentMediaItemDynamic()Z
.end method

.method public abstract synthetic isCurrentMediaItemLive()Z
.end method

.method public abstract synthetic isCurrentMediaItemSeekable()Z
.end method

.method public abstract synthetic isCurrentWindowDynamic()Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic isCurrentWindowLive()Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic isCurrentWindowSeekable()Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic isDeviceMuted()Z
.end method

.method public abstract synthetic isLoading()Z
.end method

.method public abstract synthetic isPlaying()Z
.end method

.method public abstract synthetic isPlayingAd()Z
.end method

.method public abstract isTunnelingEnabled()Z
.end method

.method public abstract synthetic moveMediaItem(II)V
.end method

.method public abstract synthetic moveMediaItems(III)V
.end method

.method public abstract synthetic next()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic pause()V
.end method

.method public abstract synthetic play()V
.end method

.method public abstract synthetic prepare()V
.end method

.method public abstract prepare(Lcom/google/android/exoplayer2/source/i;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract prepare(Lcom/google/android/exoplayer2/source/i;ZZ)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic previous()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic release()V
.end method

.method public abstract removeAnalyticsListener(Ll/hk0;)V
.end method

.method public abstract removeAudioOffloadListener(Lcom/google/android/exoplayer2/ExoPlayer$b;)V
.end method

.method public abstract synthetic removeListener(Lcom/google/android/exoplayer2/t$d;)V
.end method

.method public abstract synthetic removeMediaItem(I)V
.end method

.method public abstract synthetic removeMediaItems(II)V
.end method

.method public abstract synthetic replaceMediaItem(ILcom/google/android/exoplayer2/n;)V
.end method

.method public abstract synthetic replaceMediaItems(IILjava/util/List;)V
.end method

.method public abstract synthetic seekBack()V
.end method

.method public abstract synthetic seekForward()V
.end method

.method public abstract synthetic seekTo(IJ)V
.end method

.method public abstract synthetic seekTo(J)V
.end method

.method public abstract synthetic seekToDefaultPosition()V
.end method

.method public abstract synthetic seekToDefaultPosition(I)V
.end method

.method public abstract synthetic seekToNext()V
.end method

.method public abstract synthetic seekToNextMediaItem()V
.end method

.method public abstract synthetic seekToNextWindow()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic seekToPrevious()V
.end method

.method public abstract synthetic seekToPreviousMediaItem()V
.end method

.method public abstract synthetic seekToPreviousWindow()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setAudioAttributes(Lcom/google/android/exoplayer2/audio/a;Z)V
.end method

.method public abstract setAudioSessionId(I)V
.end method

.method public abstract setAuxEffectInfo(Ll/wj1;)V
.end method

.method public abstract setCameraMotionListener(Ll/gb4;)V
.end method

.method public abstract synthetic setDeviceMuted(Z)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic setDeviceMuted(ZI)V
.end method

.method public abstract synthetic setDeviceVolume(I)V
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract synthetic setDeviceVolume(II)V
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
.end method

.method public abstract setForegroundMode(Z)V
.end method

.method public abstract setHandleAudioBecomingNoisy(Z)V
.end method

.method public abstract synthetic setMediaItem(Lcom/google/android/exoplayer2/n;)V
.end method

.method public abstract synthetic setMediaItem(Lcom/google/android/exoplayer2/n;J)V
.end method

.method public abstract synthetic setMediaItem(Lcom/google/android/exoplayer2/n;Z)V
.end method

.method public abstract synthetic setMediaItems(Ljava/util/List;)V
.end method

.method public abstract synthetic setMediaItems(Ljava/util/List;IJ)V
.end method

.method public abstract synthetic setMediaItems(Ljava/util/List;Z)V
.end method

.method public abstract setMediaSource(Lcom/google/android/exoplayer2/source/i;)V
.end method

.method public abstract setMediaSource(Lcom/google/android/exoplayer2/source/i;J)V
.end method

.method public abstract setMediaSource(Lcom/google/android/exoplayer2/source/i;Z)V
.end method

.method public abstract setMediaSources(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setMediaSources(Ljava/util/List;IJ)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;IJ)V"
        }
    .end annotation
.end method

.method public abstract setMediaSources(Ljava/util/List;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;Z)V"
        }
    .end annotation
.end method

.method public abstract setPauseAtEndOfMediaItems(Z)V
.end method

.method public abstract synthetic setPlayWhenReady(Z)V
.end method

.method public abstract synthetic setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V
.end method

.method public abstract synthetic setPlaybackSpeed(F)V
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            fromInclusive = false
        .end annotation
    .end param
.end method

.method public abstract synthetic setPlaylistMetadata(Lcom/google/android/exoplayer2/o;)V
.end method

.method public abstract setPreferredAudioDevice(Landroid/media/AudioDeviceInfo;)V
    .param p1    # Landroid/media/AudioDeviceInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation
.end method

.method public abstract setPriorityTaskManager(Lcom/google/android/exoplayer2/util/PriorityTaskManager;)V
    .param p1    # Lcom/google/android/exoplayer2/util/PriorityTaskManager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic setRepeatMode(I)V
.end method

.method public abstract setSeekParameters(Ll/nke0;)V
    .param p1    # Ll/nke0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic setShuffleModeEnabled(Z)V
.end method

.method public abstract setShuffleOrder(Ll/n8f0;)V
.end method

.method public abstract setSkipSilenceEnabled(Z)V
.end method

.method public abstract synthetic setTrackSelectionParameters(Ll/agj0;)V
.end method

.method public abstract setVideoChangeFrameRateStrategy(I)V
.end method

.method public abstract setVideoEffects(Ljava/util/List;)V
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ype;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setVideoFrameMetadataListener(Ll/iel0;)V
.end method

.method public abstract setVideoScalingMode(I)V
.end method

.method public abstract synthetic setVideoSurface(Landroid/view/Surface;)V
    .param p1    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic setVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .param p1    # Landroid/view/SurfaceHolder;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic setVideoSurfaceView(Landroid/view/SurfaceView;)V
    .param p1    # Landroid/view/SurfaceView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic setVideoTextureView(Landroid/view/TextureView;)V
    .param p1    # Landroid/view/TextureView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract synthetic setVolume(F)V
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param
.end method

.method public abstract setWakeMode(I)V
.end method

.method public abstract synthetic stop()V
.end method
