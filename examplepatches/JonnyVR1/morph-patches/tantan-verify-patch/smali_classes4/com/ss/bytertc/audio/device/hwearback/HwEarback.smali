.class public Lcom/ss/bytertc/audio/device/hwearback/HwEarback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;


# instance fields
.field private hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;


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
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 6
    .line 7
    new-instance v0, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public close()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWEnableKaraoke(Z)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getLatency()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->getLatency()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public init()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWEarBack_init()V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public isSupport()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWGetKaraokeSupport()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onEvent(II)V
    .locals 0

    return-void
.end method

.method public open()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWEnableKaraoke(Z)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public release()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->close()I

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWDestroy()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setEffect(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWSetEffectMode(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setEqualizer(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->HWSetEqualizerMode(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setVolume(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;->hwEarback:Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/HWEarBackDeviceSupport;->setVolume(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
