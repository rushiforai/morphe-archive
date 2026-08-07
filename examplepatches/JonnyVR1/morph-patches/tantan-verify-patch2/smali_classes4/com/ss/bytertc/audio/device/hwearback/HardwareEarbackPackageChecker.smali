.class public Lcom/ss/bytertc/audio/device/hwearback/HardwareEarbackPackageChecker;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static isHnEarbackPackageSupported()Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-static {v2}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;->isDeviceSupported(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v2
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    :try_start_1
    new-instance v3, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;

    .line 14
    .line 15
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-direct {v3, v4, v1}, Lcom/hihonor/android/magicx/media/audio/interfaces/HnAudioClient;-><init>(Landroid/content/Context;Lcom/hihonor/android/magicx/media/audio/interfaces/IAudioServiceCallback;)V
    :try_end_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_1

    .line 20
    .line 21
    .line 22
    move-object v1, v3

    .line 23
    goto :goto_0

    .line 24
    :catch_0
    move v2, v0

    .line 25
    :catch_1
    :cond_0
    :goto_0
    if-eqz v2, :cond_1

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    :cond_1
    return v0
.end method

.method public static isHwEarbackPackageSupported()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;

    .line 3
    .line 4
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-direct {v1, v2, v0}, Lcom/huawei/multimedia/audiokit/interfaces/HwAudioKit;-><init>(Landroid/content/Context;Lcom/huawei/multimedia/audiokit/interfaces/IAudioKitCallback;)V
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :catch_0
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    return v0
.end method
