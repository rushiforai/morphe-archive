.class public Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/huawei/multimedia/audiokit/interfaces/IAudioKitCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "HWEarBackDeviceSupport"


# instance fields
.field private earBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

.field private mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

.field private mHwAudioKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;

.field private mIsAudiokitBindSuccess:Z

.field private mIsAudiokitKaraokeBindSuccess:Z

.field private mResultType:Ljava/lang/String;

.field private mSupportLowLatencyEarBack:Z


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mResultType:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mSupportLowLatencyEarBack:Z

    .line 15
    .line 16
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->earBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 17
    .line 18
    return-void
.end method

.method private initAudioKit()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWGetKaraokeSupport()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;

    .line 18
    .line 19
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1, p0}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;-><init>(Landroid/content/Context;Lcom/huawei/multimedia/audiokit/interfaces/IAudioKitCallback;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;->initialize()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private initKaraokeFeature()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit$FeatureType;->HWAUDIO_FEATURE_KARAOKE:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit$FeatureType;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;->createFeature(Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit$FeatureType;)Lcom/huawei/multimedia/audiokit/interfaces/AudioFeaturesKit;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private printLog(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "HWEarBackDeviceSupport:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "HWEarBackDeviceSupport"

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public HWDestroy()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const-string v0, "HWDestroy"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;->destroy()V

    .line 20
    .line 21
    .line 22
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;->destroy()V

    .line 27
    .line 28
    .line 29
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public HWEarBack_init()V
    .locals 1

    .line 1
    const-string v0, "HWEarBack_init"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->initAudioKit()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public HWEnableKaraoke(Z)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "HWEnableKaraoke enable="

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;->enableKaraokeFeature(Z)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, -0x1

    .line 34
    return p0
.end method

.method public HWGetKaraokeSupport()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;->isKaraokeFeatureSupport()Z

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

.method public HWSetEffectMode(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "HWSetEffectMode value="

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 27
    .line 28
    sget-object v0, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;->CMD_SET_AUDIO_EFFECT_MODE_BASE:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;->setParameter(Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, -0x1

    .line 36
    return p0
.end method

.method public HWSetEqualizerMode(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "HWSetEqualizerMode value="

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 27
    .line 28
    sget-object v0, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;->CMD_SET_VOCAL_EQUALIZER_MODE:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;->setParameter(Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, -0x1

    .line 36
    return p0
.end method

.method public getLatency()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;->getKaraokeLatency()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public onDeviceSupported(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->earBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackSupported(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onResult(I)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "onResult result=%d"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-eqz p1, :cond_5

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    const/4 v2, 0x0

    .line 23
    if-eq p1, v1, :cond_4

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    if-eq p1, v1, :cond_3

    .line 27
    .line 28
    const/4 v1, 0x6

    .line 29
    if-eq p1, v1, :cond_3

    .line 30
    .line 31
    const/16 v1, 0x3eb

    .line 32
    .line 33
    if-eq p1, v1, :cond_2

    .line 34
    .line 35
    const/16 v1, 0x70e

    .line 36
    .line 37
    if-eq p1, v1, :cond_1

    .line 38
    .line 39
    const/16 v1, 0x3e8

    .line 40
    .line 41
    if-eq p1, v1, :cond_0

    .line 42
    .line 43
    const/16 v0, 0x3e9

    .line 44
    .line 45
    if-eq p1, v0, :cond_2

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 49
    .line 50
    const/16 p1, 0x5a

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->setVolume(I)I

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWGetKaraokeSupport()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-virtual {p0, v2}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 71
    .line 72
    return-void

    .line 73
    :cond_4
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 74
    .line 75
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 76
    .line 77
    invoke-virtual {p0, v2}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_5
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->initKaraokeFeature()V

    .line 82
    .line 83
    .line 84
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 85
    .line 86
    return-void
.end method

.method public setVolume(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mIsAudiokitKaraokeBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "setVolume volome="

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->mHwAudioKaraokeFeatureKit:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 27
    .line 28
    sget-object v0, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;->CMD_SET_VOCAL_VOLUME_BASE:Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit;->setParameter(Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, -0x1

    .line 36
    return p0
.end method
