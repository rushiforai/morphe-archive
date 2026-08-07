.class public Lcom/momo/momortc/MMRtcEngineImpl;
.super Lcom/momo/momortc/MMRtcEngine;
.source "SourceFile"

# interfaces
.implements Lcom/momo/momortc/IAudioEffectManager;


# static fields
.field private static final MaxReConnect:I = 0x5


# instance fields
.field private EglBase14EglContext:Lcom/momo/rtcbase/EglBase14$Context;

.field private audioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field private audioManager:Landroid/media/AudioManager;

.field private currentRole:I

.field private earBack:Z

.field private hasBluetoothHeadset:Z

.field private hasWiredHeadset:Z

.field private isDemo:Z

.field private mAppId:Ljava/lang/String;

.field private mAudioMediarouter:Z

.field private mAudioRouterFix:Z

.field private mContext:Landroid/content/Context;

.field private mEngine:J

.field private mIpAddr:Ljava/lang/String;

.field private mIsRobust:Z

.field private mListener:Lcom/momo/momortc/IMMRtcEngineEventInterface;

.field private mSslport:I

.field private mSteroAudioCapture:Z

.field private mTcpPort:I

.field private middleGroundSignal:Z

.field private preEGLContext:Landroid/opengl/EGLContext;

.field private preRole:I

.field private reconnect:I

.field private savedAudioMode:I

.field private savedIsMicrophoneMute:Z

.field private savedIsSpeakerPhoneOn:Z

.field private final sync:Ljava/lang/Object;

.field private final syncAudio:Ljava/lang/Object;

.field private wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/momo/momortc/IMMRtcEngineEventInterface;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/momortc/MMRtcEngine;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->preEGLContext:Landroid/opengl/EGLContext;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->EglBase14EglContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 8
    .line 9
    const/4 v0, -0x2

    .line 10
    iput v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->savedAudioMode:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioMediarouter:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioRouterFix:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mSteroAudioCapture:Z

    .line 18
    .line 19
    new-instance v1, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 25
    .line 26
    new-instance v2, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->syncAudio:Ljava/lang/Object;

    .line 32
    .line 33
    iput v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->reconnect:I

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->isDemo:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->earBack:Z

    .line 38
    .line 39
    const-string v2, "39.105.107.230"

    .line 40
    .line 41
    iput-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mIpAddr:Ljava/lang/String;

    .line 42
    .line 43
    iput v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mSslport:I

    .line 44
    .line 45
    const/16 v2, 0x3012

    .line 46
    .line 47
    iput v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mTcpPort:I

    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    iput-boolean v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mIsRobust:Z

    .line 51
    .line 52
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->middleGroundSignal:Z

    .line 53
    .line 54
    const/4 v0, -0x1

    .line 55
    iput v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->currentRole:I

    .line 56
    .line 57
    iput v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->preRole:I

    .line 58
    .line 59
    iput-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mContext:Landroid/content/Context;

    .line 60
    .line 61
    monitor-enter v1

    .line 62
    :try_start_0
    iput-object p2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAppId:Ljava/lang/String;

    .line 63
    .line 64
    iput-object p3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mListener:Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 65
    .line 66
    invoke-direct {p0, p3, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeInit(Lcom/momo/momortc/IMMRtcEngineEventInterface;Ljava/lang/String;)J

    .line 67
    .line 68
    .line 69
    move-result-wide p1

    .line 70
    iput-wide p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 71
    .line 72
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    iget-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mContext:Landroid/content/Context;

    .line 74
    .line 75
    const-string p2, "audio"

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Landroid/media/AudioManager;

    .line 82
    .line 83
    iput-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/media/AudioManager;->getMode()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->savedAudioMode:I

    .line 90
    .line 91
    iget-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iput-boolean p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->savedIsSpeakerPhoneOn:Z

    .line 98
    .line 99
    iget-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/media/AudioManager;->isMicrophoneMute()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iput-boolean p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->savedIsMicrophoneMute:Z

    .line 106
    .line 107
    return-void

    .line 108
    :catchall_0
    move-exception p0

    .line 109
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    throw p0
.end method

.method public static synthetic access$000(Lcom/momo/momortc/MMRtcEngineImpl;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/momortc/MMRtcEngineImpl;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$200(Lcom/momo/momortc/MMRtcEngineImpl;JLjava/lang/String;II)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeCreateConnectWithSignalServer(JLjava/lang/String;II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$300(Lcom/momo/momortc/MMRtcEngineImpl;)Lcom/momo/momortc/IMMRtcEngineEventInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mListener:Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/momortc/MMRtcEngineImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->reconnect:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$408(Lcom/momo/momortc/MMRtcEngineImpl;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->reconnect:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->reconnect:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$500(Lcom/momo/momortc/MMRtcEngineImpl;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAppId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/momo/momortc/MMRtcEngineImpl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->middleGroundSignal:Z

    .line 2
    .line 3
    return p0
.end method

.method public static initializeNativeLibs()Z
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "cosmosffmpeg"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "MomoSoundAndroid"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "event"

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "yuvutils"

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "MomoRtc"

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    return v0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    return v0
.end method

.method private native nativeAddPublishStreamUrl(JLjava/lang/String;Z)V
.end method

.method private native nativeAdjustAudioMixingVolume(JF)I
.end method

.method private native nativeAdjustPlaybackSignalVolume(JJ)I
.end method

.method private native nativeAdjustRecordingSignalVolume(JJ)I
.end method

.method private native nativeCreateConnectWithSignalServer(JLjava/lang/String;II)I
.end method

.method private native nativeDestroy(J)V
.end method

.method private native nativeEnableAudioPreProcess(JZ)I
.end method

.method private native nativeEnableAudioVolumeIndication(JJJ)I
.end method

.method private native nativeEnableInEarMonitoring(JZ)I
.end method

.method private native nativeEnableLocalAudio(JZ)I
.end method

.method private native nativeGetAudioMixingCurrentPosition(J)J
.end method

.method private native nativeGetAudioMixingDuration(J)J
.end method

.method public static native nativeGetChatEngineVersion()Ljava/lang/String;
.end method

.method private native nativeGetEffectsVolume(J)F
.end method

.method public static native nativeGetErrorDescription(I)Ljava/lang/String;
.end method

.method private native nativeGetRoomList(JJ)V
.end method

.method private native nativeGetSabineEnable(J)I
.end method

.method public static native nativeGetSdkVersion()Ljava/lang/String;
.end method

.method private native nativeInit(Lcom/momo/momortc/IMMRtcEngineEventInterface;Ljava/lang/String;)J
.end method

.method private native nativeIsSpeakerphoneEnabled(J)Z
.end method

.method private native nativeJoinChannel(J[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;J)I
.end method

.method private native nativeLeaveChannel(J)I
.end method

.method private native nativeMuteAllRemoteAudioStreams(JZ)I
.end method

.method private native nativeMuteAllRemoteVideoStreams(JZ)I
.end method

.method private native nativeMuteLocalAudioStream(JZ)I
.end method

.method private native nativeMuteLocalMsgStream(JZ)I
.end method

.method private native nativeMuteLocalVideoStream(JZ)I
.end method

.method private native nativeMuteRemoteAudioStream(JJZ)I
.end method

.method private native nativeMuteRemoteMsgStream(JJZ)I
.end method

.method private native nativeMuteRemoteVideoStream(JJZ)I
.end method

.method private native nativePauseAllEffects(J)I
.end method

.method private native nativePauseAudioMixing(J)I
.end method

.method private native nativePauseEffect(JI)I
.end method

.method private native nativePlayEffect(JILjava/lang/String;IDDDZ)I
.end method

.method private native nativePreloadEffect(JILjava/lang/String;)I
.end method

.method private native nativePushExternalVideoFrame(JLcom/momo/rtcbase/VideoFrame$Buffer;Lcom/momo/rtcbase/EglBase$Context;J)Z
.end method

.method private native nativeRegisterAudioFrameObserver(JLcom/momo/momortc/IAudioFrameObserver;)V
.end method

.method private native nativeRemovePublishStreamUrl(JLjava/lang/String;)V
.end method

.method private native nativeRenewToken(JLjava/lang/String;)I
.end method

.method private native nativeResumeAllEffects(J)I
.end method

.method private native nativeResumeAudioMixing(J)I
.end method

.method private native nativeResumeEffect(JI)I
.end method

.method private native nativeSetAudioAECEnable(JZ)I
.end method

.method private native nativeSetAudioAGCEnable(JZ)I
.end method

.method private native nativeSetAudioANSEnable(JZ)I
.end method

.method private native nativeSetAudioANSLevel(JI)I
.end method

.method private native nativeSetAudioLevel(JI)I
.end method

.method private native nativeSetAudioMixingPitch(JF)I
.end method

.method private native nativeSetAudioMixingPosition(JJ)I
.end method

.method private native nativeSetAudioProfile(JI)I
.end method

.method private native nativeSetChannalNum(JI)V
.end method

.method private native nativeSetChannelProfile(JI)I
.end method

.method private native nativeSetClientRole(JI)I
.end method

.method private native nativeSetDefaultAudioRouteToSpeakerphone(JZ)I
.end method

.method private native nativeSetDefaultMuteAllRemoteAudioStreams(JZ)I
.end method

.method private native nativeSetEffectsVolume(JF)I
.end method

.method private native nativeSetEnableSpeakerphone(JZ)I
.end method

.method private native nativeSetExpandCartonParams(JII)V
.end method

.method private native nativeSetHeadset(JZ)I
.end method

.method private native nativeSetInEarMonitoringVolume(JF)I
.end method

.method private native nativeSetListener(JLcom/momo/momortc/IMMRtcEngineEventInterface;)V
.end method

.method private native nativeSetLiveTranscoding(JLjava/lang/String;)V
.end method

.method private native nativeSetLogFile(JLjava/lang/String;)I
.end method

.method private native nativeSetLogFilter(JJ)I
.end method

.method private native nativeSetParameters(JLjava/lang/String;)I
.end method

.method private native nativeSetRemoteRenderMode(JJI)I
.end method

.method private native nativeSetRoomMode(JI)I
.end method

.method private native nativeSetSei(J[B)I
.end method

.method private native nativeSetVideoResolution(JIIII)I
.end method

.method private native nativeSetVolumeOfEffect(JIF)I
.end method

.method private native nativeSetupRemoteVideo(JLandroid/view/SurfaceView;II)I
.end method

.method private native nativeSharedContext(JLcom/momo/rtcbase/EglBase$Context;)Z
.end method

.method private native nativeStartAudioMixing(JLjava/lang/String;ZZJ)I
.end method

.method private native nativeStartChannelMediaRelay(JJLjava/lang/String;)I
.end method

.method private native nativeStopAllEffects(J)I
.end method

.method private native nativeStopAudioMixing(J)I
.end method

.method private native nativeStopChannelMediaRelay(JJLjava/lang/String;)I
.end method

.method private native nativeStopEffect(JI)I
.end method

.method private native nativeUnloadEffect(JI)I
.end method

.method private native nativeUpdateContext(JLcom/momo/rtcbase/EglBase$Context;)Z
.end method

.method private native nativeforwardDownlinkAudio(JJZ)I
.end method

.method private native nativesendStreamMessage(JILjava/lang/String;)I
.end method

.method private registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private setMicrophoneMute(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/AudioManager;->isMicrophoneMute()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setMicrophoneMute(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setSpeakerphoneOn(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public IsInEarMonitoring()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->syncAudio:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/momortc/media/HeadSetReceiver;->isEarBack()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    monitor-exit v0

    .line 13
    return p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    monitor-exit v0

    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public addPublishStreamUrl(Ljava/lang/String;Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeAddPublishStreamUrl(JLjava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public adjustAudioMixingVolume(F)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeAdjustAudioMixingVolume(JF)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public adjustPlaybackSignalVolume(J)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeAdjustPlaybackSignalVolume(JJ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public adjustRecordingSignalVolume(J)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeAdjustRecordingSignalVolume(JJ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public changeToSpeaker()V
    .locals 6

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "android.intent.action.HEADSET_PLUG"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v1, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/momo/momortc/media/HeadSetReceiver;->hasWiredHeadset(Landroid/media/AudioManager;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput-boolean v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->hasWiredHeadset:Z

    .line 28
    .line 29
    invoke-static {}, Lcom/momo/momortc/media/HeadSetReceiver;->hasBluetoothHeadset()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput-boolean v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->hasBluetoothHeadset:Z

    .line 34
    .line 35
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->syncAudio:Ljava/lang/Object;

    .line 36
    .line 37
    monitor-enter v1

    .line 38
    :try_start_0
    iget-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mContext:Landroid/content/Context;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/momo/momortc/media/HeadSetReceiver;->requestAudioFocus(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Lcom/momo/momortc/media/HeadSetReceiver;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 46
    .line 47
    invoke-direct {v2, v3}, Lcom/momo/momortc/media/HeadSetReceiver;-><init>(Landroid/media/AudioManager;)V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 51
    .line 52
    iget-boolean v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioMediarouter:Z

    .line 53
    .line 54
    iget-boolean v4, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioRouterFix:Z

    .line 55
    .line 56
    invoke-virtual {v2, v3, v4}, Lcom/momo/momortc/media/HeadSetReceiver;->setMediaRouter(ZZ)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 60
    .line 61
    iget-object v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    const/4 v5, 0x1

    .line 65
    invoke-virtual {v2, v3, v4, v5}, Lcom/momo/momortc/media/HeadSetReceiver;->autoSetHeadsetOn(Landroid/media/AudioManager;ZZ)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 69
    .line 70
    invoke-direct {p0, v2, v0}, Lcom/momo/momortc/MMRtcEngineImpl;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 71
    .line 72
    .line 73
    iget-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->earBack:Z

    .line 74
    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/momo/momortc/media/HeadSetReceiver;->setEarBack(Z)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception p0

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    :goto_0
    monitor-exit v1

    .line 86
    return-void

    .line 87
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    throw p0
.end method

.method public clearVideoWatermarks()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public complain(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public createDataStream(ZZ)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public disableAudio()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public disableLastmileTest()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public disableVideo()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public doDestroy()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeDestroy(J)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->reconnect:I

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    iput-wide v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 15
    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->preEGLContext:Landroid/opengl/EGLContext;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->EglBase14EglContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 30
    .line 31
    iget-boolean v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->savedIsSpeakerPhoneOn:Z

    .line 32
    .line 33
    invoke-direct {p0, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->setSpeakerphoneOn(Z)V

    .line 34
    .line 35
    .line 36
    iget-boolean v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->savedIsMicrophoneMute:Z

    .line 37
    .line 38
    invoke-direct {p0, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->setMicrophoneMute(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 42
    .line 43
    iget v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->savedAudioMode:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Landroid/media/AudioManager;->setMode(I)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->syncAudio:Ljava/lang/Object;

    .line 49
    .line 50
    monitor-enter v2

    .line 51
    :try_start_1
    iget-object v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 52
    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    iget-object v4, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 56
    .line 57
    invoke-virtual {v3, v4, v1, v1}, Lcom/momo/momortc/media/HeadSetReceiver;->autoSetHeadsetOn(Landroid/media/AudioManager;ZZ)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 61
    .line 62
    invoke-direct {p0, v1}, Lcom/momo/momortc/MMRtcEngineImpl;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Lcom/momo/momortc/media/HeadSetReceiver;->abandonAudioFocus()V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/momo/momortc/media/HeadSetReceiver;->release()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    :goto_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    iput-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 80
    .line 81
    return-void

    .line 82
    :goto_1
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    throw p0

    .line 84
    :catchall_1
    move-exception p0

    .line 85
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 86
    throw p0
.end method

.method public enableAudio()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableAudioPreProcess(Z)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeEnableAudioPreProcess(JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public enableAudioQualityIndication(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableAudioVolumeIndication(JJ)I
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-wide v5, p1

    .line 14
    move-wide v7, p3

    .line 15
    invoke-direct/range {v2 .. v8}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeEnableAudioVolumeIndication(JJJ)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public enableDualStreamMode(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableHighPerfWifiMode(Z)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableInEarMonitoring(Z)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->syncAudio:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->wiredHeadsetReceiver:Lcom/momo/momortc/media/HeadSetReceiver;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Lcom/momo/momortc/media/HeadSetReceiver;->setEarBack(Z)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iput-boolean p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->earBack:Z

    .line 15
    .line 16
    :goto_0
    monitor-exit v0

    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public enableLastmileTest()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableLocalAudio(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeEnableLocalAudio(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public enableLocalVideo(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableMiddleGroundSignal(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->middleGroundSignal:Z

    .line 2
    .line 3
    return-void
.end method

.method public enableRecap(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableTransportQualityIndication(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableVideo()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableWebSdkInteroperability(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public forwardDownlinkAudio(JZ)I
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-wide v5, p1

    .line 14
    move v7, p3

    .line 15
    invoke-direct/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeforwardDownlinkAudio(JJZ)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public getAudioEffectManager()Lcom/momo/momortc/IAudioEffectManager;
    .locals 0

    return-object p0
.end method

.method public getAudioMixingCurrentPosition()J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v5, v1, v3

    .line 9
    .line 10
    if-eqz v5, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeGetAudioMixingCurrentPosition(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    monitor-exit v0

    .line 17
    return-wide v1

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    return-wide v3

    .line 22
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public getAudioMixingDuration()J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v5, v1, v3

    .line 9
    .line 10
    if-eqz v5, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeGetAudioMixingDuration(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    monitor-exit v0

    .line 17
    return-wide v1

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    return-wide v3

    .line 22
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public getCallId()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getCameraMaxZoomFactor()F
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getEffectsVolume()F
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeGetEffectsVolume(J)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public getNativeHandle()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getParameters(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomList(J)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeGetRoomList(JJ)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method

.method public getSabineEnable()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeGetSabineEnable(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public isCameraAutoFocusFaceModeSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCameraFocusSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCameraTorchSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSpeakerphoneEnabled()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeIsSpeakerphoneEnabled(J)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public isTextureEncodeSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public joinChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)I
    .locals 15

    .line 1
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->changeToSpeaker()V

    .line 2
    .line 3
    .line 4
    iget-object v12, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v12

    .line 7
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 8
    .line 9
    const-wide/16 v13, 0x0

    .line 10
    .line 11
    cmp-long v3, v1, v13

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v0, p0

    .line 17
    move-object/from16 v4, p1

    .line 18
    .line 19
    move-object/from16 v5, p2

    .line 20
    .line 21
    move-object/from16 v6, p3

    .line 22
    .line 23
    move-wide/from16 v7, p4

    .line 24
    .line 25
    move-object/from16 v9, p8

    .line 26
    .line 27
    move-wide/from16 v10, p9

    .line 28
    .line 29
    invoke-direct/range {v0 .. v11}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeJoinChannel(J[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;J)I

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_2

    .line 35
    :cond_0
    :goto_0
    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    iget-boolean v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->isDemo:Z

    .line 37
    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    new-instance v6, Lcom/momo/momortc/MMRtcEngineImpl$1;

    .line 41
    .line 42
    move-object v1, p0

    .line 43
    move-object/from16 v2, p1

    .line 44
    .line 45
    move-object/from16 v5, p2

    .line 46
    .line 47
    move-object/from16 v3, p6

    .line 48
    .line 49
    move-object/from16 v4, p7

    .line 50
    .line 51
    move-object v0, v6

    .line 52
    invoke-direct/range {v0 .. v5}, Lcom/momo/momortc/MMRtcEngineImpl$1;-><init>(Lcom/momo/momortc/MMRtcEngineImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/momo/momortc/MMRtcHttpUtils;->getInstance()Lcom/momo/momortc/MMRtcHttpUtils;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    move-object v2, v1

    .line 60
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAppId:Ljava/lang/String;

    .line 61
    .line 62
    iget-boolean v7, p0, Lcom/momo/momortc/MMRtcEngineImpl;->middleGroundSignal:Z

    .line 63
    .line 64
    move-object v0, v2

    .line 65
    move-object/from16 v2, p1

    .line 66
    .line 67
    invoke-virtual/range {v0 .. v7}, Lcom/momo/momortc/MMRtcHttpUtils;->postSignalDispatchEx(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;Z)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    const-string v1, "39.105.107.230"

    .line 72
    .line 73
    iput-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mIpAddr:Ljava/lang/String;

    .line 74
    .line 75
    const/16 v2, 0x3013

    .line 76
    .line 77
    iput v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mTcpPort:I

    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    iput v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mSslport:I

    .line 81
    .line 82
    iget-wide v4, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 83
    .line 84
    cmp-long v6, v4, v13

    .line 85
    .line 86
    if-eqz v6, :cond_2

    .line 87
    .line 88
    move-object/from16 p1, p0

    .line 89
    .line 90
    move-object/from16 p4, v1

    .line 91
    .line 92
    move/from16 p5, v2

    .line 93
    .line 94
    move/from16 p6, v3

    .line 95
    .line 96
    move-wide/from16 p2, v4

    .line 97
    .line 98
    invoke-direct/range {p1 .. p6}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeCreateConnectWithSignalServer(JLjava/lang/String;II)I

    .line 99
    .line 100
    .line 101
    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 102
    return v0

    .line 103
    :goto_2
    :try_start_1
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    throw v0
.end method

.method public leaveChannel()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeLeaveChannel(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    monitor-exit v0

    .line 21
    return p0

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public makeQualityReportUrl(Ljava/lang/String;III)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public monitorAudioRouteChange(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public monitorConnectionEvent(Z)V
    .locals 0

    return-void
.end method

.method public muteAllRemoteAudioStreams(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeMuteAllRemoteAudioStreams(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public muteAllRemoteVideoStreams(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeMuteLocalVideoStream(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public muteLocalAudioStream(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeMuteLocalAudioStream(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public muteLocalMsgStream(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeMuteLocalMsgStream(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public muteLocalVideoStream(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeMuteLocalVideoStream(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public muteRemoteAudioStream(JZ)I
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-wide v5, p1

    .line 14
    move v7, p3

    .line 15
    invoke-direct/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeMuteRemoteAudioStream(JJZ)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public muteRemoteMsgStream(JZ)I
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-wide v5, p1

    .line 14
    move v7, p3

    .line 15
    invoke-direct/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeMuteRemoteMsgStream(JJZ)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public muteRemoteVideoStream(IZ)I
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    int-to-long v5, p1

    .line 13
    move-object v2, p0

    .line 14
    move v7, p2

    .line 15
    invoke-direct/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeMuteRemoteVideoStream(JJZ)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public pauseAllEffects()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativePauseAllEffects(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public pauseAudio()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public pauseAudioMixing()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativePauseAudioMixing(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public pauseEffect(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativePauseEffect(JI)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public playEffect(ILjava/lang/String;IDDDZ)I
    .locals 14

    .line 1
    iget-object v13, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v13

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    move-object v0, p0

    .line 13
    move v3, p1

    .line 14
    move-object/from16 v4, p2

    .line 15
    .line 16
    move/from16 v5, p3

    .line 17
    .line 18
    move-wide/from16 v6, p4

    .line 19
    .line 20
    move-wide/from16 v8, p6

    .line 21
    .line 22
    move-wide/from16 v10, p8

    .line 23
    .line 24
    move/from16 v12, p10

    .line 25
    .line 26
    invoke-direct/range {v0 .. v12}, Lcom/momo/momortc/MMRtcEngineImpl;->nativePlayEffect(JILjava/lang/String;IDDDZ)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    monitor-exit v13

    .line 31
    return v0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    monitor-exit v13

    .line 35
    const/4 v0, 0x0

    .line 36
    return v0

    .line 37
    :goto_0
    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw v0
.end method

.method public playRecap()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public preloadEffect(ILjava/lang/String;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativePreloadEffect(JILjava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public pushExternalAudioFrame([BJ)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public declared-synchronized pushExternalVideoFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/EglBase$Context;)Z
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 5
    :try_start_1
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 6
    .line 7
    const-wide/16 v5, 0x0

    .line 8
    .line 9
    cmp-long v0, v3, v5

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 18
    .line 19
    .line 20
    move-result-wide v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 21
    move-object v2, p0

    .line 22
    move-object v6, p2

    .line 23
    :try_start_2
    invoke-direct/range {v2 .. v8}, Lcom/momo/momortc/MMRtcEngineImpl;->nativePushExternalVideoFrame(JLcom/momo/rtcbase/VideoFrame$Buffer;Lcom/momo/rtcbase/EglBase$Context;J)Z

    .line 24
    .line 25
    .line 26
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 27
    monitor-exit v2

    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    :goto_0
    move-object p0, v0

    .line 32
    goto :goto_1

    .line 33
    :catchall_1
    move-exception v0

    .line 34
    move-object v2, p0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v2, p0

    .line 37
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 38
    monitor-exit v2

    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :goto_1
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 42
    :try_start_5
    throw p0

    .line 43
    :catchall_2
    move-exception v0

    .line 44
    :goto_2
    move-object p0, v0

    .line 45
    goto :goto_3

    .line 46
    :catchall_3
    move-exception v0

    .line 47
    move-object v2, p0

    .line 48
    goto :goto_2

    .line 49
    :goto_3
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 50
    throw p0
.end method

.method public rate(Ljava/lang/String;ILjava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public refreshRecordingServiceStatus()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeRegisterAudioFrameObserver(JLcom/momo/momortc/IAudioFrameObserver;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public reinitialize(Landroid/content/Context;Ljava/lang/String;Lcom/momo/momortc/IMMRtcEngineEventInterface;)V
    .locals 0

    return-void
.end method

.method public removeInjectStreamUrl(Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public removePublishStreamUrl(Ljava/lang/String;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeRemovePublishStreamUrl(JLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public renewToken(Ljava/lang/String;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeRenewToken(JLjava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public resumeAllEffects()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeResumeAllEffects(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public resumeAudio()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public resumeAudioMixing()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeResumeAudioMixing(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public resumeEffect(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeResumeEffect(JI)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public sendStreamMessage(ILjava/lang/String;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativesendStreamMessage(JILjava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setApiCallMode(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setAudioAECEnable(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetAudioAECEnable(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setAudioAGCEnable(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetAudioAGCEnable(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setAudioANSEnable(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetAudioANSEnable(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setAudioANSLevel(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetAudioANSLevel(JI)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setAudioLevel(I)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x2

    .line 11
    const/4 v2, 0x1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const/4 v3, 0x7

    .line 15
    invoke-static {v3}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->setAudioSource(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->setAudioContentType(I)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->setAudioTrackUsageAttribute(I)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 25
    .line 26
    const/4 v2, 0x3

    .line 27
    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setMode(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/momo/momortc/MMRtcEngineImpl;->enableAudioPreProcess(Z)I

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->setAudioSource(I)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->setAudioContentType(I)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->setAudioTrackUsageAttribute(I)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->audioManager:Landroid/media/AudioManager;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->setMode(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->enableAudioPreProcess(Z)I

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    iget-wide v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 52
    .line 53
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetAudioLevel(JI)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public setAudioMixingPitch(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    int-to-float p1, p1

    .line 13
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetAudioMixingPitch(JF)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    monitor-exit v0

    .line 18
    return p0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    monitor-exit v0

    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public setAudioMixingPosition(J)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetAudioMixingPosition(JJ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setAudioProfile(II)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetAudioProfile(JI)I

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_3

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioRouterFix:Z

    .line 21
    .line 22
    const/4 v1, 0x5

    .line 23
    const/4 v2, 0x1

    .line 24
    if-ne p1, v1, :cond_1

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-virtual {p0, v1}, Lcom/momo/momortc/MMRtcEngineImpl;->setChannalNum(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-virtual {p0, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->setChannalNum(I)V

    .line 32
    .line 33
    .line 34
    :goto_1
    const/4 v1, 0x3

    .line 35
    if-ne p2, v1, :cond_2

    .line 36
    .line 37
    iput-boolean v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioMediarouter:Z

    .line 38
    .line 39
    iput-boolean v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioRouterFix:Z

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_2
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioMediarouter:Z

    .line 43
    .line 44
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioRouterFix:Z

    .line 45
    .line 46
    :goto_2
    if-nez p1, :cond_3

    .line 47
    .line 48
    iput-boolean v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioMediarouter:Z

    .line 49
    .line 50
    iput-boolean v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mAudioRouterFix:Z

    .line 51
    .line 52
    :cond_3
    return v0

    .line 53
    :goto_3
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p0
.end method

.method public setCameraAutoFocusFaceModeEnabled(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setCameraFocusPositionInPreview(FF)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setCameraTorchOn(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setCameraZoomFactor(F)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setChannalNum(I)V
    .locals 5

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x1

    .line 5
    if-ne p1, v3, :cond_1

    .line 6
    .line 7
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->setStereoOutput(Z)V

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->setStereoInput(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v4, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 14
    .line 15
    monitor-enter v4

    .line 16
    :try_start_0
    iget-wide v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 17
    .line 18
    cmp-long v0, v2, v0

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-direct {p0, v2, v3, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetChannalNum(JI)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v4

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0

    .line 32
    :cond_1
    invoke-static {v3}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->setStereoOutput(Z)V

    .line 33
    .line 34
    .line 35
    iget-boolean v4, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mSteroAudioCapture:Z

    .line 36
    .line 37
    if-eqz v4, :cond_2

    .line 38
    .line 39
    invoke-static {v3}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->setStereoInput(Z)V

    .line 40
    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->setStereoInput(Z)V

    .line 44
    .line 45
    .line 46
    :goto_2
    iget-object v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 47
    .line 48
    monitor-enter v2

    .line 49
    :try_start_1
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 50
    .line 51
    cmp-long v0, v3, v0

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-direct {p0, v3, v4, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetChannalNum(JI)V

    .line 56
    .line 57
    .line 58
    goto :goto_3

    .line 59
    :catchall_1
    move-exception p0

    .line 60
    goto :goto_4

    .line 61
    :cond_3
    :goto_3
    monitor-exit v2

    .line 62
    return-void

    .line 63
    :goto_4
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 64
    throw p0
.end method

.method public setChannelProfile(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetChannelProfile(JI)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setClientRole(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->currentRole:I

    .line 5
    .line 6
    iput p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->preRole:I

    .line 7
    .line 8
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 9
    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    cmp-long v3, v1, v3

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetClientRole(JI)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    monitor-exit v0

    .line 21
    return p0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v0

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public setDefaultAudioRoutetoSpeakerphone(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetDefaultAudioRouteToSpeakerphone(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setDefaultMuteAllRemoteAudioStreams(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetDefaultMuteAllRemoteAudioStreams(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setDefaultMuteAllRemoteVideoStreams(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setDemo(Ljava/lang/String;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mIpAddr:Ljava/lang/String;

    .line 2
    .line 3
    :try_start_0
    iput p2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mTcpPort:I

    .line 4
    .line 5
    iput p3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mSslport:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :catch_0
    move-exception p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    :goto_0
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->isDemo:Z

    .line 14
    .line 15
    return-void
.end method

.method public setEarBack(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeEnableInEarMonitoring(JZ)I

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method

.method public setEffectsVolume(F)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetEffectsVolume(JF)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setEnableSpeakerphone(Z)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetEnableSpeakerphone(JZ)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setEncryptionMode(Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setEncryptionSecret(Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setExpandCartonParams(II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetExpandCartonParams(JII)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method

.method public setExternalAudioSource(ZII)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setExternalVideoSource(ZZZ)V
    .locals 0

    return-void
.end method

.method public setHeadset(Z)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetHeadset(JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public setHighQualityAudioParameters(ZZZ)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setInEarMonitoringVolume(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    int-to-float p1, p1

    .line 13
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetInEarMonitoringVolume(JF)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    monitor-exit v0

    .line 18
    return p0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    monitor-exit v0

    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public setListener(Lcom/momo/momortc/IMMRtcEngineEventInterface;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mListener:Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetListener(JLcom/momo/momortc/IMMRtcEngineEventInterface;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

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
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public setLiveTranscoding(Lcom/momo/momortc/live/MMLiveTranscoding;)I
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v1, v1, v3

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    new-instance v1, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    :try_start_1
    const-string v3, "SEIMsg"

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getTranscodingExtraInfo()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    new-instance v3, Lorg/json/JSONObject;

    .line 28
    .line 29
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v4, "width"

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getWidth()D

    .line 35
    .line 36
    .line 37
    move-result-wide v5

    .line 38
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    const-string v4, "height"

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getHeight()D

    .line 44
    .line 45
    .line 46
    move-result-wide v5

    .line 47
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    const-string v4, "videoFps"

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getVideoFramerate()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    const-string v4, "gopSize"

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getVideoGop()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 66
    .line 67
    .line 68
    const-string v4, "bitRate"

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getVideoBitrate()I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    const-string v4, "audioSampleRate"

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getAudioSampleRate()I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 84
    .line 85
    .line 86
    const-string v4, "audioChannel"

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getAudioChannels()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 93
    .line 94
    .line 95
    const-string v4, "audioBitRate"

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getAudioBitrate()I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    const-string v4, "audioSampleFmt"

    .line 105
    .line 106
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 107
    .line 108
    .line 109
    const-string v4, "audioFrameSize"

    .line 110
    .line 111
    const/16 v5, 0x400

    .line 112
    .line 113
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    const-string v4, "Canvas"

    .line 117
    .line 118
    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    .line 120
    .line 121
    new-instance v3, Lorg/json/JSONArray;

    .line 122
    .line 123
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;->getTranscodingUserMap()Ljava/util/Map;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    if-eqz v4, :cond_0

    .line 143
    .line 144
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    check-cast v4, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;

    .line 149
    .line 150
    new-instance v5, Lorg/json/JSONObject;

    .line 151
    .line 152
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 153
    .line 154
    .line 155
    const-string v6, "userID"

    .line 156
    .line 157
    iget-object v7, v4, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->uid:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 160
    .line 161
    .line 162
    const-string v6, "x"

    .line 163
    .line 164
    iget-wide v7, v4, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posx:D

    .line 165
    .line 166
    invoke-virtual {v5, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 167
    .line 168
    .line 169
    const-string v6, "y"

    .line 170
    .line 171
    iget-wide v7, v4, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posy:D

    .line 172
    .line 173
    invoke-virtual {v5, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 174
    .line 175
    .line 176
    const-string v6, "w"

    .line 177
    .line 178
    iget-wide v7, v4, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->width:D

    .line 179
    .line 180
    invoke-virtual {v5, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 181
    .line 182
    .line 183
    const-string v6, "h"

    .line 184
    .line 185
    iget-wide v7, v4, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->height:D

    .line 186
    .line 187
    invoke-virtual {v5, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 191
    .line 192
    .line 193
    goto :goto_0

    .line 194
    :catchall_0
    move-exception p0

    .line 195
    goto :goto_3

    .line 196
    :catch_0
    move-exception p1

    .line 197
    goto :goto_1

    .line 198
    :cond_0
    const-string p1, "info"

    .line 199
    .line 200
    invoke-virtual {v1, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :goto_1
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 205
    .line 206
    .line 207
    :goto_2
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 208
    .line 209
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-direct {p0, v3, v4, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetLiveTranscoding(JLjava/lang/String;)V

    .line 214
    .line 215
    .line 216
    :cond_1
    monitor-exit v0

    .line 217
    return v2

    .line 218
    :goto_3
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 219
    throw p0
.end method

.method public setLocalRenderMode(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setLocalVideoMirrorMode(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setLocalVoiceEqualization(II)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setLocalVoicePitch(D)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setLocalVoiceReverb(II)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setLogFile(Ljava/lang/String;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetLogFile(JLjava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setLogFilter(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    int-to-long v3, p1

    .line 13
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetLogFilter(JJ)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    monitor-exit v0

    .line 18
    return p0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    monitor-exit v0

    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public setMixedAudioFrameParameters(II)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setParameters(Ljava/lang/String;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetParameters(JLjava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setPlaybackAudioFrameParameters(IIII)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setProfile(Ljava/lang/String;Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setRecordingAudioFrameParameters(IIII)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setRemoteDefaultVideoStreamType(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setRemoteRenderMode(JI)I
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-wide v5, p1

    .line 14
    move v7, p3

    .line 15
    invoke-direct/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetRemoteRenderMode(JJI)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public setRemoteVideoStreamType(II)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setRobustSignal(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mIsRobust:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRoomMode(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetRoomMode(JI)I

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public setSei([B)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetSei(J[B)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setSharedContext(Lcom/momo/rtcbase/EglBase$Context;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    throw p1
.end method

.method public setSpeakerphoneVolume(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setSteroAudioCapture(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mSteroAudioCapture:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->setChannalNum(I)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->setChannalNum(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setTextureId(ILandroid/opengl/EGLContext;IIJ)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public setTextureId(ILjavax/microedition/khronos/egl/EGLContext;IIJ)I
    .locals 0

    .line 2
    const/4 p0, 0x0

    return p0
.end method

.method public setVideoProfile(IIII)I
    .locals 9

    .line 1
    const-string v0, "MMRtcEngineImpl"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "resetCodec setVideoProfile width= "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ";height= "

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ";framerate="

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, ";bitrate="

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 45
    .line 46
    monitor-enter v1

    .line 47
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 48
    .line 49
    const-wide/16 v5, 0x0

    .line 50
    .line 51
    cmp-long v0, v3, v5

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    move-object v2, p0

    .line 56
    move v5, p1

    .line 57
    move v6, p2

    .line 58
    move v7, p3

    .line 59
    move v8, p4

    .line 60
    invoke-direct/range {v2 .. v8}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetVideoResolution(JIIII)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    monitor-exit v1

    .line 65
    return p0

    .line 66
    :catchall_0
    move-exception v0

    .line 67
    move-object p0, v0

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    monitor-exit v1

    .line 70
    const/4 p0, 0x0

    .line 71
    return p0

    .line 72
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    throw p0
.end method

.method public setVideoProfile(IZ)I
    .locals 0

    .line 74
    const/4 p0, 0x0

    return p0
.end method

.method public setVideoQualityParameters(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setVolumeOfEffect(IF)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetVolumeOfEffect(JIF)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setupLocalVideo(Lcom/momo/rtcbase/VideoCanvas;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setupRemoteVideo(Lcom/momo/rtcbase/VideoCanvas;)I
    .locals 9

    .line 1
    const-string v0, "setupRemoteVideo uid "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-wide v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 7
    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    cmp-long v2, v2, v4

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    const-string v2, "nativeSetupRemoteVideo"

    .line 15
    .line 16
    new-instance v3, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget v0, p1, Lcom/momo/rtcbase/VideoCanvas;->uid:I

    .line 22
    .line 23
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v0, " view "

    .line 27
    .line 28
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v0, p1, Lcom/momo/rtcbase/VideoCanvas;->view:Landroid/view/SurfaceView;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    iget-wide v4, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 48
    .line 49
    iget-object v6, p1, Lcom/momo/rtcbase/VideoCanvas;->view:Landroid/view/SurfaceView;

    .line 50
    .line 51
    iget v7, p1, Lcom/momo/rtcbase/VideoCanvas;->renderMode:I

    .line 52
    .line 53
    iget v8, p1, Lcom/momo/rtcbase/VideoCanvas;->uid:I

    .line 54
    .line 55
    move-object v3, p0

    .line 56
    invoke-direct/range {v3 .. v8}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSetupRemoteVideo(JLandroid/view/SurfaceView;II)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    monitor-exit v1

    .line 61
    return p0

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    move-object p0, v0

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    monitor-exit v1

    .line 66
    const/4 p0, 0x0

    .line 67
    return p0

    .line 68
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    throw p0
.end method

.method public startAudioMixing(Ljava/lang/String;ZZJ)I
    .locals 10

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-object v5, p1

    .line 14
    move v6, p2

    .line 15
    move v7, p3

    .line 16
    move-wide v8, p4

    .line 17
    invoke-direct/range {v2 .. v9}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeStartAudioMixing(JLjava/lang/String;ZZJ)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    monitor-exit v1

    .line 22
    return p0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    move-object p0, v0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    monitor-exit v1

    .line 27
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method

.method public startAudioRecording(Ljava/lang/String;I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public startChannelMediaRelay(JLjava/lang/String;)I
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-wide v5, p1

    .line 14
    move-object v7, p3

    .line 15
    invoke-direct/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeStartChannelMediaRelay(JJLjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public startEchoTest()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public startPlayingStream(Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public startPreview()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public startRecordingService(Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public stopAllEffects()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeStopAllEffects(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public stopAudioMixing()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeStopAudioMixing(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public stopAudioRecording()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public stopChannelMediaRelay(JLjava/lang/String;)I
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-wide v3, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v5, 0x0

    .line 7
    .line 8
    cmp-long v0, v3, v5

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-wide v5, p1

    .line 14
    move-object v7, p3

    .line 15
    invoke-direct/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeStopChannelMediaRelay(JJLjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit v1

    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public stopEchoTest()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public stopEffect(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeStopEffect(JI)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public stopPlayingStream()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public stopPreview()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public stopRecordingService(Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public switchCamera()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public switchView(II)V
    .locals 0

    return-void
.end method

.method public unloadEffect(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v3, v1, v3

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeUnloadEffect(JI)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    monitor-exit v0

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit v0

    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public updateSharedContext(Landroid/opengl/EGLContext;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl;->sync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v1, v1, v3

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->preEGLContext:Landroid/opengl/EGLContext;

    .line 13
    .line 14
    if-eq v1, p1, :cond_0

    .line 15
    .line 16
    iput-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->preEGLContext:Landroid/opengl/EGLContext;

    .line 17
    .line 18
    new-instance v1, Lcom/momo/rtcbase/EglBase14$Context;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Lcom/momo/rtcbase/EglBase14$Context;-><init>(Landroid/opengl/EGLContext;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->EglBase14EglContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 24
    .line 25
    iget-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->preEGLContext:Landroid/opengl/EGLContext;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    iget-wide v2, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 30
    .line 31
    invoke-direct {p0, v2, v3, v1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeSharedContext(JLcom/momo/rtcbase/EglBase$Context;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    iget-wide v1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->mEngine:J

    .line 38
    .line 39
    iget-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl;->EglBase14EglContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 40
    .line 41
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->nativeUpdateContext(JLcom/momo/rtcbase/EglBase$Context;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    monitor-exit v0

    .line 46
    return p0

    .line 47
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0
.end method

.method public updateSharedContext(Ljavax/microedition/khronos/egl/EGLContext;)I
    .locals 0

    .line 49
    const/4 p0, 0x0

    return p0
.end method

.method public useExternalAudioDevice()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
