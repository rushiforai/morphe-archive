.class public abstract Lcom/momo/momortc/MMRtcEngine;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MMRTC_LOG_MSGAddUrl:I = 0x14

.field public static final MMRTC_LOG_MSGChangeRole:I = 0x24

.field public static final MMRTC_LOG_MSGHeart:I = 0xd

.field public static final MMRTC_LOG_MSGJoin:I = 0xe

.field public static final MMRTC_LOG_MSGKeyExpired:I = 0x22

.field public static final MMRTC_LOG_MSGKeyUpdate:I = 0x23

.field public static final MMRTC_LOG_MSGLOGIN:I = 0xb

.field public static final MMRTC_LOG_MSGLeave:I = 0x10

.field public static final MMRTC_LOG_MSGLocalAudioMute:I = 0x17

.field public static final MMRTC_LOG_MSGLocalVideoMute:I = 0x19

.field public static final MMRTC_LOG_MSGONLogin:I = 0xc

.field public static final MMRTC_LOG_MSGOnChangeRole:I = 0x25

.field public static final MMRTC_LOG_MSGOnJoin:I = 0xf

.field public static final MMRTC_LOG_MSGOnLeave:I = 0x11

.field public static final MMRTC_LOG_MSGOnReJoin:I = 0x1c

.field public static final MMRTC_LOG_MSGOnStartPK:I = 0x1e

.field public static final MMRTC_LOG_MSGOnStopPK:I = 0x20

.field public static final MMRTC_LOG_MSGPeerJoin:I = 0x12

.field public static final MMRTC_LOG_MSGPeerLeave:I = 0x13

.field public static final MMRTC_LOG_MSGPeerLost:I = 0x21

.field public static final MMRTC_LOG_MSGReJoin:I = 0x1b

.field public static final MMRTC_LOG_MSGRemoteAudioMute:I = 0x18

.field public static final MMRTC_LOG_MSGRemoteVideoMute:I = 0x1a

.field public static final MMRTC_LOG_MSGRemoveUrl:I = 0x15

.field public static final MMRTC_LOG_MSGStartPK:I = 0x1d

.field public static final MMRTC_LOG_MSGStopPK:I = 0x1f

.field public static final MMRTC_LOG_MSGTranscoding:I = 0x16

.field public static final MMRTC_LOG_PULL_WATCH:I = 0x4

.field public static final MMRTC_LOG_PUSH_START:I = 0x1

.field public static final MMRTC_LOG_PUSH_STOP:I = 0x2

.field public static final MMRTC_LOG_PUSH_WATCH:I = 0x3

.field public static final MMRTC_LOG_RECONNECT:I = 0x5

.field public static final MMRTC_Log_MsgOnLicked:I = 0x26

.field public static MMRTC_ROLE_AUDIENCE:I = 0x2

.field public static MMRTC_ROLE_BROADCASTER:I = 0x1

.field private static mInstance:Lcom/momo/momortc/MMRtcEngineImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static CreateRendererView(Landroid/content/Context;)Lcom/momo/rtcbase/SurfaceViewRenderer;
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/rtcbase/SurfaceViewRenderer;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/SurfaceViewRenderer;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static declared-synchronized create(Landroid/content/Context;Ljava/lang/String;Lcom/momo/momortc/IMMRtcEngineEventInterface;)Lcom/momo/momortc/MMRtcEngine;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-class v0, Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    :try_start_0
    invoke-static {}, Lcom/momo/momortc/MMRtcEngineImpl;->initializeNativeLibs()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    sget-object v1, Lcom/momo/momortc/MMRtcEngine;->mInstance:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/momo/momortc/IMMRtcEngineEventInterface;)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/momo/momortc/MMRtcEngine;->mInstance:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual {v1, p0, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->reinitialize(Landroid/content/Context;Ljava/lang/String;Lcom/momo/momortc/IMMRtcEngineEventInterface;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    sget-object p0, Lcom/momo/momortc/MMRtcEngine;->mInstance:Lcom/momo/momortc/MMRtcEngineImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit v0

    .line 32
    return-object p0

    .line 33
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p0

    .line 35
    :cond_1
    monitor-exit v0

    .line 36
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public static declared-synchronized destroy()V
    .locals 2

    .line 1
    const-class v0, Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/momo/momortc/MMRtcEngine;->mInstance:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/momo/momortc/MMRtcEngineImpl;->doDestroy()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    sput-object v1, Lcom/momo/momortc/MMRtcEngine;->mInstance:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method public static getErrorDescription(I)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/momortc/MMRtcEngineImpl;->initializeNativeLibs()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeGetErrorDescription(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static getInstance()Lcom/momo/momortc/MMRtcEngineImpl;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/momortc/MMRtcEngine;->mInstance:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getMediaEngineVersion()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/momortc/MMRtcEngineImpl;->initializeNativeLibs()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeGetChatEngineVersion()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    return-object v0
.end method

.method public static getRecommendedEncoderType()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static getSdkVersion()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/momortc/MMRtcEngineImpl;->initializeNativeLibs()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeGetSdkVersion()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    return-object v0
.end method


# virtual methods
.method public abstract IsInEarMonitoring()Z
.end method

.method public addHandler(Lcom/momo/momortc/IMMRtcEngineEventInterface;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/momo/momortc/MMRtcEngine;->mInstance:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->addHandler(Lcom/momo/momortc/IMMRtcEngineEventInterface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract addPublishStreamUrl(Ljava/lang/String;Z)I
.end method

.method public abstract adjustAudioMixingVolume(F)I
.end method

.method public abstract adjustPlaybackSignalVolume(J)I
.end method

.method public abstract adjustRecordingSignalVolume(J)I
.end method

.method public abstract clearVideoWatermarks()I
.end method

.method public abstract complain(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract createDataStream(ZZ)I
.end method

.method public abstract disableAudio()I
.end method

.method public abstract disableLastmileTest()I
.end method

.method public abstract disableVideo()I
.end method

.method public abstract enableAudio()I
.end method

.method public abstract enableAudioPreProcess(Z)I
.end method

.method public abstract enableAudioQualityIndication(Z)I
.end method

.method public abstract enableAudioVolumeIndication(JJ)I
.end method

.method public abstract enableDualStreamMode(Z)I
.end method

.method public abstract enableHighPerfWifiMode(Z)Z
.end method

.method public abstract enableInEarMonitoring(Z)I
.end method

.method public abstract enableLastmileTest()I
.end method

.method public abstract enableLocalAudio(Z)I
.end method

.method public abstract enableLocalVideo(Z)I
.end method

.method public abstract enableMiddleGroundSignal(Z)V
.end method

.method public abstract enableRecap(I)I
.end method

.method public abstract enableTransportQualityIndication(Z)I
.end method

.method public abstract enableVideo()I
.end method

.method public abstract enableWebSdkInteroperability(Z)I
.end method

.method public abstract forwardDownlinkAudio(JZ)I
.end method

.method public abstract getAudioEffectManager()Lcom/momo/momortc/IAudioEffectManager;
.end method

.method public abstract getAudioMixingCurrentPosition()J
.end method

.method public abstract getAudioMixingDuration()J
.end method

.method public abstract getCallId()Ljava/lang/String;
.end method

.method public abstract getCameraMaxZoomFactor()F
.end method

.method public abstract getNativeHandle()J
.end method

.method public abstract getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getParameters(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getRoomList(J)V
.end method

.method public abstract getSabineEnable()I
.end method

.method public abstract isCameraAutoFocusFaceModeSupported()Z
.end method

.method public abstract isCameraFocusSupported()Z
.end method

.method public abstract isCameraTorchSupported()Z
.end method

.method public abstract isCameraZoomSupported()Z
.end method

.method public abstract isSpeakerphoneEnabled()Z
.end method

.method public abstract isTextureEncodeSupported()Z
.end method

.method public abstract joinChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)I
.end method

.method public abstract leaveChannel()I
.end method

.method public abstract makeQualityReportUrl(Ljava/lang/String;III)Ljava/lang/String;
.end method

.method public abstract monitorAudioRouteChange(Z)I
.end method

.method public abstract monitorConnectionEvent(Z)V
.end method

.method public abstract muteAllRemoteAudioStreams(Z)I
.end method

.method public abstract muteAllRemoteVideoStreams(Z)I
.end method

.method public abstract muteLocalAudioStream(Z)I
.end method

.method public abstract muteLocalMsgStream(Z)I
.end method

.method public abstract muteLocalVideoStream(Z)I
.end method

.method public abstract muteRemoteAudioStream(JZ)I
.end method

.method public abstract muteRemoteMsgStream(JZ)I
.end method

.method public abstract muteRemoteVideoStream(IZ)I
.end method

.method public abstract pauseAudio()I
.end method

.method public abstract pauseAudioMixing()I
.end method

.method public abstract playRecap()I
.end method

.method public abstract pushExternalAudioFrame([BJ)I
.end method

.method public abstract pushExternalVideoFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/EglBase$Context;)Z
.end method

.method public abstract rate(Ljava/lang/String;ILjava/lang/String;)I
.end method

.method public abstract refreshRecordingServiceStatus()I
.end method

.method public abstract registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I
.end method

.method public abstract removeInjectStreamUrl(Ljava/lang/String;)I
.end method

.method public abstract removePublishStreamUrl(Ljava/lang/String;)I
.end method

.method public abstract renewToken(Ljava/lang/String;)I
.end method

.method public abstract resumeAudio()I
.end method

.method public abstract resumeAudioMixing()I
.end method

.method public abstract sendStreamMessage(ILjava/lang/String;)I
.end method

.method public abstract setApiCallMode(I)I
.end method

.method public abstract setAudioAECEnable(Z)I
.end method

.method public abstract setAudioAGCEnable(Z)I
.end method

.method public abstract setAudioANSEnable(Z)I
.end method

.method public abstract setAudioANSLevel(I)I
.end method

.method public abstract setAudioLevel(I)I
.end method

.method public abstract setAudioMixingPitch(I)I
.end method

.method public abstract setAudioMixingPosition(J)I
.end method

.method public abstract setAudioProfile(II)I
.end method

.method public abstract setCameraAutoFocusFaceModeEnabled(Z)I
.end method

.method public abstract setCameraFocusPositionInPreview(FF)I
.end method

.method public abstract setCameraTorchOn(Z)I
.end method

.method public abstract setCameraZoomFactor(F)I
.end method

.method public abstract setChannalNum(I)V
.end method

.method public abstract setChannelProfile(I)I
.end method

.method public abstract setClientRole(I)I
.end method

.method public abstract setDefaultAudioRoutetoSpeakerphone(Z)I
.end method

.method public abstract setDefaultMuteAllRemoteAudioStreams(Z)I
.end method

.method public abstract setDefaultMuteAllRemoteVideoStreams(Z)I
.end method

.method public abstract setEnableSpeakerphone(Z)I
.end method

.method public abstract setEncryptionMode(Ljava/lang/String;)I
.end method

.method public abstract setEncryptionSecret(Ljava/lang/String;)I
.end method

.method public abstract setExpandCartonParams(II)V
.end method

.method public abstract setExternalAudioSource(ZII)I
.end method

.method public abstract setExternalVideoSource(ZZZ)V
.end method

.method public abstract setHeadset(Z)I
.end method

.method public abstract setHighQualityAudioParameters(ZZZ)I
.end method

.method public abstract setInEarMonitoringVolume(I)I
.end method

.method public abstract setListener(Lcom/momo/momortc/IMMRtcEngineEventInterface;)V
.end method

.method public abstract setLiveTranscoding(Lcom/momo/momortc/live/MMLiveTranscoding;)I
.end method

.method public abstract setLocalRenderMode(I)I
.end method

.method public abstract setLocalVideoMirrorMode(I)I
.end method

.method public abstract setLocalVoiceEqualization(II)I
.end method

.method public abstract setLocalVoicePitch(D)I
.end method

.method public abstract setLocalVoiceReverb(II)I
.end method

.method public abstract setLogFile(Ljava/lang/String;)I
.end method

.method public abstract setLogFilter(I)I
.end method

.method public abstract setMixedAudioFrameParameters(II)I
.end method

.method public abstract setParameters(Ljava/lang/String;)I
.end method

.method public abstract setPlaybackAudioFrameParameters(IIII)I
.end method

.method public abstract setProfile(Ljava/lang/String;Z)I
.end method

.method public abstract setRecordingAudioFrameParameters(IIII)I
.end method

.method public abstract setRemoteDefaultVideoStreamType(I)I
.end method

.method public abstract setRemoteRenderMode(JI)I
.end method

.method public abstract setRemoteVideoStreamType(II)I
.end method

.method public abstract setRobustSignal(Z)V
.end method

.method public abstract setRoomMode(I)I
.end method

.method public abstract setSei([B)I
.end method

.method public abstract setSpeakerphoneVolume(I)I
.end method

.method public abstract setSteroAudioCapture(Z)V
.end method

.method public abstract setTextureId(ILandroid/opengl/EGLContext;IIJ)I
.end method

.method public abstract setTextureId(ILjavax/microedition/khronos/egl/EGLContext;IIJ)I
.end method

.method public abstract setVideoProfile(IIII)I
.end method

.method public abstract setVideoProfile(IZ)I
.end method

.method public abstract setVideoQualityParameters(Z)I
.end method

.method public abstract setupLocalVideo(Lcom/momo/rtcbase/VideoCanvas;)I
.end method

.method public abstract setupRemoteVideo(Lcom/momo/rtcbase/VideoCanvas;)I
.end method

.method public abstract startAudioMixing(Ljava/lang/String;ZZJ)I
.end method

.method public abstract startAudioRecording(Ljava/lang/String;I)I
.end method

.method public abstract startChannelMediaRelay(JLjava/lang/String;)I
.end method

.method public abstract startEchoTest()I
.end method

.method public abstract startPlayingStream(Ljava/lang/String;)I
.end method

.method public abstract startPreview()I
.end method

.method public abstract startRecordingService(Ljava/lang/String;)I
.end method

.method public abstract stopAudioMixing()I
.end method

.method public abstract stopAudioRecording()I
.end method

.method public abstract stopChannelMediaRelay(JLjava/lang/String;)I
.end method

.method public abstract stopEchoTest()I
.end method

.method public abstract stopPlayingStream()I
.end method

.method public abstract stopPreview()I
.end method

.method public abstract stopRecordingService(Ljava/lang/String;)I
.end method

.method public abstract switchCamera()I
.end method

.method public abstract switchView(II)V
.end method

.method public abstract updateSharedContext(Landroid/opengl/EGLContext;)I
.end method

.method public abstract updateSharedContext(Ljavax/microedition/khronos/egl/EGLContext;)I
.end method

.method public abstract useExternalAudioDevice()I
.end method
