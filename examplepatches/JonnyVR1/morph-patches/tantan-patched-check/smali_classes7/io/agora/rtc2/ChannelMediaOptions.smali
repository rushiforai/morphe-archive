.class public Lio/agora/rtc2/ChannelMediaOptions;
.super Ljava/lang/Object;


# instance fields
.field public audienceLatencyLevel:Ljava/lang/Integer;

.field public audioDelayMs:Ljava/lang/Integer;

.field public autoSubscribeAudio:Ljava/lang/Boolean;

.field public autoSubscribeVideo:Ljava/lang/Boolean;

.field public channelProfile:Ljava/lang/Integer;

.field public clientRoleType:Ljava/lang/Integer;

.field public customVideoTrackId:Ljava/lang/Integer;

.field public defaultVideoStreamType:Ljava/lang/Integer;

.field public enableAudioRecordingOrPlayout:Ljava/lang/Boolean;

.field public enableBuiltInMediaEncryption:Ljava/lang/Boolean;

.field public isAudioFilterable:Ljava/lang/Boolean;

.field public isInteractiveAudience:Ljava/lang/Boolean;

.field public mediaPlayerAudioDelayMs:Ljava/lang/Integer;

.field public parameters:Ljava/lang/String;

.field public publishCameraTrack:Ljava/lang/Boolean;

.field public publishCustomAudioTrack:Ljava/lang/Boolean;

.field public publishCustomAudioTrackId:Ljava/lang/Integer;

.field public publishCustomVideoTrack:Ljava/lang/Boolean;

.field public publishEncodedVideoTrack:Ljava/lang/Boolean;

.field public publishFourthCameraTrack:Ljava/lang/Boolean;

.field public publishLipSyncTrack:Ljava/lang/Boolean;

.field public publishMediaPlayerAudioTrack:Ljava/lang/Boolean;

.field public publishMediaPlayerId:Ljava/lang/Integer;

.field public publishMediaPlayerVideoTrack:Ljava/lang/Boolean;

.field public publishMicrophoneTrack:Ljava/lang/Boolean;

.field public publishMixedAudioTrack:Ljava/lang/Boolean;

.field public publishRhythmPlayerTrack:Ljava/lang/Boolean;

.field public publishScreenCaptureAudio:Ljava/lang/Boolean;

.field public publishScreenCaptureVideo:Ljava/lang/Boolean;

.field public publishSecondaryCameraTrack:Ljava/lang/Boolean;

.field public publishThirdCameraTrack:Ljava/lang/Boolean;

.field public publishTranscodedVideoTrack:Ljava/lang/Boolean;

.field public startPreview:Ljava/lang/Boolean;

.field public token:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/ChannelMediaOptions;->clientRoleType:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public getAudienceLatencyLevel()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->audienceLatencyLevel:Ljava/lang/Integer;

    return-object p0
.end method

.method public getAudioDelayMs()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->audioDelayMs:Ljava/lang/Integer;

    return-object p0
.end method

.method public getChannelProfile()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->channelProfile:Ljava/lang/Integer;

    return-object p0
.end method

.method public getClientRoleType()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->clientRoleType:Ljava/lang/Integer;

    return-object p0
.end method

.method public getCustomVideoTrackId()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->customVideoTrackId:Ljava/lang/Integer;

    return-object p0
.end method

.method public getDefaultVideoStreamType()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->defaultVideoStreamType:Ljava/lang/Integer;

    return-object p0
.end method

.method public getIsAudioFilterable()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->isAudioFilterable:Ljava/lang/Boolean;

    return-object p0
.end method

.method public getMediaPlayerAudioDelayMs()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->mediaPlayerAudioDelayMs:Ljava/lang/Integer;

    return-object p0
.end method

.method public getParameters()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->parameters:Ljava/lang/String;

    return-object p0
.end method

.method public getPublishCustomAudioTrackId()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishCustomAudioTrackId:Ljava/lang/Integer;

    return-object p0
.end method

.method public getPublishMediaPlayerId()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMediaPlayerId:Ljava/lang/Integer;

    return-object p0
.end method

.method public getPublishRhythmPlayerTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishRhythmPlayerTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public getToken()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->token:Ljava/lang/String;

    return-object p0
.end method

.method public isAutoSubscribeAudio()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->autoSubscribeAudio:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isAutoSubscribeVideo()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->autoSubscribeVideo:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isEnableAudioRecordingOrPlayout()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->enableAudioRecordingOrPlayout:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isEnableBuiltInMediaEncryption()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->enableBuiltInMediaEncryption:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isInteractiveAudience()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->isInteractiveAudience:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishCameraTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishCameraTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishCustomAudioTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishCustomAudioTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishCustomVideoTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishCustomVideoTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishEncodedVideoTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishEncodedVideoTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishFourthCameraTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishFourthCameraTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishLipSyncTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishLipSyncTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishMediaPlayerAudioTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMediaPlayerAudioTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishMediaPlayerVideoTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMediaPlayerVideoTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishMicrophoneTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMicrophoneTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishMixedAudioTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMixedAudioTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishScreenCaptureAudio()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishScreenCaptureAudio:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishScreenCaptureVideo()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishScreenCaptureVideo:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishSecondaryCameraTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishSecondaryCameraTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishThirdCameraTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishThirdCameraTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isPublishTranscodedVideoTrack()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishTranscodedVideoTrack:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isStartPreview()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->startPreview:Ljava/lang/Boolean;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "publishCameraTrack="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishCameraTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishSecondaryCameraTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishSecondaryCameraTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishThirdCameraTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishThirdCameraTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishFourthCameraTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishFourthCameraTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishScreenCaptureVideo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishScreenCaptureVideo:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishScreenCaptureAudio="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishScreenCaptureAudio:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishCustomAudioTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishCustomAudioTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishCustomAudioTrackId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishCustomAudioTrackId:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishCustomVideoTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishCustomVideoTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishEncodedVideoTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishEncodedVideoTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishMediaPlayerAudioTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMediaPlayerAudioTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishMediaPlayerVideoTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMediaPlayerVideoTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishMixedAudioTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMixedAudioTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishTranscodedVideoTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishTranscodedVideoTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishLipSyncdVideoTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishLipSyncTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishMediaPlayerId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMediaPlayerId:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishMicrophoneTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishMicrophoneTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " autoSubscribeAudio="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->autoSubscribeAudio:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " autoSubscribeVideo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->autoSubscribeVideo:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " startPrevie="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->startPreview:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " clientRoleType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->clientRoleType:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " audienceLatencyLevel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->audienceLatencyLevel:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " defaultVideoStreamType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->defaultVideoStreamType:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " channelProfile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->channelProfile:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " audioDelayMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->audioDelayMs:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " enableBuiltInMediaEncryption="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->enableBuiltInMediaEncryption:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " publishRhythmPlayerTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->publishRhythmPlayerTrack:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " isAudioFilterable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->isAudioFilterable:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " mediaPlayerAudioDelayMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->mediaPlayerAudioDelayMs:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " customVideoTrackId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->customVideoTrackId:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " isInteractiveAudience="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ChannelMediaOptions;->isInteractiveAudience:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " parameters="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lio/agora/rtc2/ChannelMediaOptions;->parameters:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
