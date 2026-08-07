.class public abstract Lio/agora/rtc2/RtcEngineEx;
.super Lio/agora/rtc2/RtcEngine;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/RtcEngine;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract addHandlerEx(Lio/agora/rtc2/IRtcEngineEventHandler;Lio/agora/rtc2/RtcConnection;)V
.end method

.method public abstract addVideoWatermarkEx(Ljava/lang/String;Lio/agora/rtc2/video/WatermarkOptions;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract adjustRecordingSignalVolumeEx(ILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract adjustUserPlaybackSignalVolumeEx(IILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract clearVideoWatermarkEx(Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract createDataStreamEx(Lio/agora/rtc2/DataStreamConfig;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract createDataStreamEx(ZZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract enableAudioVolumeIndicationEx(IIZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract enableContentInspectEx(ZLio/agora/rtc2/video/ContentInspectConfig;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract enableDualStreamModeEx(ZLio/agora/rtc2/SimulcastStreamConfig;Lio/agora/rtc2/RtcConnection;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract enableEncryptionEx(ZLio/agora/rtc2/internal/EncryptionConfig;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract getCallIdEx(Lio/agora/rtc2/RtcConnection;)Ljava/lang/String;
.end method

.method public abstract getConnectionStateEx(Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract getUserInfoByUidEx(ILio/agora/rtc2/UserInfo;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract getUserInfoByUserAccountEx(Ljava/lang/String;Lio/agora/rtc2/UserInfo;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract joinChannelEx(Ljava/lang/String;Lio/agora/rtc2/RtcConnection;Lio/agora/rtc2/ChannelMediaOptions;Lio/agora/rtc2/IRtcEngineEventHandler;)I
.end method

.method public abstract joinChannelWithUserAccountEx(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/ChannelMediaOptions;Lio/agora/rtc2/IRtcEngineEventHandler;)I
.end method

.method public abstract leaveChannelEx(Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract leaveChannelEx(Lio/agora/rtc2/RtcConnection;Lio/agora/rtc2/LeaveChannelOptions;)I
.end method

.method public abstract leaveChannelWithUserAccountEx(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract leaveChannelWithUserAccountEx(Ljava/lang/String;Ljava/lang/String;Lio/agora/rtc2/LeaveChannelOptions;)I
.end method

.method public abstract muteAllRemoteAudioStreamsEx(ZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract muteAllRemoteVideoStreamsEx(ZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract muteLocalAudioStreamEx(ZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract muteLocalVideoStreamEx(ZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract muteRecordingSignalEx(ZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract muteRemoteAudioStreamEx(IZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract muteRemoteVideoStreamEx(IZLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract pauseAllChannelMediaRelayEx(Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract removeHandlerEx(Lio/agora/rtc2/IRtcEngineEventHandler;Lio/agora/rtc2/RtcConnection;)V
.end method

.method public abstract resumeAllChannelMediaRelayEx(Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract sendAudioMetadataEx([BLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract sendCustomReportMessageEx(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract sendStreamMessageEx(I[BLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setDualStreamModeEx(Lio/agora/rtc2/Constants$SimulcastStreamMode;Lio/agora/rtc2/SimulcastStreamConfig;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setHighPriorityUserListEx([IILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setParametersEx(Ljava/lang/String;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setRemoteRenderModeEx(IIILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setRemoteUserSpatialAudioParamsEx(ILio/agora/rtc2/SpatialAudioParams;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setRemoteVideoStreamTypeEx(IILio/agora/rtc2/RtcConnection;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setRemoteVideoStreamTypeEx(ILio/agora/rtc2/Constants$VideoStreamType;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setRemoteVideoSubscriptionOptionsEx(ILio/agora/rtc2/video/VideoSubscriptionOptions;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setRemoteVoicePositionEx(IDDLio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setSimulcastConfigEx(Lio/agora/rtc2/SimulcastConfig;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setSubscribeAudioAllowlistEx([ILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setSubscribeAudioBlocklistEx([ILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setSubscribeVideoAllowlistEx([ILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setSubscribeVideoBlocklistEx([ILio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setVideoEncoderConfigurationEx(Lio/agora/rtc2/video/VideoEncoderConfiguration;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract setupRemoteVideoEx(Lio/agora/rtc2/video/VideoCanvas;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract startMediaRenderingTracingEx(Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract startOrUpdateChannelMediaRelayEx(Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract startRtmpStreamWithTranscodingEx(Ljava/lang/String;Lio/agora/rtc2/live/LiveTranscoding;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract startRtmpStreamWithoutTranscodingEx(Ljava/lang/String;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract stopChannelMediaRelayEx(Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract stopRtmpStreamEx(Ljava/lang/String;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract takeSnapshotEx(Lio/agora/rtc2/RtcConnection;ILio/agora/rtc2/video/SnapshotConfig;)I
.end method

.method public abstract takeSnapshotEx(Lio/agora/rtc2/RtcConnection;ILjava/lang/String;)I
.end method

.method public abstract updateChannelMediaOptionsEx(Lio/agora/rtc2/ChannelMediaOptions;Lio/agora/rtc2/RtcConnection;)I
.end method

.method public abstract updateRtmpTranscodingEx(Lio/agora/rtc2/live/LiveTranscoding;Lio/agora/rtc2/RtcConnection;)I
.end method
