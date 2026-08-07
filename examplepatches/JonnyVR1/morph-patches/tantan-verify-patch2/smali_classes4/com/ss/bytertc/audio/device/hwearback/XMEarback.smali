.class public Lcom/ss/bytertc/audio/device/hwearback/XMEarback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;


# instance fields
.field private isKtvDeviceOpened:Z

.field private slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

.field private webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

.field private xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;


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
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->isKtvDeviceOpened:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public close()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->stop()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->setPlayFeedbackParam(I)V

    .line 16
    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    const/4 p0, -0x1

    .line 20
    return p0
.end method

.method public getLatency()I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public init()I
    .locals 2

    .line 1
    new-instance v0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 2
    .line 3
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 11
    .line 12
    new-instance v0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->isSupport()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackSupported(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public isSupport()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->isDeviceSupportKaraoke()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 20
    .line 21
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->isAppSupportKaraoke(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    return v1
.end method

.method public onEvent(II)V
    .locals 0

    return-void
.end method

.method public open()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->isKtvDeviceOpened:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->isSupport()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->openKTVDevice()V

    .line 23
    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->isKtvDeviceOpened:Z

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->play()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->setPlayFeedbackParam(I)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, -0x1

    .line 40
    return p0
.end method

.method public release()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->close()I

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->closeKTVDevice()V

    .line 12
    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->isKtvDeviceOpened:Z

    .line 15
    .line 16
    :cond_0
    return v1
.end method

.method public setEffect(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->setFeedbackEffect(I)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public setEqualizer(I)I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public setVolume(I)I
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;->xmKtvHelper:Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-wide/high16 v0, 0x402e000000000000L    # 15.0

    .line 6
    .line 7
    int-to-double v2, p1

    .line 8
    mul-double/2addr v2, v0

    .line 9
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    .line 10
    .line 11
    div-double/2addr v2, v0

    .line 12
    double-to-int p1, v2

    .line 13
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->setMicVolParam(I)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, -0x1

    .line 19
    return p0
.end method
