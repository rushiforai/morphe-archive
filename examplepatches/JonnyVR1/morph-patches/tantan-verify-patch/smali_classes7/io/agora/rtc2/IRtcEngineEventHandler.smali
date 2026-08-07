.class public abstract Lio/agora/rtc2/IRtcEngineEventHandler;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/IRtcEngineEventHandler$VideoLayoutInfo;,
        Lio/agora/rtc2/IRtcEngineEventHandler$VideoLayout;,
        Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;,
        Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;,
        Lio/agora/rtc2/IRtcEngineEventHandler$DownlinkNetworkInfo;,
        Lio/agora/rtc2/IRtcEngineEventHandler$UplinkNetworkInfo;,
        Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;,
        Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;,
        Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;,
        Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;,
        Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;,
        Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult;,
        Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;,
        Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;,
        Lio/agora/rtc2/IRtcEngineEventHandler$UserOfflineReason;,
        Lio/agora/rtc2/IRtcEngineEventHandler$ClientRole;,
        Lio/agora/rtc2/IRtcEngineEventHandler$VideoProfile;,
        Lio/agora/rtc2/IRtcEngineEventHandler$ErrorCode;,
        Lio/agora/rtc2/IRtcEngineEventHandler$WarnCode;,
        Lio/agora/rtc2/IRtcEngineEventHandler$Quality;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActiveSpeaker(I)V
    .locals 0

    return-void
.end method

.method public onAudioEffectFinished(I)V
    .locals 0

    return-void
.end method

.method public onAudioMetadataReceived(I[B)V
    .locals 0

    return-void
.end method

.method public onAudioMixingFinished()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public onAudioMixingPositionChanged(J)V
    .locals 0

    return-void
.end method

.method public onAudioMixingStateChanged(II)V
    .locals 0

    return-void
.end method

.method public onAudioPublishStateChanged(Ljava/lang/String;III)V
    .locals 0

    return-void
.end method

.method public onAudioQuality(IISS)V
    .locals 0

    return-void
.end method

.method public onAudioRouteChanged(I)V
    .locals 0

    return-void
.end method

.method public onAudioSubscribeStateChanged(Ljava/lang/String;IIII)V
    .locals 0

    return-void
.end method

.method public onAudioVolumeIndication([Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;I)V
    .locals 0

    return-void
.end method

.method public onCameraExposureAreaChanged(Landroid/graphics/Rect;)V
    .locals 0

    return-void
.end method

.method public onCameraFocusAreaChanged(Landroid/graphics/Rect;)V
    .locals 0

    return-void
.end method

.method public onCameraReady()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public onChannelMediaRelayStateChanged(II)V
    .locals 0

    return-void
.end method

.method public onClientRoleChangeFailed(II)V
    .locals 0

    return-void
.end method

.method public onClientRoleChanged(IILio/agora/rtc2/ClientRoleOptions;)V
    .locals 0

    return-void
.end method

.method public onConnectionBanned()V
    .locals 0

    return-void
.end method

.method public onConnectionInterrupted()V
    .locals 0

    return-void
.end method

.method public onConnectionLost()V
    .locals 0

    return-void
.end method

.method public onConnectionStateChanged(II)V
    .locals 0

    return-void
.end method

.method public onContentInspectResult(I)V
    .locals 0

    return-void
.end method

.method public onDownlinkNetworkInfoUpdated(Lio/agora/rtc2/IRtcEngineEventHandler$DownlinkNetworkInfo;)V
    .locals 0

    return-void
.end method

.method public onEncryptionError(I)V
    .locals 0

    return-void
.end method

.method public onError(I)V
    .locals 0

    return-void
.end method

.method public onFacePositionChanged(II[Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;)V
    .locals 0

    return-void
.end method

.method public onFirstLocalAudioFramePublished(I)V
    .locals 0

    return-void
.end method

.method public onFirstLocalVideoFrame(Lio/agora/rtc2/Constants$VideoSourceType;III)V
    .locals 0

    return-void
.end method

.method public onFirstLocalVideoFramePublished(Lio/agora/rtc2/Constants$VideoSourceType;I)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteAudioDecoded(II)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteAudioFrame(II)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteVideoDecoded(IIII)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteVideoFrame(IIII)V
    .locals 0

    return-void
.end method

.method public onIntraRequestReceived()V
    .locals 0

    return-void
.end method

.method public onJoinChannelSuccess(Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public onLastmileProbeResult(Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult;)V
    .locals 0

    return-void
.end method

.method public onLastmileQuality(I)V
    .locals 0

    return-void
.end method

.method public onLeaveChannel(Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)V
    .locals 0

    return-void
.end method

.method public onLicenseValidationFailure(I)V
    .locals 0

    return-void
.end method

.method public onLocalAudioStateChanged(II)V
    .locals 0

    return-void
.end method

.method public onLocalAudioStats(Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;)V
    .locals 0

    return-void
.end method

.method public onLocalPublishFallbackToAudioOnly(Z)V
    .locals 0

    return-void
.end method

.method public onLocalUserRegistered(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onLocalVideoStat(II)V
    .locals 0

    return-void
.end method

.method public onLocalVideoStateChanged(Lio/agora/rtc2/Constants$VideoSourceType;II)V
    .locals 0

    return-void
.end method

.method public onLocalVideoStats(Lio/agora/rtc2/Constants$VideoSourceType;Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;)V
    .locals 0

    return-void
.end method

.method public onLocalVideoTranscoderError(Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;I)V
    .locals 0

    return-void
.end method

.method public onMediaEngineLoadSuccess()V
    .locals 0

    return-void
.end method

.method public onMediaEngineStartCallSuccess()V
    .locals 0

    return-void
.end method

.method public onNetworkQuality(III)V
    .locals 0

    return-void
.end method

.method public onNetworkTypeChanged(I)V
    .locals 0

    return-void
.end method

.method public onPermissionError(I)V
    .locals 0

    return-void
.end method

.method public onProxyConnected(Ljava/lang/String;IILjava/lang/String;I)V
    .locals 0

    return-void
.end method

.method public onRejoinChannelSuccess(Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public onRemoteAudioStateChanged(IIII)V
    .locals 0

    return-void
.end method

.method public onRemoteAudioStats(Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;)V
    .locals 0

    return-void
.end method

.method public onRemoteAudioTransportStats(IIII)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public onRemoteSubscribeFallbackToAudioOnly(IZ)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoStat(IIII)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoStateChanged(IIII)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoStats(Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoTransportStats(IIII)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public onRequestToken()V
    .locals 0

    return-void
.end method

.method public onRhythmPlayerStateChanged(II)V
    .locals 0

    return-void
.end method

.method public onRtcStats(Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)V
    .locals 0

    return-void
.end method

.method public onRtmpStreamingEvent(Ljava/lang/String;I)V
    .locals 0

    return-void
.end method

.method public onRtmpStreamingStateChanged(Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public onSnapshotTaken(ILjava/lang/String;III)V
    .locals 0

    return-void
.end method

.method public onStreamMessage(II[B)V
    .locals 0

    return-void
.end method

.method public onStreamMessageError(IIIII)V
    .locals 0

    return-void
.end method

.method public onTokenPrivilegeWillExpire(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onTranscodedStreamLayoutInfo(ILio/agora/rtc2/IRtcEngineEventHandler$VideoLayoutInfo;)V
    .locals 0

    return-void
.end method

.method public onTranscodingUpdated()V
    .locals 0

    return-void
.end method

.method public onUplinkNetworkInfoUpdated(Lio/agora/rtc2/IRtcEngineEventHandler$UplinkNetworkInfo;)V
    .locals 0

    return-void
.end method

.method public onUploadLogResult(Ljava/lang/String;ZI)V
    .locals 0

    return-void
.end method

.method public onUserEnableLocalVideo(IZ)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public onUserEnableVideo(IZ)V
    .locals 0

    return-void
.end method

.method public onUserInfoUpdated(ILio/agora/rtc2/UserInfo;)V
    .locals 0

    return-void
.end method

.method public onUserJoined(II)V
    .locals 0

    return-void
.end method

.method public onUserMuteAudio(IZ)V
    .locals 0

    return-void
.end method

.method public onUserMuteVideo(IZ)V
    .locals 0

    return-void
.end method

.method public onUserOffline(II)V
    .locals 0

    return-void
.end method

.method public onUserStateChanged(II)V
    .locals 0

    return-void
.end method

.method public onVideoPublishStateChanged(Lio/agora/rtc2/Constants$VideoSourceType;Ljava/lang/String;III)V
    .locals 0

    return-void
.end method

.method public onVideoRenderingTracingResult(ILio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;)V
    .locals 0

    return-void
.end method

.method public onVideoSizeChanged(Lio/agora/rtc2/Constants$VideoSourceType;IIII)V
    .locals 0

    return-void
.end method

.method public onVideoStopped()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public onVideoSubscribeStateChanged(Ljava/lang/String;IIII)V
    .locals 0

    return-void
.end method

.method public onWlAccMessage(IILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onWlAccStats(Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;)V
    .locals 0

    return-void
.end method
