.class public abstract Lcom/ss/bytertc/engine/handler/IRTCEngineEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "DefaultLocale"
    }
.end annotation


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
.method public onActiveSpeaker(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onAudioAEDStateUpdate(Lcom/ss/bytertc/engine/type/AudioAEDType;)V
    .locals 0

    return-void
.end method

.method public onAudioDeviceStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/AudioDeviceType;II)V
    .locals 0

    return-void
.end method

.method public onAudioDeviceWarning(Ljava/lang/String;Lcom/ss/bytertc/engine/type/AudioDeviceType;I)V
    .locals 0

    return-void
.end method

.method public onAudioDumpStateChanged(Lcom/ss/bytertc/engine/type/AudioDumpStatus;)V
    .locals 0

    return-void
.end method

.method public onAudioFramePlayStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RtcUser;Lcom/ss/bytertc/engine/type/FirstFramePlayState;)V
    .locals 0

    return-void
.end method

.method public onAudioFrameSendStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RtcUser;Lcom/ss/bytertc/engine/type/FirstFrameSendState;)V
    .locals 0

    return-void
.end method

.method public onAudioMixingPlayingProgress(IJ)V
    .locals 0

    return-void
.end method

.method public onAudioPlaybackDeviceTestVolume(I)V
    .locals 0

    return-void
.end method

.method public onAudioRecordingStateUpdate(Lcom/ss/bytertc/engine/type/AudioRecordingState;Lcom/ss/bytertc/engine/type/AudioRecordingErrorCode;)V
    .locals 0

    return-void
.end method

.method public onAudioRouteChanged(Lcom/ss/bytertc/engine/data/AudioRoute;)V
    .locals 0

    return-void
.end method

.method public onAudioVADStateUpdate(Lcom/ss/bytertc/engine/data/AudioVADType;)V
    .locals 0

    return-void
.end method

.method public onCloudProxyConnected(I)V
    .locals 0

    return-void
.end method

.method public onConnectionStateChanged(II)V
    .locals 0

    return-void
.end method

.method public onDeadLockError(Lcom/ss/bytertc/engine/data/DeadLockMsg;)V
    .locals 0

    return-void
.end method

.method public onEchoTestResult(Lcom/ss/bytertc/engine/type/EchoTestResult;)V
    .locals 0

    return-void
.end method

.method public onEffectError(Lcom/ss/bytertc/engine/type/EffectErrorType;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onError(I)V
    .locals 0

    return-void
.end method

.method public onExperimentalCallback(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onExtensionAccessError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onExternalScreenFrameUpdate(Lcom/ss/bytertc/engine/data/FrameUpdateInfo;)V
    .locals 0

    return-void
.end method

.method public onFirstLocalAudioFrame(Lcom/ss/bytertc/engine/data/StreamIndex;)V
    .locals 0

    return-void
.end method

.method public onFirstLocalVideoFrameCaptured(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteAudioFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteVideoFrameDecoded(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteVideoFrameRendered(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    return-void
.end method

.method public onGetPeerOnlineStatus(Ljava/lang/String;I)V
    .locals 0

    return-void
.end method

.method public onHardwareEchoDetectionResult(Lcom/ss/bytertc/engine/type/HardwareEchoDetectionResult;)V
    .locals 0

    return-void
.end method

.method public onLicenseWillExpire(I)V
    .locals 0

    return-void
.end method

.method public onLocalAudioPropertiesReport([Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;)V
    .locals 0

    return-void
.end method

.method public onLocalAudioStateChanged(Lcom/ss/bytertc/engine/data/LocalAudioStreamState;Lcom/ss/bytertc/engine/data/LocalAudioStreamError;)V
    .locals 0

    return-void
.end method

.method public onLocalProxyStateChanged(Lcom/ss/bytertc/engine/type/LocalProxyType;Lcom/ss/bytertc/engine/type/LocalProxyState;Lcom/ss/bytertc/engine/type/LocalProxyError;)V
    .locals 0

    return-void
.end method

.method public onLocalVideoSizeChanged(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    return-void
.end method

.method public onLocalVideoStateChanged(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/type/LocalVideoStreamState;Lcom/ss/bytertc/engine/type/LocalVideoStreamError;)V
    .locals 0

    return-void
.end method

.method public onLogReport(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    return-void
.end method

.method public onLoggerMessage(Lcom/ss/bytertc/engine/utils/LogUtil$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    return-void
.end method

.method public onLoginResult(Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public onLogout(I)V
    .locals 0

    return-void
.end method

.method public onMixedStreamEvent(Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;)V
    .locals 0

    return-void
.end method

.method public onNetworkDetectionResult(Lcom/ss/bytertc/engine/type/NetworkDetectionLinkType;IIDII)V
    .locals 0

    return-void
.end method

.method public onNetworkDetectionStopped(Lcom/ss/bytertc/engine/type/NetworkDetectionStopReason;)V
    .locals 0

    return-void
.end method

.method public onNetworkTimeSynchronized()V
    .locals 0

    return-void
.end method

.method public onNetworkTypeChanged(I)V
    .locals 0

    return-void
.end method

.method public onPerformanceAlarms(Lcom/ss/bytertc/engine/type/PerformanceAlarmMode;Ljava/lang/String;Lcom/ss/bytertc/engine/type/PerformanceAlarmReason;Lcom/ss/bytertc/engine/type/SourceWantedData;)V
    .locals 0

    return-void
.end method

.method public onPushPublicStreamResult(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/PublicStreamErrorCode;)V
    .locals 0

    return-void
.end method

.method public onRecordingProgressUpdate(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/RecordingProgress;Lcom/ss/bytertc/engine/data/RecordingInfo;)V
    .locals 0

    return-void
.end method

.method public onRecordingStateUpdate(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/type/RecordingState;Lcom/ss/bytertc/engine/type/RecordingErrorCode;Lcom/ss/bytertc/engine/data/RecordingInfo;)V
    .locals 0

    return-void
.end method

.method public onRemoteAudioPropertiesReport([Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;I)V
    .locals 0

    return-void
.end method

.method public onRemoteAudioPropertiesReportEx([Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;)V
    .locals 0

    return-void
.end method

.method public onRemoteAudioStateChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/RemoteAudioState;Lcom/ss/bytertc/engine/data/RemoteAudioStateChangeReason;)V
    .locals 0

    return-void
.end method

.method public onRemoteRenderError(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/RenderError;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoSizeChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoStateChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/RemoteVideoState;Lcom/ss/bytertc/engine/type/RemoteVideoStateChangeReason;)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoSuperResolutionModeChanged(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoSuperResolutionMode;Lcom/ss/bytertc/engine/data/VideoSuperResolutionModeChangedReason;)V
    .locals 0

    return-void
.end method

.method public onSEIMessageReceived(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Ljava/nio/ByteBuffer;)V
    .locals 0

    return-void
.end method

.method public onSEIStreamUpdate(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/SEIStreamUpdateEvent;)V
    .locals 0

    return-void
.end method

.method public onScreenVideoFramePlayStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RtcUser;Lcom/ss/bytertc/engine/type/FirstFramePlayState;)V
    .locals 0

    return-void
.end method

.method public onScreenVideoFrameSendStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RtcUser;Lcom/ss/bytertc/engine/type/FirstFrameSendState;)V
    .locals 0

    return-void
.end method

.method public onServerMessageSendResult(JILjava/nio/ByteBuffer;)V
    .locals 0

    return-void
.end method

.method public onServerParamsSetResult(I)V
    .locals 0

    return-void
.end method

.method public onSimulcastSubscribeFallback(Lcom/ss/bytertc/engine/type/RemoteStreamSwitch;)V
    .locals 0

    return-void
.end method

.method public onSingleStreamEvent(Ljava/lang/String;Lcom/ss/bytertc/engine/live/SingleStreamTaskEvent;Lcom/ss/bytertc/engine/live/SingleStreamTaskErrorCode;)V
    .locals 0

    return-void
.end method

.method public onSnapshotTakenToFile(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Ljava/lang/String;IILcom/ss/bytertc/engine/type/SnapshotErrorCode;J)V
    .locals 0

    return-void
.end method

.method public onStreamSyncInfoReceived(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;Ljava/nio/ByteBuffer;)V
    .locals 0

    return-void
.end method

.method public onSysStats(Lcom/ss/bytertc/engine/SysStats;)V
    .locals 0

    return-void
.end method

.method public onUserBinaryMessageReceivedOutsideRoom(JLjava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserBinaryMessageReceivedOutsideRoom(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 2
    return-void
.end method

.method public onUserMessageReceivedOutsideRoom(JLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserMessageReceivedOutsideRoom(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2
    return-void
.end method

.method public onUserMessageSendResultOutsideRoom(JI)V
    .locals 0

    return-void
.end method

.method public onUserStartAudioCapture(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onUserStartVideoCapture(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onUserStopAudioCapture(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onUserStopVideoCapture(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onVideoDenoiseModeChanged(Lcom/ss/bytertc/engine/data/VideoDenoiseMode;Lcom/ss/bytertc/engine/data/VideoDenoiseModeChangedReason;)V
    .locals 0

    return-void
.end method

.method public onVideoDeviceStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/VideoDeviceType;II)V
    .locals 0

    return-void
.end method

.method public onVideoDeviceWarning(Ljava/lang/String;Lcom/ss/bytertc/engine/type/VideoDeviceType;I)V
    .locals 0

    return-void
.end method

.method public onVideoFramePlayStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RtcUser;Lcom/ss/bytertc/engine/type/FirstFramePlayState;)V
    .locals 0

    return-void
.end method

.method public onVideoFrameSendStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RtcUser;Lcom/ss/bytertc/engine/type/FirstFrameSendState;)V
    .locals 0

    return-void
.end method

.method public onWarning(I)V
    .locals 0

    return-void
.end method
