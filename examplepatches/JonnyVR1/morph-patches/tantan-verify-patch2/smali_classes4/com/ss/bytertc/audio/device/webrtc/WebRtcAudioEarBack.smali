.class public Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private audioManager:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

.field private curEffect:I

.field private curEq:I

.field private curVolume:I

.field hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curVolume:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curEffect:I

    .line 8
    .line 9
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curEq:I

    .line 10
    .line 11
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->audioManager:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 12
    .line 13
    return-void
.end method

.method private createHWEarback()Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;
    .locals 2

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/hwearback/HardwareEarbackPackageChecker;->isHnEarbackPackageSupported()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "HardWareEarback"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/ss/bytertc/audio/device/hwearback/HnEarback;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/hwearback/HnEarback;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "Honor"

    .line 15
    .line 16
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/audio/device/hwearback/HardwareEarbackPackageChecker;->isHwEarbackPackageSupported()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    new-instance v0, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/hwearback/HwEarback;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "Huawei"

    .line 32
    .line 33
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method


# virtual methods
.method public ByteAudioEarBackEffect(I)V
    .locals 1

    .line 1
    :try_start_0
    iput p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curEffect:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->setEffect(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    const-string p1, "WebRtcAudioEarBack"

    .line 16
    .line 17
    const-string v0, "HW hardware earmonitor set effect is not support"

    .line 18
    .line 19
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public ByteAudioEarBackEnable(Z)I
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 3
    .line 4
    if-eqz v1, :cond_4

    .line 5
    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    invoke-interface {v1}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->open()I

    .line 9
    .line 10
    .line 11
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 12
    :try_start_1
    iget v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curVolume:I

    .line 13
    .line 14
    if-eq v1, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackSetVolume(I)I

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    move v0, p1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    iget v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curEq:I

    .line 24
    .line 25
    if-eq v1, v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackEqualizer(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curEffect:I

    .line 31
    .line 32
    if-eq v1, v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackEffect(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    .line 37
    :cond_2
    return p1

    .line 38
    :catchall_1
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_3
    :try_start_2
    invoke-interface {v1}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->close()I

    .line 41
    .line 42
    .line 43
    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 44
    return p0

    .line 45
    :cond_4
    return v0

    .line 46
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    const-string p1, "WebRtcAudioEarBack"

    .line 50
    .line 51
    const-string v1, "HW hardware earmonitor enable earback is not support"

    .line 52
    .line 53
    invoke-static {p1, v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return v0
.end method

.method public ByteAudioEarBackEqualizer(I)V
    .locals 1

    .line 1
    :try_start_0
    iput p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curEq:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->setEqualizer(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    const-string p1, "WebRtcAudioEarBack"

    .line 16
    .line 17
    const-string v0, "HW hardware earmonitor set eq is not support"

    .line 18
    .line 19
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public ByteAudioEarBackGetLatency()I
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->getLatency()I

    .line 7
    .line 8
    .line 9
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    return p0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return v0

    .line 14
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    const-string v1, "WebRtcAudioEarBack"

    .line 18
    .line 19
    const-string v2, "HW hardware earmonitor get latency is not support"

    .line 20
    .line 21
    invoke-static {v1, v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    return v0
.end method

.method public ByteAudioEarBackInit()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType(Ljava/lang/String;)Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->HW:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->HR:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->createHWEarback()Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 24
    .line 25
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 26
    .line 27
    const/16 v2, 0x21

    .line 28
    .line 29
    if-lt v1, v2, :cond_3

    .line 30
    .line 31
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->OP:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 32
    .line 33
    if-eq v0, v1, :cond_2

    .line 34
    .line 35
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->XM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 36
    .line 37
    if-eq v0, v1, :cond_2

    .line 38
    .line 39
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->RM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 40
    .line 41
    if-ne v0, v1, :cond_3

    .line 42
    .line 43
    :cond_2
    new-instance v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;

    .line 44
    .line 45
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-direct {v0, v1, p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;-><init>(Landroid/content/Context;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->VO:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 56
    .line 57
    if-ne v0, v1, :cond_4

    .line 58
    .line 59
    new-instance v0, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/hwearback/VivoEarback;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->XM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 68
    .line 69
    if-ne v0, v1, :cond_5

    .line 70
    .line 71
    new-instance v0, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/hwearback/XMEarback;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 77
    .line 78
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 79
    .line 80
    if-eqz v0, :cond_6

    .line 81
    .line 82
    invoke-interface {v0}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->init()I

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_6
    const/4 v0, 0x0

    .line 87
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackSupported(Z)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public ByteAudioEarBackRelease()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->release()I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackReleased(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public ByteAudioEarBackSetVolume(I)I
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    :try_start_0
    iput p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->curVolume:I

    .line 3
    .line 4
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->setVolume(I)I

    .line 9
    .line 10
    .line 11
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    return p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return v0

    .line 16
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    const-string p1, "WebRtcAudioEarBack"

    .line 20
    .line 21
    const-string v1, "HW hardware earmonitor set volume is not support"

    .line 22
    .line 23
    invoke-static {p1, v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return v0
.end method

.method public ByteAudioEarBackSupport()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->isSupport()Z

    .line 7
    .line 8
    .line 9
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    return p0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return v0

    .line 14
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    const-string v1, "WebRtcAudioEarBack"

    .line 18
    .line 19
    const-string v2, "HW hardware earmonitor get earback is not support"

    .line 20
    .line 21
    invoke-static {v1, v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    return v0
.end method

.method public onEvent(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->hardWareEarback:Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;->onEvent(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onHardwareEarbackReleased(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->audioManager:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->onHardwareEarbackReleased(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onHardwareEarbackSupportParamsGet(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->audioManager:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->onHardwareEarbackSupportParamsGet(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_1
    return-void
.end method

.method public onHardwareEarbackSupported(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->audioManager:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->onHardwareEarbackSupported(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
