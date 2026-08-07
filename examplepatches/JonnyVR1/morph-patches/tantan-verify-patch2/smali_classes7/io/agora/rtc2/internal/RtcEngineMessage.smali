.class public Lio/agora/rtc2/internal/RtcEngineMessage;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/internal/RtcEngineMessage$PVideoLayoutInfo;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLayout;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PAudioMetadataReceived;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PProxyConnect;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PUploadLogResult;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PPublishVideoStateChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PPublishAudioStateChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PSubscribeVideoStateChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PSubscribeAudioStateChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PPermissionError;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PEncryptionError;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PDownlinkNetworkInfoUpdated;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PUplinkNetworkInfoUpdated;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PRhythmPlayerStateChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PAudioMixingPositionChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PAudioMixingStateChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PAudioRoutingChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLocalFallbackStatus;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PNetworkTypeChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccMessage;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PConnectionState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PUserTransportStat;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PCrossChannelEvent;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PCrossChannelState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteVideoState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PUserInfoState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PPrivilegeWillExpire;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PStreamInjectedStatus;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PHostInStopped;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PHostInRequest;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PHostInResponse;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PInjectStreamConfig;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLiveTranscoding;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioMixedTrackConfiguration;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLocalLiveTranscoderConfiguration;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PStreamUnPublished;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PStreamPublished;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PStreamPublishEvent;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PStreamPublishState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLicenseVerifyFailed;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PClientRoleChangeFailed;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PClientRoleChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PActiveSpeaker;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PFirstLocalVideoFramePublished;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PFirstLocalAudioFrame;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PVideoCompositingLayout;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PStreamMessageError;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PStreamMessage;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PError;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaEngineEvent;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PCameraExposureAreaChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PCameraFocusAreaChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PFirstRemoteVideoDecoded;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PFirstLocalVideoFrame;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PFirstRemoteVideoFrame;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PFirstRemoteAudioDecoded;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PFirstRemoteAudioFrame;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PContentInspectConfig;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PSnapshotTaken;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PContentInspectResult;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteVideoStat;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PVideoNetOptions;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResAudioEffectFinished;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResLastmileProbeResult;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResLastmileQuality;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResNetworkQuality;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PUserStateChanged;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResUserState;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResUserOfflineEvent;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResUserJoinedEvent;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResJoinMedia;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResRtcStats;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResTransportQuality;,
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResAudioQuality;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toIntegerUserId(Ljava/lang/String;)I
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    long-to-int p0, v0

    return p0

    :catch_0
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static toIntegerUserId(I)J
    .locals 4

    .line 2
    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public static toStringUserId(I)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lio/agora/rtc2/internal/RtcEngineMessage;->toIntegerUserId(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
