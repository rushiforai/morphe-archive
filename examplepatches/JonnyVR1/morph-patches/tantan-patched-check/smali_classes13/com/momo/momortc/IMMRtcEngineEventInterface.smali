.class public interface abstract Lcom/momo/momortc/IMMRtcEngineEventInterface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/momortc/IMMRtcEngineEventInterface$Quality;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$WarnCode;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$ErrorCode;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$VideoProfile;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$ClientRole;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$UserOfflineReason;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$RtcStats;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;,
        Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;
    }
.end annotation


# virtual methods
.method public abstract didOnKickedOut(Ljava/lang/String;III)V
.end method

.method public abstract onActiveSpeaker(I)V
.end method

.method public abstract onApiCallExecuted(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onAudioEffectFinished(I)V
.end method

.method public abstract onAudioMixingBegin()V
.end method

.method public abstract onAudioMixingError()V
.end method

.method public abstract onAudioMixingFinished()V
.end method

.method public abstract onAudioQuality(IISS)V
.end method

.method public abstract onAudioRouteChanged(I)V
.end method

.method public abstract onAudioVolumeIndication([Lcom/momo/momortc/AudioVolumeInfo;I)V
.end method

.method public abstract onCameraFocusAreaChanged(Landroid/graphics/Rect;)V
.end method

.method public abstract onCameraReady()V
.end method

.method public abstract onChannelList(Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onClientRoleChanged(II)V
.end method

.method public abstract onConnectionBanned()V
.end method

.method public abstract onConnectionInterrupted()V
.end method

.method public abstract onConnectionLost()V
.end method

.method public abstract onError(I)V
.end method

.method public abstract onFirstLocalAudioFrame(I)V
.end method

.method public abstract onFirstLocalVideoFrame(III)V
.end method

.method public abstract onFirstRemoteAudioFrame(II)V
.end method

.method public abstract onFirstRemoteVideoDecoded(IIII)V
.end method

.method public abstract onFirstRemoteVideoFrame(IIII)V
.end method

.method public abstract onHttpError(ILjava/lang/String;)V
.end method

.method public abstract onJoinChannelSuccess(Ljava/lang/String;II)V
.end method

.method public abstract onLastmileQuality(I)V
.end method

.method public abstract onLeaveChannel(Lcom/momo/momortc/live/MMRtcStats;)V
.end method

.method public abstract onLocalVideoQualityLimited(Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;)V
.end method

.method public abstract onLog(ILjava/lang/String;)V
.end method

.method public abstract onMediaEngineLoadSuccess()V
.end method

.method public abstract onMediaEngineStartCallSuccess()V
.end method

.method public abstract onMicrophoneEnabled(Z)V
.end method

.method public abstract onNetworkQuality(III)V
.end method

.method public abstract onReceiveSEI(ILjava/lang/String;)V
.end method

.method public abstract onRefreshRecordingServiceStatus(I)V
.end method

.method public abstract onRejoinChannelSuccess(Ljava/lang/String;II)V
.end method

.method public abstract onRemoteVideoFrame(ILcom/momo/rtcbase/VideoFrame;)V
.end method

.method public abstract onRemoteVideoStateChanged(II)V
.end method

.method public abstract onRequestToken()V
.end method

.method public abstract onRtcStats(Lcom/momo/momortc/live/MMRtcStats;)V
.end method

.method public abstract onStreamInjectedStatus(Ljava/lang/String;II)V
.end method

.method public abstract onStreamMessage(IILjava/lang/String;)V
.end method

.method public abstract onStreamMessageError(IIIII)V
.end method

.method public abstract onStreamPublished(Ljava/lang/String;I)V
.end method

.method public abstract onStreamUnpublished(Ljava/lang/String;)V
.end method

.method public abstract onTokenPrivilegeWillExpire(Ljava/lang/String;)V
.end method

.method public abstract onTranscodingUpdated()V
.end method

.method public abstract onUserEnableLocalVideo(IZ)V
.end method

.method public abstract onUserEnableVideo(IZ)V
.end method

.method public abstract onUserJoined(II)V
.end method

.method public abstract onUserMuteAudio(IZ)V
.end method

.method public abstract onUserMuteVideo(IZ)V
.end method

.method public abstract onUserOffline(II)V
.end method

.method public abstract onVideoSizeChanged(III)V
.end method

.method public abstract onVideoStopped()V
.end method

.method public abstract onWarning(I)V
.end method
