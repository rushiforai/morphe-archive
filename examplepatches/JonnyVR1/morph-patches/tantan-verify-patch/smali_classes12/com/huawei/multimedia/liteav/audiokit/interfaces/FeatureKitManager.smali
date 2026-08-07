.class public Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final BIND_SERVICE_LOCK:Ljava/lang/Object;

.field private static final ENGINE_PACKAGE_NAME:Ljava/lang/String; = "com.huawei.multimedia.audioengine"

.field private static final NEW_FEATUREMANAGER_LOCK:Ljava/lang/Object;

.field private static final PACKAGE_INFO_FLAG:I = 0x0

.field private static final SET_CALL_BACK_LOCK:Ljava/lang/Object;

.field private static final TAG:Ljava/lang/String; = "HwAudioKit.FeatureKitManager"

.field private static final UNBIND_SERVICE_LOCK:Ljava/lang/Object;

.field private static sInstance:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;


# instance fields
.field private mCallBack:Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->SET_CALL_BACK_LOCK:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->NEW_FEATUREMANAGER_LOCK:Ljava/lang/Object;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/Object;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->BIND_SERVICE_LOCK:Ljava/lang/Object;

    .line 21
    .line 22
    new-instance v0, Ljava/lang/Object;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->UNBIND_SERVICE_LOCK:Ljava/lang/Object;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->mCallBack:Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;

    .line 6
    .line 7
    return-void
.end method

.method public static getInstance()Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->NEW_FEATUREMANAGER_LOCK:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->sInstance:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->sInstance:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->sInstance:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw v1
.end method


# virtual methods
.method public bindService(Landroid/content/Context;Landroid/content/ServiceConnection;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->BIND_SERVICE_LOCK:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_1

    .line 10
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "com.huawei.multimedia.audioengine"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    :try_start_1
    const-string p3, "HwAudioKit.FeatureKitManager"

    .line 21
    .line 22
    const-string v1, "bindService"

    .line 23
    .line 24
    invoke-static {p3, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p3, 0x1

    .line 28
    invoke-virtual {p1, v0, p2, p3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception p1

    .line 33
    :try_start_2
    const-string p2, "HwAudioKit.FeatureKitManager"

    .line 34
    .line 35
    const-string p3, "bindService, SecurityException, %s"

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p2, p3, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    monitor-exit p0

    .line 49
    return-void

    .line 50
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    throw p1
.end method

.method public createFeatureKit(ILandroid/content/Context;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/AudioFeaturesKit;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/huawei/multimedia/liteav/audiokit/interfaces/AudioFeaturesKit;",
            ">(I",
            "Landroid/content/Context;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "HwAudioKit.FeatureKitManager"

    .line 10
    .line 11
    const-string v1, "createFeatureKit, type = %d"

    .line 12
    .line 13
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v1, 0x1

    .line 21
    if-eq p1, v1, :cond_1

    .line 22
    .line 23
    const-string p1, "createFeatureKit, type error"

    .line 24
    .line 25
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    new-instance p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 30
    .line 31
    invoke-direct {p0, p2}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p2}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;->initialize(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public getCallBack()Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->mCallBack:Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAudioKitSupport(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const-string p0, "HwAudioKit.FeatureKitManager"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    :try_start_0
    const-string v1, "com.huawei.multimedia.audioengine"

    .line 14
    .line 15
    invoke-virtual {p1, v1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    const-string p1, "packageInfo is null"

    .line 22
    .line 23
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return v0

    .line 27
    :catch_0
    const-string p1, "isAudioKitSupport ,NameNotFoundException"

    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return v0

    .line 33
    :cond_1
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method public onCallBack(I)V
    .locals 3

    .line 1
    const-string v0, "HwAudioKit.FeatureKitManager"

    .line 2
    .line 3
    const-string v1, "onCallBack, result = %d"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->SET_CALL_BACK_LOCK:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    invoke-virtual {p0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->getCallBack()Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->getCallBack()Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0, p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;->onResult(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method public setCallBack(Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->mCallBack:Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;

    .line 2
    .line 3
    return-void
.end method

.method public unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    .locals 1

    .line 1
    const-string p0, "HwAudioKit.FeatureKitManager"

    .line 2
    .line 3
    const-string v0, "unbindService"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->UNBIND_SERVICE_LOCK:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter p0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p1
.end method
