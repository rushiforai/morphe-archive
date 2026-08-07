.class public Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;
    }
.end annotation


# static fields
.field private static final DEFAULT_FEATURE_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final ENGINE_CLASS_NAME:Ljava/lang/String; = "com.huawei.multimedia.audioengine.HwAudioEngineService"

.field private static final TAG:Ljava/lang/String; = "HwAudioKit.HwAudioKit"


# instance fields
.field private mConnection:Landroid/content/ServiceConnection;

.field private mContext:Landroid/content/Context;

.field private mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

.field private mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

.field private mIHwAudioEngine:Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

.field private mIsServiceConnected:Z

.field private mService:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->DEFAULT_FEATURE_LIST:Ljava/util/List;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIHwAudioEngine:Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 11
    .line 12
    iput-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mService:Landroid/os/IBinder;

    .line 13
    .line 14
    new-instance v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;-><init>(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mConnection:Landroid/content/ServiceConnection;

    .line 20
    .line 21
    new-instance v0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$2;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$2;-><init>(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 27
    .line 28
    invoke-static {}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->getInstance()Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 33
    .line 34
    invoke-virtual {v0, p2}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->setCallBack(Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mContext:Landroid/content/Context;

    .line 38
    .line 39
    return-void
.end method

.method public static synthetic access$000(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIHwAudioEngine:Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$002(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;)Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIHwAudioEngine:Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$102(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->serviceInit(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Landroid/os/IBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->serviceLinkToDeath(Landroid/os/IBinder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Landroid/os/IBinder$DeathRecipient;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Landroid/os/IBinder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mService:Landroid/os/IBinder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Landroid/os/IBinder;)Landroid/os/IBinder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mService:Landroid/os/IBinder;

    .line 2
    .line 3
    return-object p1
.end method

.method private bindService(Landroid/content/Context;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "HwAudioKit.HwAudioKit"

    .line 12
    .line 13
    const-string v2, "bindService, mIsServiceConnected = %b"

    .line 14
    .line 15
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mConnection:Landroid/content/ServiceConnection;

    .line 27
    .line 28
    const-string v1, "com.huawei.multimedia.audioengine.HwAudioEngineService"

    .line 29
    .line 30
    invoke-virtual {v0, p1, p0, v1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->bindService(Landroid/content/Context;Landroid/content/ServiceConnection;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private serviceInit(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "serviceInit"

    .line 2
    .line 3
    const-string v1, "HwAudioKit.HwAudioKit"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIHwAudioEngine:Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-boolean p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0, p1, p2}, Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;->init(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "isFeatureSupported,RemoteException ex : %s"

    .line 32
    .line 33
    invoke-static {v1, p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private serviceLinkToDeath(Landroid/os/IBinder;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mService:Landroid/os/IBinder;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p1, v0, v1}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 13
    .line 14
    const/4 p1, 0x5

    .line 15
    invoke-virtual {p0, p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->onCallBack(I)V

    .line 16
    .line 17
    .line 18
    const-string p0, "HwAudioKit.HwAudioKit"

    .line 19
    .line 20
    const-string p1, "serviceLinkToDeath, RemoteException"

    .line 21
    .line 22
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public createFeature(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/AudioFeaturesKit;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/huawei/multimedia/liteav/audiokit/interfaces/AudioFeaturesKit;",
            ">(",
            "Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;->getFeatureType()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->createFeatureKit(ILandroid/content/Context;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/AudioFeaturesKit;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "HwAudioKit.HwAudioKit"

    .line 12
    .line 13
    const-string v2, "destroy, mIsServiceConnected = %b"

    .line 14
    .line 15
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 24
    .line 25
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mContext:Landroid/content/Context;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mConnection:Landroid/content/ServiceConnection;

    .line 30
    .line 31
    invoke-virtual {v0, v1, p0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public getSupportedFeatures()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "getSupportedFeatures"

    .line 2
    .line 3
    const-string v1, "HwAudioKit.HwAudioKit"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIHwAudioEngine:Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-boolean p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;->getSupportedFeatures()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    const-string p0, "getSupportedFeatures, createFeature,wait bind service fail"

    .line 22
    .line 23
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const-string p0, "getSupportedFeatures, service not bind"

    .line 27
    .line 28
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->DEFAULT_FEATURE_LIST:Ljava/util/List;

    .line 32
    .line 33
    return-object p0
.end method

.method public initialize()V
    .locals 3

    .line 1
    const-string v0, "initialize"

    .line 2
    .line 3
    const-string v1, "HwAudioKit.HwAudioKit"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mContext:Landroid/content/Context;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "mContext is null"

    .line 13
    .line 14
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 18
    .line 19
    const/4 v0, 0x7

    .line 20
    invoke-virtual {p0, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->onCallBack(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v2, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 25
    .line 26
    invoke-virtual {v2, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->isAudioKitSupport(Landroid/content/Context;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    const-string v0, "not install AudioKitEngine"

    .line 33
    .line 34
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mFeatureKitManager:Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 38
    .line 39
    const/4 v0, 0x2

    .line 40
    invoke-virtual {p0, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->onCallBack(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mContext:Landroid/content/Context;

    .line 45
    .line 46
    invoke-direct {p0, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->bindService(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public isFeatureSupported(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;->getFeatureType()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "HwAudioKit.HwAudioKit"

    .line 18
    .line 19
    const-string v3, "isFeatureSupported, type = %d"

    .line 20
    .line 21
    invoke-static {v2, v3, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object v1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIHwAudioEngine:Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->mIsServiceConnected:Z

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$FeatureType;->getFeatureType()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-interface {v1, p0}, Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;->isFeatureSupported(I)Z

    .line 37
    .line 38
    .line 39
    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    return p0

    .line 41
    :catch_0
    move-exception p0

    .line 42
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "isFeatureSupported,RemoteException ex : %s"

    .line 51
    .line 52
    invoke-static {v2, p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return v0
.end method
