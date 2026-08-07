.class public abstract Lcom/tencent/trtc/TRTCCloud;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/trtc/TRTCCloud$BGMNotify;,
        Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;,
        Lcom/tencent/trtc/TRTCCloud$a;
    }
.end annotation


# static fields
.field private static mTXLogListener:Lcom/tencent/trtc/TRTCCloud$a;

.field static sInstance:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/trtc/TRTCCloud;",
            ">;"
        }
    .end annotation
.end field


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

.method public static destroySharedInstance()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->destroySharedInstance()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getSDKVersion()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersionStr()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static setConsoleEnabled(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/liteav/basic/log/TXCLog;->setConsoleEnabled(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setLogCompressEnabled(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/liteav/basic/log/TXCLog;->setLogCompressEnabled(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setLogDirPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/liteav/basic/log/TXCLog;->setLogDirPath(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setLogLevel(I)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/liteav/basic/log/TXCLog;->setLevel(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setLogListener(Lcom/tencent/trtc/TRTCCloudListener$TRTCLogListener;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/trtc/TRTCCloud;->mTXLogListener:Lcom/tencent/trtc/TRTCCloud$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Lcom/tencent/trtc/TRTCCloud$a;->a(Lcom/tencent/trtc/TRTCCloudListener$TRTCLogListener;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    if-eqz p0, :cond_1

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/trtc/TRTCCloud$a;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/tencent/trtc/TRTCCloud$a;-><init>()V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/tencent/trtc/TRTCCloud;->mTXLogListener:Lcom/tencent/trtc/TRTCCloud$a;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/tencent/trtc/TRTCCloud$a;->a(Lcom/tencent/trtc/TRTCCloudListener$TRTCLogListener;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    sput-object v1, Lcom/tencent/trtc/TRTCCloud;->mTXLogListener:Lcom/tencent/trtc/TRTCCloud$a;

    .line 23
    .line 24
    :goto_0
    sget-object p0, Lcom/tencent/trtc/TRTCCloud;->mTXLogListener:Lcom/tencent/trtc/TRTCCloud$a;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/tencent/liteav/basic/log/TXCLog;->setListener(Lcom/tencent/liteav/basic/log/TXCLog$a;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static native setNetEnv(I)V
.end method

.method public static sharedInstance(Landroid/content/Context;)Lcom/tencent/trtc/TRTCCloud;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sharedInstance(Landroid/content/Context;)Lcom/tencent/trtc/TRTCCloud;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public abstract ConnectOtherRoom(Ljava/lang/String;)V
.end method

.method public abstract DisconnectOtherRoom()V
.end method

.method public abstract callExperimentalAPI(Ljava/lang/String;)V
.end method

.method public abstract createSubCloud()Lcom/tencent/trtc/TRTCCloud;
.end method

.method public abstract destroySubCloud(Lcom/tencent/trtc/TRTCCloud;)V
.end method

.method public abstract enableAudioEarMonitoring(Z)V
.end method

.method public abstract enableAudioVolumeEvaluation(I)V
.end method

.method public abstract enableCustomAudioCapture(Z)V
.end method

.method public abstract enableCustomVideoCapture(Z)V
.end method

.method public abstract enableEncSmallVideoStream(ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I
.end method

.method public abstract enableTorch(Z)Z
.end method

.method public abstract enterRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;I)V
.end method

.method public abstract exitRoom()V
.end method

.method public abstract getAudioCaptureVolume()I
.end method

.method public abstract getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;
.end method

.method public abstract getAudioPlayoutVolume()I
.end method

.method public abstract getBGMDuration(Ljava/lang/String;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getBeautyManager()Lcom/tencent/liteav/beauty/TXBeautyManager;
.end method

.method public abstract isCameraAutoFocusFaceModeSupported()Z
.end method

.method public abstract isCameraFocusPositionInPreviewSupported()Z
.end method

.method public abstract isCameraTorchSupported()Z
.end method

.method public abstract isCameraZoomSupported()Z
.end method

.method public abstract muteAllRemoteAudio(Z)V
.end method

.method public abstract muteAllRemoteVideoStreams(Z)V
.end method

.method public abstract muteLocalAudio(Z)V
.end method

.method public abstract muteLocalVideo(Z)V
.end method

.method public abstract muteRemoteAudio(Ljava/lang/String;Z)V
.end method

.method public abstract muteRemoteVideoStream(Ljava/lang/String;Z)V
.end method

.method public abstract pauseAudioEffect(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract pauseBGM()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract pauseScreenCapture()V
.end method

.method public abstract playAudioEffect(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract playBGM(Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$BGMNotify;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract resumeAudioEffect(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract resumeBGM()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract resumeScreenCapture()V
.end method

.method public abstract selectMotionTmpl(Ljava/lang/String;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract sendCustomAudioData(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
.end method

.method public abstract sendCustomCmdMsg(I[BZZ)Z
.end method

.method public abstract sendCustomVideoData(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
.end method

.method public abstract sendSEIMsg([BI)Z
.end method

.method public abstract setAllAudioEffectsVolume(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setAudioCaptureVolume(I)V
.end method

.method public abstract setAudioEffectVolume(II)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setAudioFrameListener(Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)V
.end method

.method public abstract setAudioPlayoutVolume(I)V
.end method

.method public abstract setAudioQuality(I)V
.end method

.method public abstract setAudioRoute(I)V
.end method

.method public abstract setBGMPlayoutVolume(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setBGMPosition(I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setBGMPublishVolume(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setBGMVolume(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setBeautyStyle(IIII)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setChinLevel(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setDebugViewMargin(Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V
.end method

.method public abstract setDefaultStreamRecvMode(ZZ)V
.end method

.method public abstract setEyeScaleLevel(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setFaceShortLevel(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setFaceSlimLevel(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setFaceVLevel(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setFilter(Landroid/graphics/Bitmap;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setFilterConcentration(F)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setFocusPosition(II)V
.end method

.method public abstract setGSensorMode(I)V
.end method

.method public abstract setGreenScreenFile(Ljava/lang/String;)Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setListener(Lcom/tencent/trtc/TRTCCloudListener;)V
.end method

.method public abstract setListenerHandler(Landroid/os/Handler;)V
.end method

.method public abstract setLocalVideoRenderListener(IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
.end method

.method public abstract setLocalViewFillMode(I)V
.end method

.method public abstract setLocalViewMirror(I)V
.end method

.method public abstract setLocalViewRotation(I)V
.end method

.method public abstract setMicVolumeOnMixing(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setMixTranscodingConfig(Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;)V
.end method

.method public abstract setMotionMute(Z)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setNetworkQosParam(Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V
.end method

.method public abstract setNoseSlimLevel(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setPriorRemoteVideoStreamType(I)I
.end method

.method public abstract setRemoteAudioVolume(Ljava/lang/String;I)V
.end method

.method public abstract setRemoteSubStreamViewFillMode(Ljava/lang/String;I)V
.end method

.method public abstract setRemoteSubStreamViewRotation(Ljava/lang/String;I)V
.end method

.method public abstract setRemoteVideoRenderListener(Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
.end method

.method public abstract setRemoteVideoStreamType(Ljava/lang/String;I)I
.end method

.method public abstract setRemoteViewFillMode(Ljava/lang/String;I)V
.end method

.method public abstract setRemoteViewRotation(Ljava/lang/String;I)V
.end method

.method public abstract setReverbType(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setSystemVolumeType(I)V
.end method

.method public abstract setVideoEncoderMirror(Z)V
.end method

.method public abstract setVideoEncoderParam(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V
.end method

.method public abstract setVideoEncoderRotation(I)V
.end method

.method public abstract setVideoMuteImage(Landroid/graphics/Bitmap;I)V
.end method

.method public abstract setVoiceChangerType(I)Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setWatermark(Landroid/graphics/Bitmap;IFFF)V
.end method

.method public abstract setZoom(I)V
.end method

.method public abstract showDebugView(I)V
.end method

.method public abstract snapshotVideo(Ljava/lang/String;ILcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;)V
.end method

.method public abstract startAudioRecording(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioRecordingParams;)I
.end method

.method public abstract startLocalAudio()V
.end method

.method public abstract startLocalPreview(ZLcom/tencent/rtmp/ui/TXCloudVideoView;)V
.end method

.method public abstract startPublishCDNStream(Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V
.end method

.method public abstract startPublishing(Ljava/lang/String;I)V
.end method

.method public abstract startRemoteSubStreamView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
.end method

.method public abstract startRemoteView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
.end method

.method public abstract startScreenCapture(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;)V
.end method

.method public abstract startSpeedTest(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract stopAllAudioEffects()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract stopAllRemoteView()V
.end method

.method public abstract stopAudioEffect(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract stopAudioRecording()V
.end method

.method public abstract stopBGM()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract stopLocalAudio()V
.end method

.method public abstract stopLocalPreview()V
.end method

.method public abstract stopPublishCDNStream()V
.end method

.method public abstract stopPublishing()V
.end method

.method public abstract stopRemoteSubStreamView(Ljava/lang/String;)V
.end method

.method public abstract stopRemoteView(Ljava/lang/String;)V
.end method

.method public abstract stopScreenCapture()V
.end method

.method public abstract stopSpeedTest()V
.end method

.method public abstract switchCamera()V
.end method

.method public abstract switchRole(I)V
.end method

.method public abstract switchRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;)V
.end method
