.class public Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hihonor/android/magicx/media/audio/interfaces/IAudioServiceCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "HnEarBackDeviceSupport"


# instance fields
.field private earBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

.field private mHnAudioClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

.field private mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

.field private mIsAudiokitBindSuccess:Z

.field private mIsEarReturnBindSuccess:Z


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnAudioClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 13
    .line 14
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->earBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 15
    .line 16
    return-void
.end method

.method private printLog(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "HnEarBackDeviceSupport:"

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
    const-string p1, "HnEarBackDeviceSupport"

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public HnDestroy()V
    .locals 2

    .line 1
    const-string v0, "HnDestroy"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnAudioClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;->destroy()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnAudioClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;->destroy()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 24
    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 27
    .line 28
    return-void
.end method

.method public HnEnableEarReturn(Z)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "HnEnableEarReturn="

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
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;->enableEarReturn(Z)I

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

.method public HnGetLatency()I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public HnInitAudioClient()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;->isDeviceSupported(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "HnInitAudioClient"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 17
    .line 18
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1, p0}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;-><init>(Landroid/content/Context;Lcom/hihonor/android/magicx/media/audio/interfaces/IAudioServiceCallback;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnAudioClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;->initialize()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public HnInitHnEarReturnClient()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnAudioClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "HnInitHnEarReturnClient"

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnAudioClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;->getSupportedServices()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-lez v1, :cond_2

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    sget-object v2, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient$ServiceType;->HNAUDIO_SERVICE_EARRETURN:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient$ServiceType;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient$ServiceType;->getServiceType()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-ne v1, v2, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnAudioClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 54
    .line 55
    sget-object v1, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient$ServiceType;->HNAUDIO_SERVICE_EARRETURN:Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient$ServiceType;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;->createService(Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient$ServiceType;)Lcom/hihonor/android/magicx/media/audio/interfaces/AudioFeaturesKit;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    const-string v0, "service != HnAudioClient.ServiceType.HNAUDIO_SERVICE_EARRETURN.getServiceType()"

    .line 67
    .line 68
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const/4 v0, 0x0

    .line 72
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public HnIsEarReturnSupport()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "HnIsEarReturnSupport: false"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;->isServiceSupported()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public HnSetEffectMode(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "HnSetEffectMode="

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
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 27
    .line 28
    sget-object v0, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;->CMD_SET_AUDIO_EFFECT_MODE_BASE:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;->setParameter(Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;I)I

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

.method public HnSetEqualizer(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "HnSetEqualizer="

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
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 27
    .line 28
    sget-object v0, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;->CMD_SET_VOCAL_EQUALIZER_MODE:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;->setParameter(Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;I)I

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

.method public HnSetVocalVolume(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "HnSetVocalVolume="

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
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mHnEarReturnClient:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;

    .line 27
    .line 28
    sget-object v0, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;->CMD_SET_VOCAL_VOLUME_BASE:Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient;->setParameter(Lcom/hihonor/android/magicx/media/audio/interfaces/HnEarReturnClient$ParameName;I)I

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

.method public onDeviceSupported(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->earBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "Hn onDeviceSupported: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->earBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackSupported(Z)V

    .line 25
    .line 26
    .line 27
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
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->printLog(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-eqz p1, :cond_6

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    const/4 v2, 0x0

    .line 23
    if-eq p1, v1, :cond_5

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    if-eq p1, v1, :cond_4

    .line 27
    .line 28
    const/16 v1, 0x3eb

    .line 29
    .line 30
    if-eq p1, v1, :cond_3

    .line 31
    .line 32
    const/16 v1, 0x70e

    .line 33
    .line 34
    if-eq p1, v1, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x6

    .line 37
    if-eq p1, v1, :cond_4

    .line 38
    .line 39
    const/4 v1, 0x7

    .line 40
    if-eq p1, v1, :cond_1

    .line 41
    .line 42
    const/16 v1, 0x3e8

    .line 43
    .line 44
    if-eq p1, v1, :cond_0

    .line 45
    .line 46
    const/16 v0, 0x3e9

    .line 47
    .line 48
    if-eq p1, v0, :cond_3

    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 52
    .line 53
    const/16 p1, 0x5a

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->HnSetVocalVolume(I)I

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->HnIsEarReturnSupport()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-virtual {p0, v2}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    invoke-virtual {p0, v2}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 75
    .line 76
    return-void

    .line 77
    :cond_4
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 78
    .line 79
    return-void

    .line 80
    :cond_5
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsEarReturnBindSuccess:Z

    .line 81
    .line 82
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 83
    .line 84
    invoke-virtual {p0, v2}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->onDeviceSupported(Z)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_6
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->HnInitHnEarReturnClient()V

    .line 89
    .line 90
    .line 91
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/HnEarBackDeviceSupport;->mIsAudiokitBindSuccess:Z

    .line 92
    .line 93
    return-void
.end method
