.class public abstract Lio/agora/rtc2/RtcEngine;
.super Ljava/lang/Object;


# static fields
.field protected static mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized create(Landroid/content/Context;Ljava/lang/String;Lio/agora/rtc2/IRtcEngineEventHandler;)Lio/agora/rtc2/RtcEngine;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 2
    const-class v0, Lio/agora/rtc2/RtcEngine;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    new-instance v1, Lio/agora/rtc2/RtcEngineConfig;

    invoke-direct {v1}, Lio/agora/rtc2/RtcEngineConfig;-><init>()V

    iput-object p0, v1, Lio/agora/rtc2/RtcEngineConfig;->mContext:Landroid/content/Context;

    iput-object p1, v1, Lio/agora/rtc2/RtcEngineConfig;->mAppId:Ljava/lang/String;

    iput-object p2, v1, Lio/agora/rtc2/RtcEngineConfig;->mEventHandler:Lio/agora/rtc2/IRtcEngineEventHandler;

    invoke-static {v1}, Lio/agora/rtc2/RtcEngine;->create(Lio/agora/rtc2/RtcEngineConfig;)Lio/agora/rtc2/RtcEngine;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized create(Lio/agora/rtc2/RtcEngineConfig;)Lio/agora/rtc2/RtcEngine;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-class v0, Lio/agora/rtc2/RtcEngine;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    if-eqz p0, :cond_3

    iget-object v3, p0, Lio/agora/rtc2/RtcEngineConfig;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lio/agora/rtc2/RtcEngineConfig;->mNativeLibPath:Ljava/lang/String;

    invoke-static {v3}, Lio/agora/rtc2/internal/RtcEngineImpl;->initializeNativeLibs(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    sget-object v3, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v3, :cond_1

    new-instance v3, Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-direct {v3, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;-><init>(Lio/agora/rtc2/RtcEngineConfig;)V

    sput-object v3, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v1, v2, v4, v5}, Lio/agora/rtc2/internal/RtcEngineImpl;->recordCreateEngineTimeStamp(JJ)V

    sget-object p0, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :try_start_1
    iget-object v1, p0, Lio/agora/rtc2/RtcEngineConfig;->mAppId:Ljava/lang/String;

    invoke-virtual {v3}, Lio/agora/rtc2/internal/RtcEngineImpl;->getAppId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->leaveChannel()I

    sget-object v1, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->doDestroy()V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    new-instance v3, Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-direct {v3, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;-><init>(Lio/agora/rtc2/RtcEngineConfig;)V

    sput-object v3, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v1, v2, v4, v5}, Lio/agora/rtc2/internal/RtcEngineImpl;->recordCreateEngineTimeStamp(JJ)V

    goto :goto_0

    :cond_2
    sget-object v1, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->reinitialize(Lio/agora/rtc2/RtcEngineConfig;)V

    :goto_0
    sget-object p0, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object p0

    :cond_3
    :goto_1
    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method public static declared-synchronized destroy()V
    .locals 2

    const-class v0, Lio/agora/rtc2/RtcEngine;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->doDestroy()V

    const/4 v1, 0x0

    sput-object v1, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public static getErrorDescription(I)Ljava/lang/String;
    .locals 1

    invoke-static {}, Lio/agora/rtc2/internal/RtcEngineImpl;->initializeNativeLibs()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    invoke-static {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->nativeGetErrorDescription(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMediaEngineVersion()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lio/agora/rtc2/internal/RtcEngineImpl;->initializeNativeLibs()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    invoke-static {}, Lio/agora/rtc2/internal/RtcEngineImpl;->nativeGetMediaEngineVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRecommendedEncoderType()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public static getSdkVersion()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lio/agora/rtc2/internal/RtcEngineImpl;->initializeNativeLibs()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    invoke-static {}, Lio/agora/rtc2/internal/RtcEngineImpl;->nativeGetSdkVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addHandler(Lio/agora/rtc2/IRtcEngineEventHandler;)V
    .locals 0

    sget-object p0, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->addHandler(Lio/agora/rtc2/IRtcEngineEventHandler;)V

    return-void
.end method

.method public abstract addVideoWatermark(Lio/agora/rtc2/video/AgoraImage;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract addVideoWatermark(Ljava/lang/String;Lio/agora/rtc2/video/WatermarkOptions;)I
.end method

.method public abstract adjustAudioMixingPlayoutVolume(I)I
.end method

.method public abstract adjustAudioMixingPublishVolume(I)I
.end method

.method public abstract adjustAudioMixingVolume(I)I
.end method

.method public abstract adjustCustomAudioPlayoutVolume(II)I
.end method

.method public abstract adjustCustomAudioPublishVolume(II)I
.end method

.method public abstract adjustPlaybackSignalVolume(I)I
.end method

.method public abstract adjustRecordingSignalVolume(I)I
.end method

.method public abstract adjustUserPlaybackSignalVolume(II)I
.end method

.method public abstract clearVideoWatermarks()I
.end method

.method public abstract complain(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract configRhythmPlayer(Lio/agora/rtc2/audio/AgoraRhythmPlayerConfig;)I
.end method

.method public abstract createCustomAudioTrack(Lio/agora/rtc2/Constants$AudioTrackType;Lio/agora/rtc2/audio/AudioTrackConfig;)I
.end method

.method public abstract createCustomEncodedVideoTrack(Lio/agora/rtc2/EncodedVideoTrackOptions;)I
.end method

.method public abstract createCustomVideoTrack()I
.end method

.method public abstract createDataStream(Lio/agora/rtc2/DataStreamConfig;)I
.end method

.method public abstract createDataStream(ZZ)I
.end method

.method public abstract createMediaPlayer()Lio/agora/mediaplayer/IMediaPlayer;
.end method

.method public abstract createMediaRecorder(Lio/agora/rtc2/RecorderStreamInfo;)Lio/agora/rtc2/AgoraMediaRecorder;
.end method

.method public abstract destroyCustomAudioTrack(I)I
.end method

.method public abstract destroyCustomEncodedVideoTrack(I)I
.end method

.method public abstract destroyCustomVideoTrack(I)I
.end method

.method public abstract destroyMediaRecorder(Lio/agora/rtc2/AgoraMediaRecorder;)V
.end method

.method public abstract disableAudio()I
.end method

.method public abstract disableAudioSpectrumMonitor()I
.end method

.method public abstract disableVideo()I
.end method

.method public abstract enableAudio()I
.end method

.method public abstract enableAudioSpectrumMonitor(I)I
.end method

.method public abstract enableAudioVolumeIndication(IIZ)I
.end method

.method public abstract enableContentInspect(ZLio/agora/rtc2/video/ContentInspectConfig;)I
.end method

.method public abstract enableCustomAudioLocalPlayback(IZ)I
.end method

.method public abstract enableDualStreamMode(Z)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract enableDualStreamMode(ZLio/agora/rtc2/SimulcastStreamConfig;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract enableEncryption(ZLio/agora/rtc2/internal/EncryptionConfig;)I
.end method

.method public abstract enableExtension(Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/ExtensionInfo;Z)I
.end method

.method public abstract enableExtension(Ljava/lang/String;Ljava/lang/String;Z)I
.end method

.method public abstract enableExtension(Ljava/lang/String;Ljava/lang/String;ZLio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract enableExternalAudioSourceLocalPlayback(Z)I
.end method

.method public abstract enableFaceDetection(Z)I
.end method

.method public abstract enableHighPerfWifiMode(Z)Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract enableInEarMonitoring(Z)I
.end method

.method public abstract enableInEarMonitoring(ZI)I
.end method

.method public abstract enableInstantMediaRendering()I
.end method

.method public abstract enableLocalAudio(Z)I
.end method

.method public abstract enableLocalVideo(Z)I
.end method

.method public abstract enableSoundPositionIndication(Z)I
.end method

.method public abstract enableSpatialAudio(Z)I
.end method

.method public abstract enableVideo()I
.end method

.method public abstract enableVideoImageSource(ZLio/agora/rtc2/video/ImageTrackOptions;)I
.end method

.method public abstract enableVirtualBackground(ZLio/agora/rtc2/video/VirtualBackgroundSource;Lio/agora/rtc2/video/SegmentationProperty;)I
.end method

.method public abstract enableVirtualBackground(ZLio/agora/rtc2/video/VirtualBackgroundSource;Lio/agora/rtc2/video/SegmentationProperty;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract enableVoiceAITuner(ZLio/agora/rtc2/Constants$VOICE_AI_TUNER_TYPE;)I
.end method

.method public abstract enableWebSdkInteroperability(Z)I
.end method

.method public abstract enableWirelessAccelerate(Z)I
.end method

.method public abstract getAudioDeviceInfo()Lio/agora/rtc2/DeviceInfo;
.end method

.method public abstract getAudioEffectManager()Lio/agora/rtc2/IAudioEffectManager;
.end method

.method public abstract getAudioMixingCurrentPosition()I
.end method

.method public abstract getAudioMixingDuration()I
.end method

.method public abstract getAudioMixingPlayoutVolume()I
.end method

.method public abstract getAudioMixingPublishVolume()I
.end method

.method public abstract getAudioTrackCount()I
.end method

.method public abstract getCallId()Ljava/lang/String;
.end method

.method public abstract getCameraMaxZoomFactor()F
.end method

.method public abstract getConnectionState()I
.end method

.method public abstract getCurrentMonotonicTimeInMs()J
.end method

.method public abstract getEffectCurrentPosition(I)I
.end method

.method public abstract getEffectDuration(Ljava/lang/String;)I
.end method

.method public abstract getEffectsVolume()D
.end method

.method public abstract getExtensionProperty(Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/ExtensionInfo;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getExtensionProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getExtensionProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/Constants$MediaSourceType;)Ljava/lang/String;
.end method

.method public abstract getFaceShapeAreaOptions(I)Lio/agora/rtc2/video/FaceShapeAreaOptions;
.end method

.method public abstract getFaceShapeAreaOptions(ILio/agora/rtc2/Constants$MediaSourceType;)Lio/agora/rtc2/video/FaceShapeAreaOptions;
.end method

.method public abstract getFaceShapeBeautyOptions()Lio/agora/rtc2/video/FaceShapeBeautyOptions;
.end method

.method public abstract getFaceShapeBeautyOptions(Lio/agora/rtc2/Constants$MediaSourceType;)Lio/agora/rtc2/video/FaceShapeBeautyOptions;
.end method

.method public abstract getH265Transcoder()Lio/agora/rtc2/IH265Transcoder;
.end method

.method public abstract getMediaPlayerCacheManager()Lio/agora/mediaplayer/IMediaPlayerCacheManager;
.end method

.method public abstract getNativeHandle()J
.end method

.method public abstract getNativeMediaPlayer(I)J
.end method

.method public abstract getNetworkType()I
.end method

.method public abstract getNtpWallTimeInMs()J
.end method

.method public abstract getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getParameters(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getUserInfoByUid(ILio/agora/rtc2/UserInfo;)I
.end method

.method public abstract getUserInfoByUserAccount(Ljava/lang/String;Lio/agora/rtc2/UserInfo;)I
.end method

.method public abstract getVolumeOfEffect(I)I
.end method

.method public abstract isCameraAutoFocusFaceModeSupported()Z
.end method

.method public abstract isCameraExposurePositionSupported()Z
.end method

.method public abstract isCameraExposureSupported()Z
.end method

.method public abstract isCameraFaceDetectSupported()Z
.end method

.method public abstract isCameraFocusSupported()Z
.end method

.method public abstract isCameraTorchSupported()Z
.end method

.method public abstract isCameraZoomSupported()Z
.end method

.method public abstract isFeatureAvailableOnDevice(I)Z
.end method

.method public abstract isSpeakerphoneEnabled()Z
.end method

.method public abstract isTextureEncodeSupported()Z
.end method

.method public abstract joinChannel(Ljava/lang/String;Ljava/lang/String;ILio/agora/rtc2/ChannelMediaOptions;)I
.end method

.method public abstract joinChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I
.end method

.method public abstract joinChannelWithUserAccount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract joinChannelWithUserAccount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/ChannelMediaOptions;)I
.end method

.method public abstract leaveChannel()I
.end method

.method public abstract leaveChannel(Lio/agora/rtc2/LeaveChannelOptions;)I
.end method

.method public abstract loadExtensionProvider(Ljava/lang/String;)I
.end method

.method public abstract monitorBluetoothHeadsetEvent(Z)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract monitorHeadsetEvent(Z)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract muteAllRemoteAudioStreams(Z)I
.end method

.method public abstract muteAllRemoteVideoStreams(Z)I
.end method

.method public abstract muteLocalAudioStream(Z)I
.end method

.method public abstract muteLocalVideoStream(Z)I
.end method

.method public abstract muteRecordingSignal(Z)I
.end method

.method public abstract muteRemoteAudioStream(IZ)I
.end method

.method public abstract muteRemoteVideoStream(IZ)I
.end method

.method public abstract pauseAllChannelMediaRelay()I
.end method

.method public abstract pauseAllEffects()I
.end method

.method public abstract pauseAudio()I
.end method

.method public abstract pauseAudioMixing()I
.end method

.method public abstract pauseEffect(I)I
.end method

.method public abstract playAllEffects(IDDDZ)I
.end method

.method public abstract playEffect(ILjava/lang/String;IDDDZ)I
.end method

.method public abstract playEffect(ILjava/lang/String;IDDDZI)I
.end method

.method public abstract preloadChannel(Ljava/lang/String;Ljava/lang/String;I)I
.end method

.method public abstract preloadChannelWithUserAccount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract preloadEffect(ILjava/lang/String;)I
.end method

.method public abstract preloadEffect(ILjava/lang/String;I)I
.end method

.method public abstract pullPlaybackAudioFrame(Ljava/nio/ByteBuffer;I)I
.end method

.method public abstract pullPlaybackAudioFrame([BI)I
.end method

.method public abstract pushExternalAudioFrame(Ljava/nio/ByteBuffer;JI)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract pushExternalAudioFrame(Ljava/nio/ByteBuffer;JIILio/agora/rtc2/Constants$BytesPerSample;I)I
.end method

.method public abstract pushExternalAudioFrame([BJ)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract pushExternalAudioFrame([BJIILio/agora/rtc2/Constants$BytesPerSample;I)I
.end method

.method public abstract pushExternalEncodedVideoFrame(Ljava/nio/ByteBuffer;Lio/agora/rtc2/video/EncodedVideoFrameInfo;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract pushExternalEncodedVideoFrameById(Ljava/nio/ByteBuffer;Lio/agora/rtc2/video/EncodedVideoFrameInfo;I)I
.end method

.method public abstract pushExternalVideoFrame(Lio/agora/base/VideoFrame;)Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract pushExternalVideoFrame(Lio/agora/rtc2/video/AgoraVideoFrame;)Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract pushExternalVideoFrameById(Lio/agora/base/VideoFrame;I)I
.end method

.method public abstract pushExternalVideoFrameById(Lio/agora/rtc2/video/AgoraVideoFrame;I)I
.end method

.method public abstract queryCameraFocalLengthCapability()[Lio/agora/rtc2/video/AgoraFocalLengthInfo;
.end method

.method public abstract queryCodecCapability()[Lio/agora/rtc2/video/CodecCapInfo;
.end method

.method public abstract queryDeviceScore()I
.end method

.method public abstract queryScreenCaptureCapability()I
.end method

.method public abstract rate(Ljava/lang/String;ILjava/lang/String;)I
.end method

.method public abstract registerAudioEncodedFrameObserver(Lio/agora/rtc2/internal/AudioEncodedFrameObserverConfig;Lio/agora/rtc2/IAudioEncodedFrameObserver;)I
.end method

.method public abstract registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I
.end method

.method public abstract registerAudioSpectrumObserver(Lio/agora/rtc2/audio/IAudioSpectrumObserver;)I
.end method

.method public abstract registerExtension(Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract registerFaceInfoObserver(Lio/agora/rtc2/video/IFaceInfoObserver;)I
.end method

.method public abstract registerLocalUserAccount(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract registerMediaMetadataObserver(Lio/agora/rtc2/IMetadataObserver;I)I
.end method

.method public abstract registerVideoEncodedFrameObserver(Lio/agora/rtc2/video/IVideoEncodedFrameObserver;)I
.end method

.method public abstract registerVideoFrameObserver(Lio/agora/rtc2/video/IVideoFrameObserver;)I
.end method

.method public removeHandler(Lio/agora/rtc2/IRtcEngineEventHandler;)V
    .locals 0

    sget-object p0, Lio/agora/rtc2/RtcEngine;->mInstance:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->removeHandler(Lio/agora/rtc2/IRtcEngineEventHandler;)V

    return-void
.end method

.method public abstract renewToken(Ljava/lang/String;)I
.end method

.method public abstract resumeAllChannelMediaRelay()I
.end method

.method public abstract resumeAllEffects()I
.end method

.method public abstract resumeAudio()I
.end method

.method public abstract resumeAudioMixing()I
.end method

.method public abstract resumeEffect(I)I
.end method

.method public abstract selectAudioTrack(I)I
.end method

.method public abstract sendAudioMetadata([B)I
.end method

.method public abstract sendCustomReportMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I
.end method

.method public abstract sendStreamMessage(I[B)I
.end method

.method public abstract setAINSMode(ZI)I
.end method

.method public abstract setAVSyncSource(Ljava/lang/String;I)I
.end method

.method public abstract setAdvancedAudioOptions(Lio/agora/rtc2/audio/AdvancedAudioOptions;)I
.end method

.method public abstract setAudioEffectParameters(III)I
.end method

.method public abstract setAudioEffectPreset(I)I
.end method

.method public abstract setAudioMixingDualMonoMode(Lio/agora/rtc2/Constants$AudioMixingDualMonoMode;)I
.end method

.method public abstract setAudioMixingPitch(I)I
.end method

.method public abstract setAudioMixingPlaybackSpeed(I)I
.end method

.method public abstract setAudioMixingPosition(I)I
.end method

.method public abstract setAudioProfile(I)I
.end method

.method public abstract setAudioProfile(II)I
.end method

.method public abstract setAudioScenario(I)I
.end method

.method public abstract setBeautyEffectOptions(ZLio/agora/rtc2/video/BeautyOptions;)I
.end method

.method public abstract setBeautyEffectOptions(ZLio/agora/rtc2/video/BeautyOptions;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract setCameraAutoFocusFaceModeEnabled(Z)I
.end method

.method public abstract setCameraCapturerConfiguration(Lio/agora/rtc2/video/CameraCapturerConfiguration;)I
.end method

.method public abstract setCameraExposureFactor(I)I
.end method

.method public abstract setCameraExposurePosition(FF)I
.end method

.method public abstract setCameraFocusPositionInPreview(FF)I
.end method

.method public abstract setCameraTorchOn(Z)I
.end method

.method public abstract setCameraZoomFactor(F)I
.end method

.method public abstract setChannelProfile(I)I
.end method

.method public abstract setClientRole(I)I
.end method

.method public abstract setClientRole(ILio/agora/rtc2/ClientRoleOptions;)I
.end method

.method public abstract setCloudProxy(I)I
.end method

.method public abstract setColorEnhanceOptions(ZLio/agora/rtc2/video/ColorEnhanceOptions;)I
.end method

.method public abstract setColorEnhanceOptions(ZLio/agora/rtc2/video/ColorEnhanceOptions;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract setDefaultAudioRoutetoSpeakerphone(Z)I
.end method

.method public abstract setDirectCdnStreamingAudioConfiguration(I)I
.end method

.method public abstract setDirectCdnStreamingVideoConfiguration(Lio/agora/rtc2/video/VideoEncoderConfiguration;)I
.end method

.method public abstract setDualStreamMode(Lio/agora/rtc2/Constants$SimulcastStreamMode;)I
.end method

.method public abstract setDualStreamMode(Lio/agora/rtc2/Constants$SimulcastStreamMode;Lio/agora/rtc2/SimulcastStreamConfig;)I
.end method

.method public abstract setEarMonitoringAudioFrameParameters(IIII)I
.end method

.method public abstract setEffectPosition(II)I
.end method

.method public abstract setEffectsVolume(D)I
.end method

.method public abstract setEnableSpeakerphone(Z)I
.end method

.method public abstract setExtensionProperty(Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/ExtensionInfo;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract setExtensionProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract setExtensionProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract setExtensionProviderProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract setExternalAudioSink(ZII)I
.end method

.method public abstract setExternalAudioSource(ZII)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setExternalAudioSource(ZIIZZ)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setExternalMediaProjection(Landroid/media/projection/MediaProjection;)I
.end method

.method public abstract setExternalRemoteEglContext(Ljava/lang/Object;)I
.end method

.method public abstract setExternalVideoSource(ZZLio/agora/rtc2/Constants$ExternalVideoSourceType;)I
.end method

.method public abstract setExternalVideoSource(ZZLio/agora/rtc2/Constants$ExternalVideoSourceType;Lio/agora/rtc2/EncodedVideoTrackOptions;)I
.end method

.method public abstract setFaceShapeAreaOptions(Lio/agora/rtc2/video/FaceShapeAreaOptions;)I
.end method

.method public abstract setFaceShapeAreaOptions(Lio/agora/rtc2/video/FaceShapeAreaOptions;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract setFaceShapeBeautyOptions(ZLio/agora/rtc2/video/FaceShapeBeautyOptions;)I
.end method

.method public abstract setFaceShapeBeautyOptions(ZLio/agora/rtc2/video/FaceShapeBeautyOptions;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract setFilterEffectOptions(ZLio/agora/rtc2/video/FilterEffectOptions;)I
.end method

.method public abstract setFilterEffectOptions(ZLio/agora/rtc2/video/FilterEffectOptions;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract setHeadphoneEQParameters(II)I
.end method

.method public abstract setHeadphoneEQPreset(I)I
.end method

.method public abstract setHighPriorityUserList([II)I
.end method

.method public abstract setHighQualityAudioParameters(ZZZ)I
.end method

.method public abstract setInEarMonitoringVolume(I)I
.end method

.method public abstract setLocalAccessPoint(Lio/agora/rtc2/proxy/LocalAccessPointConfiguration;)I
.end method

.method public abstract setLocalPublishFallbackOption(I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setLocalPublishFallbackOption(Lio/agora/rtc2/Constants$StreamFallbackOptions;)I
.end method

.method public abstract setLocalRenderMode(I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setLocalRenderMode(II)I
.end method

.method public abstract setLocalRenderTargetFps(Lio/agora/rtc2/Constants$VideoSourceType;I)I
.end method

.method public abstract setLocalVideoMirrorMode(I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setLocalVoiceEqualization(Lio/agora/rtc2/Constants$AUDIO_EQUALIZATION_BAND_FREQUENCY;I)I
.end method

.method public abstract setLocalVoiceFormant(D)I
.end method

.method public abstract setLocalVoicePitch(D)I
.end method

.method public abstract setLocalVoiceReverb(Lio/agora/rtc2/Constants$AUDIO_REVERB_TYPE;I)I
.end method

.method public abstract setLogFile(Ljava/lang/String;)I
.end method

.method public abstract setLogFileSize(J)I
.end method

.method public abstract setLogFilter(I)I
.end method

.method public abstract setLogLevel(I)I
.end method

.method public abstract setLowlightEnhanceOptions(ZLio/agora/rtc2/video/LowLightEnhanceOptions;)I
.end method

.method public abstract setLowlightEnhanceOptions(ZLio/agora/rtc2/video/LowLightEnhanceOptions;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract setMixedAudioFrameParameters(III)I
.end method

.method public abstract setParameters(Ljava/lang/String;)I
.end method

.method public abstract setPlaybackAudioFrameBeforeMixingParameters(II)I
.end method

.method public abstract setPlaybackAudioFrameParameters(IIII)I
.end method

.method public abstract setPreferHeadset(Z)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setRecordingAudioFrameParameters(IIII)I
.end method

.method public abstract setRemoteDefaultVideoStreamType(I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setRemoteDefaultVideoStreamType(Lio/agora/rtc2/Constants$VideoStreamType;)I
.end method

.method public abstract setRemoteRenderMode(II)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setRemoteRenderMode(III)I
.end method

.method public abstract setRemoteRenderTargetFps(I)I
.end method

.method public abstract setRemoteSubscribeFallbackOption(I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setRemoteSubscribeFallbackOption(Lio/agora/rtc2/Constants$StreamFallbackOptions;)I
.end method

.method public abstract setRemoteUserPriority(II)I
.end method

.method public abstract setRemoteUserSpatialAudioParams(ILio/agora/rtc2/SpatialAudioParams;)I
.end method

.method public abstract setRemoteVideoStreamType(II)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setRemoteVideoStreamType(ILio/agora/rtc2/Constants$VideoStreamType;)I
.end method

.method public abstract setRemoteVideoSubscriptionOptions(ILio/agora/rtc2/video/VideoSubscriptionOptions;)I
.end method

.method public abstract setRemoteVoicePosition(IDD)I
.end method

.method public abstract setRouteInCommunicationMode(I)I
.end method

.method public abstract setScreenCaptureScenario(Lio/agora/rtc2/Constants$ScreenScenarioType;)I
.end method

.method public abstract setSimulcastConfig(Lio/agora/rtc2/SimulcastConfig;)I
.end method

.method public abstract setSubscribeAudioAllowlist([I)I
.end method

.method public abstract setSubscribeAudioBlocklist([I)I
.end method

.method public abstract setSubscribeVideoAllowlist([I)I
.end method

.method public abstract setSubscribeVideoBlocklist([I)I
.end method

.method public abstract setVideoDenoiserOptions(ZLio/agora/rtc2/video/VideoDenoiserOptions;)I
.end method

.method public abstract setVideoDenoiserOptions(ZLio/agora/rtc2/video/VideoDenoiserOptions;Lio/agora/rtc2/Constants$MediaSourceType;)I
.end method

.method public abstract setVideoEncoderConfiguration(Lio/agora/rtc2/video/VideoEncoderConfiguration;)I
.end method

.method public abstract setVideoQoEPreference(Lio/agora/rtc2/Constants$QoEPreference;)I
.end method

.method public abstract setVideoQualityParameters(Z)I
.end method

.method public abstract setVideoScenario(Lio/agora/rtc2/Constants$VideoScenario;)I
.end method

.method public abstract setVoiceBeautifierParameters(III)I
.end method

.method public abstract setVoiceBeautifierPreset(I)I
.end method

.method public abstract setVoiceConversionParameters(III)I
.end method

.method public abstract setVoiceConversionPreset(I)I
.end method

.method public abstract setVolumeOfEffect(ID)I
.end method

.method public abstract setupAudioAttributes(Landroid/media/AudioAttributes;)I
.end method

.method public abstract setupLocalVideo(Lio/agora/rtc2/video/VideoCanvas;)I
.end method

.method public abstract setupRemoteVideo(Lio/agora/rtc2/video/VideoCanvas;)I
.end method

.method public abstract startAudioMixing(Ljava/lang/String;ZI)I
.end method

.method public abstract startAudioMixing(Ljava/lang/String;ZII)I
.end method

.method public abstract startAudioRecording(Lio/agora/rtc2/internal/AudioRecordingConfiguration;)I
.end method

.method public abstract startAudioRecording(Ljava/lang/String;I)I
.end method

.method public abstract startCameraCapture(Lio/agora/rtc2/Constants$VideoSourceType;Lio/agora/rtc2/video/CameraCapturerConfiguration;)I
.end method

.method public abstract startDirectCdnStreaming(Lio/agora/rtc2/IDirectCdnStreamingEventHandler;Ljava/lang/String;Lio/agora/rtc2/DirectCdnStreamingMediaOptions;)I
.end method

.method public abstract startEchoTest(Lio/agora/rtc2/EchoTestConfiguration;)I
.end method

.method public abstract startLastmileProbeTest(Lio/agora/rtc2/internal/LastmileProbeConfig;)I
.end method

.method public abstract startLocalAudioMixer(Lio/agora/rtc2/LocalAudioMixerConfiguration;)I
.end method

.method public abstract startLocalVideoTranscoder(Lio/agora/rtc2/LocalTranscoderConfiguration;)I
.end method

.method public abstract startMediaRenderingTracing()I
.end method

.method public abstract startOrUpdateChannelMediaRelay(Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;)I
.end method

.method public abstract startPlaybackDeviceTest(Ljava/lang/String;)I
.end method

.method public abstract startPreview()I
.end method

.method public abstract startPreview(Lio/agora/rtc2/Constants$VideoSourceType;)I
.end method

.method public abstract startRecordingDeviceTest(I)I
.end method

.method public abstract startRhythmPlayer(Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/audio/AgoraRhythmPlayerConfig;)I
.end method

.method public abstract startRtmpStreamWithTranscoding(Ljava/lang/String;Lio/agora/rtc2/live/LiveTranscoding;)I
.end method

.method public abstract startRtmpStreamWithoutTranscoding(Ljava/lang/String;)I
.end method

.method public abstract startScreenCapture(Lio/agora/rtc2/ScreenCaptureParameters;)I
.end method

.method public abstract stopAllEffects()I
.end method

.method public abstract stopAudioMixing()I
.end method

.method public abstract stopAudioRecording()I
.end method

.method public abstract stopCameraCapture(Lio/agora/rtc2/Constants$VideoSourceType;)I
.end method

.method public abstract stopChannelMediaRelay()I
.end method

.method public abstract stopDirectCdnStreaming()I
.end method

.method public abstract stopEchoTest()I
.end method

.method public abstract stopEffect(I)I
.end method

.method public abstract stopLastmileProbeTest()I
.end method

.method public abstract stopLocalAudioMixer()I
.end method

.method public abstract stopLocalVideoTranscoder()I
.end method

.method public abstract stopPlaybackDeviceTest()I
.end method

.method public abstract stopPreview()I
.end method

.method public abstract stopPreview(Lio/agora/rtc2/Constants$VideoSourceType;)I
.end method

.method public abstract stopRecordingDeviceTest()I
.end method

.method public abstract stopRhythmPlayer()I
.end method

.method public abstract stopRtmpStream(Ljava/lang/String;)I
.end method

.method public abstract stopScreenCapture()I
.end method

.method public abstract switchCamera()I
.end method

.method public abstract switchCamera(Ljava/lang/String;)I
.end method

.method public abstract takeSnapshot(ILio/agora/rtc2/video/SnapshotConfig;)I
.end method

.method public abstract takeSnapshot(ILjava/lang/String;)I
.end method

.method public abstract unRegisterAudioSpectrumObserver(Lio/agora/rtc2/audio/IAudioSpectrumObserver;)I
.end method

.method public abstract unloadAllEffects()I
.end method

.method public abstract unloadEffect(I)I
.end method

.method public abstract unregisterMediaMetadataObserver(Lio/agora/rtc2/IMetadataObserver;I)I
.end method

.method public abstract updateChannelMediaOptions(Lio/agora/rtc2/ChannelMediaOptions;)I
.end method

.method public abstract updateDirectCdnStreamingMediaOptions(Lio/agora/rtc2/DirectCdnStreamingMediaOptions;)I
.end method

.method public abstract updateLocalAudioMixerConfiguration(Lio/agora/rtc2/LocalAudioMixerConfiguration;)I
.end method

.method public abstract updateLocalTranscoderConfiguration(Lio/agora/rtc2/LocalTranscoderConfiguration;)I
.end method

.method public abstract updatePreloadChannelToken(Ljava/lang/String;)I
.end method

.method public abstract updateRtmpTranscoding(Lio/agora/rtc2/live/LiveTranscoding;)I
.end method

.method public abstract updateScreenCaptureParameters(Lio/agora/rtc2/ScreenCaptureParameters;)I
.end method

.method public abstract uploadLogFile()Ljava/lang/String;
.end method

.method public varargs abstract writeLog(ILjava/lang/String;[Ljava/lang/Object;)I
.end method
