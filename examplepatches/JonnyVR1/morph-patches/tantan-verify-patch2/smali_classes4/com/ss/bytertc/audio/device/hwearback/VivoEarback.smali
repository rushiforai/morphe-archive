.class public Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;


# static fields
.field private static final TAG:Ljava/lang/String; = "com.ss.bytertc.audio.device.hwearback.VivoEarback"


# instance fields
.field private isKtvDeviceOpened:Z

.field private slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

.field private vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

.field private webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->isKtvDeviceOpened:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 8
    .line 9
    return-void
.end method

.method private printLog(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ":"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public close()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "close"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->printLog(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->stop()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setPlayFeedbackParam(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setCustomMode(I)V

    .line 28
    .line 29
    .line 30
    return v1

    .line 31
    :cond_0
    const/4 p0, -0x1

    .line 32
    return p0
.end method

.method public getLatency()I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public init()I
    .locals 4

    .line 1
    new-instance v0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 2
    .line 3
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 11
    .line 12
    new-instance v0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->setRequireDeepBuffer(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->isSupport()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackSupported(Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v3, "inited, isSupportHardwareEarback="

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->printLog(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return v1
.end method

.method public isSupport()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->isDeviceSupportKaraoke()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public onEvent(II)V
    .locals 0

    return-void
.end method

.method public open()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->isKtvDeviceOpened:Z

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->isDeviceSupportKaraoke()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->openKTVDevice()V

    .line 23
    .line 24
    .line 25
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->isKtvDeviceOpened:Z

    .line 26
    .line 27
    :cond_0
    const-string v0, "open"

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->printLog(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->play()V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setPlayFeedbackParam(I)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_1
    const/4 p0, -0x1

    .line 45
    return p0
.end method

.method public release()I
    .locals 2

    .line 1
    const-string v0, "release"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->printLog(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->close()I

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->closeKTVDevice()V

    .line 17
    .line 18
    .line 19
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->isKtvDeviceOpened:Z

    .line 20
    .line 21
    :cond_0
    return v1
.end method

.method public setEffect(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "setEffect value="

    .line 9
    .line 10
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->printLog(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    if-ltz p1, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->getEffectSize()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-gt p1, v2, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setCustomMode(I)V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :cond_0
    sget-object v2, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->TAG:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->getEffectSize()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    filled-new-array {v0, p0, p1}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "ByteAudioEarBackEffect vivo valid is [%d,%d], value is %d, ignore it"

    .line 65
    .line 66
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return v1
.end method

.method public setEqualizer(I)I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public setVolume(I)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "setVolume volume="

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->printLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-wide/high16 v0, 0x402e000000000000L    # 15.0

    .line 23
    .line 24
    int-to-double v2, p1

    .line 25
    mul-double/2addr v2, v0

    .line 26
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    .line 27
    .line 28
    div-double/2addr v2, v0

    .line 29
    double-to-int p1, v2

    .line 30
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;->vivoKtvHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setMicVolParam(I)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, -0x1

    .line 38
    return p0
.end method
