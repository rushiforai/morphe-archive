.class public Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;
.implements Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;
.implements Lcom/tencent/liteav/basic/util/h$a;


# static fields
.field private static final BACKGROUND_CHECK_INTERVAL:I

.field private static final TAG:Ljava/lang/String; = "HuaweiAudioKit"


# instance fields
.field private mAudioKitCallback:Lcom/tencent/liteav/audio/impl/earmonitor/a;

.field private mBackgroundCheckTimer:Lcom/tencent/liteav/basic/util/h;

.field private mHwAudioKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

.field private mIsAudioKitIniting:Z

.field private mIsBackgroundWhenLastCheck:Z

.field private mIsEarMonitoringEnabled:Z

.field private mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

.field private final mUiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x3e8

    .line 2
    .line 3
    sput v0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->BACKGROUND_CHECK_INTERVAL:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mUiHandler:Landroid/os/Handler;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsAudioKitIniting:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsEarMonitoringEnabled:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsBackgroundWhenLastCheck:Z

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mHwAudioKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$002(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mHwAudioKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$102(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsAudioKitIniting:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$202(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/tencent/liteav/audio/impl/earmonitor/a;)Lcom/tencent/liteav/audio/impl/earmonitor/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mAudioKitCallback:Lcom/tencent/liteav/audio/impl/earmonitor/a;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$400(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->startTimer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->startSystemEarMonitoringInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->stopTimer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->stopSystemEarMonitoringInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->setSystemEarMonitoringVolumeInternal(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->dealWithAudioKitResultInternal(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private dealWithAudioKitResultInternal(I)V
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
    const-string v1, "HuaweiAudioKit"

    .line 10
    .line 11
    const-string v2, "on audio kit callback: %d"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsAudioKitIniting:Z

    .line 21
    .line 22
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mAudioKitCallback:Lcom/tencent/liteav/audio/impl/earmonitor/a;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-interface {p1, p0, v0}, Lcom/tencent/liteav/audio/impl/earmonitor/a;->onAudioKitInitFinished(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mHwAudioKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 30
    .line 31
    sget-object v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;->HWAUDIO_FEATURE_KARAOKE:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->isFeatureSupported(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mHwAudioKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->createFeature(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/AudioFeaturesKit;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 46
    .line 47
    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mAudioKitCallback:Lcom/tencent/liteav/audio/impl/earmonitor/a;

    .line 51
    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    invoke-interface {p1, p0, v1}, Lcom/tencent/liteav/audio/impl/earmonitor/a;->onEarMonitoringInitialized(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    const/16 v2, 0x3e8

    .line 59
    .line 60
    if-ne p1, v2, :cond_3

    .line 61
    .line 62
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mAudioKitCallback:Lcom/tencent/liteav/audio/impl/earmonitor/a;

    .line 63
    .line 64
    if-eqz p1, :cond_5

    .line 65
    .line 66
    invoke-interface {p1, p0, v0}, Lcom/tencent/liteav/audio/impl/earmonitor/a;->onEarMonitoringInitialized(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    const/16 v0, 0x70d

    .line 71
    .line 72
    if-eq p1, v0, :cond_5

    .line 73
    .line 74
    iget-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mAudioKitCallback:Lcom/tencent/liteav/audio/impl/earmonitor/a;

    .line 75
    .line 76
    if-eqz p1, :cond_5

    .line 77
    .line 78
    iget-boolean v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsAudioKitIniting:Z

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    invoke-interface {p1, p0, v1}, Lcom/tencent/liteav/audio/impl/earmonitor/a;->onAudioKitInitFinished(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;Z)V

    .line 83
    .line 84
    .line 85
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsAudioKitIniting:Z

    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    invoke-interface {p1, p0}, Lcom/tencent/liteav/audio/impl/earmonitor/a;->onAudioKitError(Lcom/tencent/liteav/audio/impl/earmonitor/TXSystemAudioKit;)V

    .line 89
    .line 90
    .line 91
    :cond_5
    return-void
.end method

.method private isAppInBackground()Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    new-instance v0, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 3
    .line 4
    invoke-direct {v0}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/app/ActivityManager;->getMyMemoryState(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    .line 8
    .line 9
    .line 10
    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    const/16 v1, 0x64

    .line 13
    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    :catch_0
    :cond_0
    return p0
.end method

.method private setSystemEarMonitoringVolumeInternal(I)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 6
    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "HuaweiAudioKit"

    .line 12
    .line 13
    const-string v2, "setSystemEarMonitoringVolumeInternal: %d, kit: %s"

    .line 14
    .line 15
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v1, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;->CMD_SET_VOCAL_VOLUME_BASE:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;

    .line 23
    .line 24
    invoke-virtual {v0, v1, p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;->setParameter(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit$ParameName;I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/16 v0, 0x70e

    .line 29
    .line 30
    const/4 v1, -0x2

    .line 31
    if-eq p1, v0, :cond_0

    .line 32
    .line 33
    if-ne p1, v1, :cond_1

    .line 34
    .line 35
    :cond_0
    invoke-direct {p0, v1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->dealWithAudioKitResultInternal(I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method private startSystemEarMonitoringInternal()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "HuaweiAudioKit"

    .line 8
    .line 9
    const-string v2, "startSystemEarMonitoring kit: %s"

    .line 10
    .line 11
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;->enableKaraokeFeature(Z)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/16 v2, 0x70d

    .line 27
    .line 28
    if-eq v0, v2, :cond_1

    .line 29
    .line 30
    const/16 v0, 0x3eb

    .line 31
    .line 32
    invoke-direct {p0, v0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->dealWithAudioKitResultInternal(I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsEarMonitoringEnabled:Z

    .line 37
    .line 38
    return-void
.end method

.method private startTimer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mBackgroundCheckTimer:Lcom/tencent/liteav/basic/util/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "HuaweiAudioKit"

    .line 7
    .line 8
    const-string v1, "start background checking timer"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/tencent/liteav/basic/util/h;

    .line 14
    .line 15
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1, p0}, Lcom/tencent/liteav/basic/util/h;-><init>(Landroid/os/Looper;Lcom/tencent/liteav/basic/util/h$a;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mBackgroundCheckTimer:Lcom/tencent/liteav/basic/util/h;

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    sget v1, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->BACKGROUND_CHECK_INTERVAL:I

    .line 26
    .line 27
    invoke-virtual {v0, p0, v1}, Lcom/tencent/liteav/basic/util/h;->a(II)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private stopSystemEarMonitoringInternal()V
    .locals 2

    .line 1
    const-string v0, "HuaweiAudioKit"

    .line 2
    .line 3
    const-string v1, "stopSystemEarMonitoring"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mKaraokeKit:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;->enableKaraokeFeature(Z)I

    .line 14
    .line 15
    .line 16
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsEarMonitoringEnabled:Z

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private stopTimer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mBackgroundCheckTimer:Lcom/tencent/liteav/basic/util/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "HuaweiAudioKit"

    .line 6
    .line 7
    const-string v1, "stop background checking timer"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mBackgroundCheckTimer:Lcom/tencent/liteav/basic/util/h;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/util/h;->a()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mBackgroundCheckTimer:Lcom/tencent/liteav/basic/util/h;

    .line 19
    .line 20
    :cond_0
    return-void
.end method


# virtual methods
.method public initialize(Landroid/content/Context;Lcom/tencent/liteav/audio/impl/earmonitor/a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mUiHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;-><init>(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/tencent/liteav/audio/impl/earmonitor/a;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onResult(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mUiHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$6;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$6;-><init>(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTimeout()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->isAppInBackground()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsEarMonitoringEnabled:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsBackgroundWhenLastCheck:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->stopSystemEarMonitoringInternal()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->startSystemEarMonitoringInternal()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsBackgroundWhenLastCheck:Z

    .line 25
    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    const-string v1, "HuaweiAudioKit"

    .line 29
    .line 30
    const-string v2, "app has gone to background."

    .line 31
    .line 32
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    iput-boolean v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mIsBackgroundWhenLastCheck:Z

    .line 36
    .line 37
    return-void
.end method

.method public setSystemEarMonitoringVolume(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mUiHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$5;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$5;-><init>(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public startSystemEarMonitoring()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mUiHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$3;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$3;-><init>(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public stopSystemEarMonitoring()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mUiHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$4;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$4;-><init>(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public uninitialize()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->mUiHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;-><init>(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
