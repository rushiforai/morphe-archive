.class public Lio/agora/utils2/internal/CommonUtility;
.super Ljava/lang/Object;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x11
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/utils2/internal/CommonUtility$Listener;,
        Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;,
        Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;,
        Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;,
        Lio/agora/utils2/internal/CommonUtility$SystemEventListener;
    }
.end annotation


# static fields
.field private static final INTERNAL_UPDATE_ROTATION:I = 0xc8

.field private static final LENGTH_SEPARATOR_CHARACTER:Ljava/lang/String; = "agora_length_&&_"

.field private static final OFFSET_SEPARATOR_CHARACTER:Ljava/lang/String; = "agora_offset_&&_"

.field public static final PREFIX_ASSETS:Ljava/lang/String; = "/assets/"

.field public static final PREFIX_URI:Ljava/lang/String; = "content://"

.field private static final TAG:Ljava/lang/String; = "CommonUtility"

.field static final UNKNOWN_BATTERY_PERCENTAGE:I = 0xff

.field private static final URI_PROTOCOL_HEAD:Ljava/lang/String; = "/proc/"

.field private static ignoreMonitor:Z

.field private static mProcessInfoHandler:Landroid/os/Handler;

.field private static volatile sInstance:Lio/agora/utils2/internal/CommonUtility;


# instance fields
.field private lastLocalIp4:Ljava/lang/String;

.field private lastLocalIp6:Ljava/lang/String;

.field private volatile lastOrientation:I

.field private volatile mBatteryPercentage:I

.field private mConnectionBroadcastReceiver:Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;

.field private final mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

.field private mDisposed:Z

.field private mExtraConnectivityFilterActionForTesting:Ljava/lang/String;

.field private final mHandler:Landroid/os/Handler;

.field private mLastOrientation:I

.field private mListener:Lio/agora/utils2/internal/CommonUtility$Listener;

.field private mOrientationListener:Landroid/view/OrientationEventListener;

.field private mOrientationObserver:Landroid/content/BroadcastReceiver;

.field private mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

.field private mPowerChangeReceiver:Lio/agora/utils2/internal/PowerChangeReceiver;

.field private mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;

.field private final mThreadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

.field private volatile mUpdateRotationTrigger:Z

.field private mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

.field private reference:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final rotationRunnable:Ljava/lang/Runnable;

.field private shouldGetIp:Z

.field private systemEventListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lio/agora/utils2/internal/CommonUtility$SystemEventListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    const/16 v1, 0xff

    iput v1, p0, Lio/agora/utils2/internal/CommonUtility;->mBatteryPercentage:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/agora/utils2/internal/CommonUtility;->mDisposed:Z

    iput-boolean v1, p0, Lio/agora/utils2/internal/CommonUtility;->mUpdateRotationTrigger:Z

    const/4 v2, -0x1

    iput v2, p0, Lio/agora/utils2/internal/CommonUtility;->lastOrientation:I

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mConnectionBroadcastReceiver:Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mPowerChangeReceiver:Lio/agora/utils2/internal/PowerChangeReceiver;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationListener:Landroid/view/OrientationEventListener;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationObserver:Landroid/content/BroadcastReceiver;

    iput v2, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->reference:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->shouldGetIp:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    new-instance v0, Lio/agora/utils2/internal/CommonUtility$10;

    invoke-direct {v0, p0}, Lio/agora/utils2/internal/CommonUtility$10;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->rotationRunnable:Ljava/lang/Runnable;

    const-string v0, "CommonUtility"

    const-string v1, "constructor()"

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    new-instance p1, Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    invoke-direct {p1}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;-><init>()V

    iput-object p1, p0, Lio/agora/utils2/internal/CommonUtility;->mThreadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    new-instance p1, Landroid/os/HandlerThread;

    const-string v0, "UtilityThread"

    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    new-instance p1, Lio/agora/utils2/internal/CommonUtility$1;

    invoke-direct {p1, p0}, Lio/agora/utils2/internal/CommonUtility$1;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;J)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    const/16 p3, 0xff

    iput p3, p0, Lio/agora/utils2/internal/CommonUtility;->mBatteryPercentage:I

    const/4 p3, 0x0

    iput-boolean p3, p0, Lio/agora/utils2/internal/CommonUtility;->mDisposed:Z

    iput-boolean p3, p0, Lio/agora/utils2/internal/CommonUtility;->mUpdateRotationTrigger:Z

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/utils2/internal/CommonUtility;->lastOrientation:I

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mConnectionBroadcastReceiver:Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mPowerChangeReceiver:Lio/agora/utils2/internal/PowerChangeReceiver;

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationListener:Landroid/view/OrientationEventListener;

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationObserver:Landroid/content/BroadcastReceiver;

    iput v0, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    new-instance p2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->reference:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lio/agora/utils2/internal/CommonUtility;->shouldGetIp:Z

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    new-instance p2, Lio/agora/utils2/internal/CommonUtility$10;

    invoke-direct {p2, p0}, Lio/agora/utils2/internal/CommonUtility$10;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->rotationRunnable:Ljava/lang/Runnable;

    const-string p2, "CommonUtility"

    const-string p3, "constructor()"

    invoke-static {p2, p3}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    new-instance p1, Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    invoke-direct {p1}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;-><init>()V

    iput-object p1, p0, Lio/agora/utils2/internal/CommonUtility;->mThreadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    new-instance p1, Landroid/os/HandlerThread;

    const-string p2, "UtilityThread"

    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    new-instance p2, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    new-instance p1, Lio/agora/utils2/internal/CommonUtility$2;

    invoke-direct {p1, p0}, Lio/agora/utils2/internal/CommonUtility$2;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    invoke-virtual {p2, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static synthetic access$000(Lio/agora/utils2/internal/CommonUtility;)V
    .locals 0

    invoke-direct {p0}, Lio/agora/utils2/internal/CommonUtility;->stopMonitor()V

    return-void
.end method

.method public static synthetic access$100()Landroid/os/Handler;
    .locals 1

    sget-object v0, Lio/agora/utils2/internal/CommonUtility;->mProcessInfoHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static synthetic access$102(Landroid/os/Handler;)Landroid/os/Handler;
    .locals 0

    sput-object p0, Lio/agora/utils2/internal/CommonUtility;->mProcessInfoHandler:Landroid/os/Handler;

    return-object p0
.end method

.method public static synthetic access$200(Lio/agora/utils2/internal/CommonUtility;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method public static synthetic access$300(Ljava/net/InetAddress;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lio/agora/utils2/internal/CommonUtility;->inetAddressToIpAddress(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic access$400(Lio/agora/utils2/internal/CommonUtility;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static synthetic access$502(Lio/agora/utils2/internal/CommonUtility;Z)Z
    .locals 0

    iput-boolean p1, p0, Lio/agora/utils2/internal/CommonUtility;->mUpdateRotationTrigger:Z

    return p1
.end method

.method public static checkAccessNetworkState(Landroid/content/Context;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    const-string v3, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p0, v3, v1, v2}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0
.end method

.method public static checkAccessWifiState(Landroid/content/Context;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    const-string v3, "android.permission.ACCESS_WIFI_STATE"

    invoke-virtual {p0, v3, v1, v2}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0
.end method

.method private disableDisplayListener()V
    .locals 2

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v1, "display"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/DisplayManager;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    invoke-virtual {v0, v1}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    :cond_1
    const-string p0, "CommonUtility"

    const-string v0, "[disableDisplayListener] done!"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private enableDisplayListener(Landroid/content/Context;)V
    .locals 1

    if-eqz p1, :cond_2

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "display"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/display/DisplayManager;

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    new-instance v0, Lio/agora/utils2/internal/CommonUtility$9;

    invoke-direct {v0, p0}, Lio/agora/utils2/internal/CommonUtility$9;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, p0}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V

    const-string p0, "CommonUtility"

    const-string p1, "[enableDisplayListener] done!"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private static fillWifiInfoIfPossible(Landroid/content/Context;Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V
    .locals 5

    invoke-static {p0}, Lio/agora/utils2/internal/CommonUtility;->checkAccessWifiState(Landroid/content/Context;)Z

    move-result v0

    const-string v1, "CommonUtility"

    if-nez v0, :cond_0

    const-string p0, "fail to fillWifiInfo, permission ACCESS_WIFI_STATE not granted"

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "wifi"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/wifi/WifiManager;

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->getDhcpInfo()Landroid/net/DhcpInfo;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "exception occured when getDhcpInfo: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v0

    :goto_0
    if-eqz v2, :cond_1

    iget v2, v2, Landroid/net/DhcpInfo;->gateway:I

    invoke-static {v2}, Lio/agora/utils2/internal/CommonUtility;->intToInetAddress(I)Ljava/net/InetAddress;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->gatewayIp4:Ljava/lang/String;

    :cond_1
    :try_start_1
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "exception occured when getConnectionInfo: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result p0

    iput p0, p1, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->rssi:I

    const/4 v1, 0x5

    invoke-static {p0, v1}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result p0

    iput p0, p1, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->signalLevel:I

    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getLinkSpeed()I

    move-result p0

    iput p0, p1, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->linkspeed:I

    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getFrequency()I

    move-result p0

    iput p0, p1, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->frequency:I

    const/16 v0, 0x1388

    if-lt p0, v0, :cond_2

    const/16 p0, 0x65

    :goto_2
    iput p0, p1, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->networkSubtype:I

    goto :goto_3

    :cond_2
    const/16 v0, 0x960

    if-lt p0, v0, :cond_4

    const/16 p0, 0x64

    goto :goto_2

    :cond_3
    const-string p0, "fail to fillWifiInfo, wifiInfo null"

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    :goto_3
    return-void
.end method

.method public static getAndroidVersion()I
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method

.method private static getAppPrivateStorageDir(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    const-string v0, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getAssetsFilePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    const-string v0, "getAssetsFilePath for init offset:"

    const-string v1, "CommonUtility"

    const/4 v2, 0x0

    if-eqz p0, :cond_4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_5

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v3, "/assets/"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x8

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-static {p1}, Landroid/os/ParcelFileDescriptor;->dup(Ljava/io/FileDescriptor;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-gez p1, :cond_1

    :try_start_2
    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v2

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-object v2

    :cond_1
    :try_start_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "agora_offset_&&_"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, "agora_length_&&_"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->getDeclaredLength()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->getDeclaredLength()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    :catch_1
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2

    :catchall_0
    move-exception p1

    move-object v2, p0

    goto :goto_3

    :catch_2
    move-exception p1

    move-object v7, v2

    move-object v2, p0

    move-object p0, v7

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_3

    :catch_3
    move-exception p1

    move-object p0, v2

    :goto_0
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v2, :cond_2

    :try_start_6
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_1

    :catch_4
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_2
    :goto_1
    move-object v2, p0

    :goto_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "getAssetsFilePath is: "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :goto_3
    if-eqz v2, :cond_3

    :try_start_7
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    goto :goto_4

    :catch_5
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_3
    :goto_4
    throw p1

    :cond_4
    :goto_5
    const-string p0, "getAssetsFilePath failed for init error"

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method

.method public static getContentFilePath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .locals 3

    const-string v0, "CommonUtility"

    const/4 v1, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto/16 :goto_5

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    :try_start_0
    const-string v2, "r"

    invoke-virtual {p0, p1, v2}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-static {p1}, Landroid/os/ParcelFileDescriptor;->dup(Ljava/io/FileDescriptor;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2

    :catchall_0
    move-exception p1

    move-object v1, p0

    goto :goto_3

    :catch_1
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_3

    :catch_2
    move-exception p1

    move-object p0, v1

    :goto_0
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p0, :cond_1

    :try_start_4
    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_1

    :catch_3
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    :goto_1
    const/4 p1, -0x1

    :goto_2
    if-gez p1, :cond_2

    return-object v1

    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "/proc/"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/fd/"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "getContentFilePath is: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :goto_3
    if-eqz v1, :cond_3

    :try_start_5
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_4

    :catch_4
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_3
    :goto_4
    throw p1

    :cond_4
    :goto_5
    const-string p0, "getContentFilePath failed for init error"

    invoke-static {v0, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public static getContextInfo(Landroid/content/Context;)Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    if-nez p0, :cond_0

    const-string p0, "CommonUtility"

    const-string v0, "fail to getContextInfo, context null"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;

    invoke-direct {v0}, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;-><init>()V

    invoke-static {}, Lio/agora/utils2/internal/DeviceUtils;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->device:Ljava/lang/String;

    invoke-static {p0}, Lio/agora/utils2/internal/CommonUtility;->getAppPrivateStorageDir(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->configDir:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->pluginDir:Ljava/lang/String;

    invoke-static {}, Lio/agora/utils2/internal/DeviceUtils;->getDeviceInfo()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->deviceInfo:Ljava/lang/String;

    invoke-static {}, Lio/agora/utils2/internal/DeviceUtils;->getSystemInfo()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->systemInfo:Ljava/lang/String;

    invoke-static {}, Lio/agora/utils2/internal/DeviceUtils;->getManufacturer()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->manufacturer:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->pkgName:Ljava/lang/String;

    return-object v0
.end method

.method public static getCpuTemperature()I
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-static {}, Lio/agora/utils2/internal/DeviceUtils;->getCpuTemperature()I

    move-result v0

    return v0
.end method

.method public static getDisplayMetrics()[I
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    filled-new-array {v1, v1}, [I

    move-result-object v0

    return-object v0

    :cond_0
    const-string v2, "window"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    if-nez v0, :cond_1

    filled-new-array {v1, v1}, [I

    move-result-object v0

    return-object v0

    :cond_1
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    if-nez v0, :cond_2

    filled-new-array {v1, v1}, [I

    move-result-object v0

    return-object v0

    :cond_2
    invoke-virtual {v0, v2}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getDisplayMetrics widthPixel: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " , heightPixel: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CommonUtility"

    invoke-static {v1, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v1, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    filled-new-array {v0, v1}, [I

    move-result-object v0

    return-object v0
.end method

.method public static getDisplayXYDpi()[F
    .locals 4
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    if-nez v0, :cond_0

    :goto_0
    new-array v0, v1, [F

    fill-array-data v0, :array_0

    return-object v0

    :cond_0
    const-string v2, "window"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0, v2}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "getDisplayXYDpi xdpi: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, v2, Landroid/util/DisplayMetrics;->xdpi:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " , ydpi: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v2, Landroid/util/DisplayMetrics;->ydpi:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "CommonUtility"

    invoke-static {v3, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, v2, Landroid/util/DisplayMetrics;->xdpi:F

    iget v2, v2, Landroid/util/DisplayMetrics;->ydpi:F

    new-array v1, v1, [F

    const/4 v3, 0x0

    aput v0, v1, v3

    const/4 v0, 0x1

    aput v2, v1, v0

    return-object v1

    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public static getInstance(Landroid/content/Context;)Lio/agora/utils2/internal/CommonUtility;
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    sget-object v0, Lio/agora/utils2/internal/CommonUtility;->sInstance:Lio/agora/utils2/internal/CommonUtility;

    if-nez v0, :cond_1

    const-class v0, Lio/agora/utils2/internal/CommonUtility;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lio/agora/utils2/internal/CommonUtility;->sInstance:Lio/agora/utils2/internal/CommonUtility;

    if-nez v1, :cond_0

    new-instance v1, Lio/agora/utils2/internal/CommonUtility;

    invoke-direct {v1, p0}, Lio/agora/utils2/internal/CommonUtility;-><init>(Landroid/content/Context;)V

    sput-object v1, Lio/agora/utils2/internal/CommonUtility;->sInstance:Lio/agora/utils2/internal/CommonUtility;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_2
    sget-object p0, Lio/agora/utils2/internal/CommonUtility;->sInstance:Lio/agora/utils2/internal/CommonUtility;

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->reference:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    sget-object p0, Lio/agora/utils2/internal/CommonUtility;->sInstance:Lio/agora/utils2/internal/CommonUtility;

    return-object p0
.end method

.method private static getIpAddressByType(Ljava/net/InetAddress;ZLjava/lang/StringBuilder;)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_1

    instance-of v0, p0, Ljava/net/Inet4Address;

    if-eqz v0, :cond_1

    invoke-static {p0}, Lio/agora/utils2/internal/CommonUtility;->getPublicIpAddress(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    return-object p0

    :cond_1
    if-nez p1, :cond_3

    instance-of p1, p0, Ljava/net/Inet6Address;

    if-eqz p1, :cond_3

    invoke-static {p0}, Lio/agora/utils2/internal/CommonUtility;->getPublicIpAddress(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    return-object p0

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getLocalHost(Z)Ljava/lang/String;
    .locals 5
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/NetworkInterface;

    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "usb"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/InetAddress;

    invoke-static {v3, p0, v1}, Lio/agora/utils2/internal/CommonUtility;->getIpAddressByType(Ljava/net/InetAddress;ZLjava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    return-object v3

    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_4

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "CommonUtility"

    const-string v1, "fail to getLocalHost"

    invoke-static {v0, v1, p0}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getLocalHostList()[Ljava/lang/String;
    .locals 6
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/NetworkInterface;

    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "usb"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/InetAddress;

    invoke-static {v4}, Lio/agora/utils2/internal/CommonUtility;->inetAddressToIpAddress(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "+"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    aput-object v3, v0, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_4
    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "CommonUtility"

    const-string v2, "fail to getLocalHostList"

    invoke-static {v1, v2, v0}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    const/4 v0, 0x0

    return-object v0
.end method

.method private getNetworkInfo(Landroid/content/Context;)Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;
    .locals 5

    .line 1
    new-instance v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;

    invoke-direct {v0}, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;-><init>()V

    invoke-static {p1}, Lio/agora/utils2/internal/CommonUtility;->checkAccessNetworkState(Landroid/content/Context;)Z

    move-result v1

    const-string v2, "CommonUtility"

    if-nez v1, :cond_0

    const-string p0, "fail to getNetworkInfo, permission ACCESS_NETWORK_STATE not granted"

    invoke-static {v2, p0}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    iget-boolean v1, p0, Lio/agora/utils2/internal/CommonUtility;->shouldGetIp:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-static {v1}, Lio/agora/utils2/internal/CommonUtility;->getLocalHost(Z)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->lastLocalIp4:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v1}, Lio/agora/utils2/internal/CommonUtility;->getLocalHost(Z)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->lastLocalIp6:Ljava/lang/String;

    iput-boolean v1, p0, Lio/agora/utils2/internal/CommonUtility;->shouldGetIp:Z

    :cond_1
    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->lastLocalIp4:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->lastLocalIp4:Ljava/lang/String;

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->localIp4:Ljava/lang/String;

    :cond_2
    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->lastLocalIp6:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->lastLocalIp6:Ljava/lang/String;

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->localIp6:Ljava/lang/String;

    :cond_3
    invoke-static {p1}, Lio/agora/utils2/internal/Connectivity;->getNetworkInfo(Landroid/content/Context;)Landroid/net/NetworkInfo;

    move-result-object v1

    invoke-static {v1}, Lio/agora/utils2/internal/Connectivity;->getNetworkType(Landroid/net/NetworkInfo;)I

    move-result v3

    iput v3, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->networkType:I

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v1

    iput v1, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->networkSubtype:I

    :cond_4
    invoke-static {}, Lio/agora/utils2/internal/Connectivity;->getDnsList()Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->dnsList:Ljava/util/ArrayList;

    iget v1, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->networkType:I

    const/4 v3, 0x2

    const-string v4, " level = "

    if-ne v1, v3, :cond_5

    invoke-static {p1, v0}, Lio/agora/utils2/internal/CommonUtility;->fillWifiInfoIfPossible(Landroid/content/Context;Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "networkType from WIFI, rssi = "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_0
    iget v1, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->rssi:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->signalLevel:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

    if-eqz v1, :cond_6

    invoke-virtual {v1, p1, v0}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;->fillCellInfoIfPossible(Landroid/content/Context;Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "networkType from Phone State Listener\uff0c rssi = "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_6
    :goto_1
    invoke-virtual {p0}, Lio/agora/utils2/internal/CommonUtility;->getVpnIfconfigs()Ljava/util/ArrayList;

    move-result-object p0

    iput-object p0, v0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->ifconfigs:Ljava/util/ArrayList;

    return-object v0
.end method

.method private static getPublicIpAddress(Ljava/net/InetAddress;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private getRotationByDM()I
    .locals 1

    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "display"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/hardware/display/DisplayManager;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    move-result p0

    return p0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private getRotationByWM()I
    .locals 1

    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static getSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "android.os.SystemProperties"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    const-string v2, "get"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, v0, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public static getSystemService(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static inetAddressToIpAddress(Ljava/net/InetAddress;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/Inet4Address;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/net/Inet4Address;

    invoke-virtual {p0}, Ljava/net/Inet4Address;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static intToInetAddress(I)Ljava/net/InetAddress;
    .locals 5

    and-int/lit16 v0, p0, 0xff

    int-to-byte v0, v0

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    shr-int/lit8 v2, p0, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    shr-int/lit8 p0, p0, 0x18

    and-int/lit16 p0, p0, 0xff

    int-to-byte p0, p0

    const/4 v3, 0x4

    new-array v3, v3, [B

    const/4 v4, 0x0

    aput-byte v0, v3, v4

    const/4 v0, 0x1

    aput-byte v1, v3, v0

    const/4 v0, 0x2

    aput-byte v2, v3, v0

    const/4 v0, 0x3

    aput-byte p0, v3, v0

    :try_start_0
    invoke-static {v3}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p0
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static isAppInForeground()Z
    .locals 6
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    new-instance v0, Landroid/app/ActivityManager$RunningAppProcessInfo;

    invoke-direct {v0}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    new-instance v1, Ljava/util/concurrent/CountDownLatch;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    new-instance v3, Lio/agora/utils2/internal/CommonUtility$8;

    invoke-direct {v3, v0, v1}, Lio/agora/utils2/internal/CommonUtility$8;-><init>(Landroid/app/ActivityManager$RunningAppProcessInfo;Ljava/util/concurrent/CountDownLatch;)V

    sget-object v4, Lio/agora/utils2/internal/CommonUtility;->mProcessInfoHandler:Landroid/os/Handler;

    if-nez v4, :cond_0

    new-instance v4, Landroid/os/HandlerThread;

    const-string v5, "processInfo"

    invoke-direct {v4, v5}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    new-instance v5, Landroid/os/Handler;

    invoke-virtual {v4}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v5, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v5, Lio/agora/utils2/internal/CommonUtility;->mProcessInfoHandler:Landroid/os/Handler;

    :cond_0
    sget-object v4, Lio/agora/utils2/internal/CommonUtility;->mProcessInfoHandler:Landroid/os/Handler;

    invoke-virtual {v4, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const-wide/16 v3, 0x64

    invoke-static {v1, v3, v4}, Lio/agora/base/internal/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;J)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v0, "CommonUtility"

    const-string v1, "get App InForeground state timeout."

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lio/agora/utils2/internal/CommonUtility;->mProcessInfoHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return v2

    :cond_1
    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_3

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    return v0

    :cond_3
    :goto_0
    return v2
.end method

.method public static isSimulator()Z
    .locals 8
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const-string v0, "CommonUtility"

    const-string v1, "manufacturer = "

    const-string v2, ""

    const/4 v3, 0x0

    :try_start_0
    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string v6, "netease"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    invoke-virtual {v1, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_0
    :goto_0
    move v5, v3

    goto :goto_1

    :catch_1
    move-object v4, v2

    goto :goto_0

    :catch_2
    :goto_1
    const-string v1, "get manufacturer info fail."

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    invoke-static {}, Lio/agora/utils2/internal/CommonUtility;->isSimulatorProperty()Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v5, v5, 0x1

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    const-string v6, "welldo"

    const/4 v7, 0x1

    if-le v0, v1, :cond_3

    const-string v0, "nokia"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "Nokia_N1"

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "N1"

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    return v3

    :cond_2
    if-lez v5, :cond_5

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    return v7

    :cond_3
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    if-lez v5, :cond_5

    :cond_4
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    return v7

    :cond_5
    return v3
.end method

.method private static isSimulatorProperty()Z
    .locals 12

    const-string v0, "android"

    const-string v1, "CommonUtility"

    const-string v2, ""

    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const/4 v4, 0x1

    const/4 v5, 0x0

    :try_start_0
    const-string v6, "ro.hardware"

    invoke-static {v6}, Lio/agora/utils2/internal/CommonUtility;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v6, :cond_0

    :try_start_1
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, "intel"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v7, :cond_1

    :cond_0
    move v7, v4

    goto :goto_0

    :catch_0
    move-object v6, v2

    :catch_1
    const-string v7, "get property hardware fail."

    invoke-static {v1, v7}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    move v7, v5

    :goto_0
    :try_start_2
    const-string v8, "os.arch"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    if-eqz v8, :cond_2

    :try_start_3
    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    const-string v10, "i686"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    const-string v10, "asus"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    if-nez v9, :cond_3

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :catch_2
    move-object v8, v2

    :catch_3
    const-string v9, "get property arch fail."

    invoke-static {v1, v9}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_1
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x1c

    if-le v9, v10, :cond_c

    if-eqz v6, :cond_4

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    const-string v10, "ttvm"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_4

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    const-string v10, "nox"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_5

    :cond_4
    add-int/lit8 v7, v7, 0x1

    :cond_5
    :try_start_4
    const-string v9, "ro.build.flavor"

    invoke-static {v9}, Lio/agora/utils2/internal/CommonUtility;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    if-eqz v9, :cond_6

    :try_start_5
    const-string v10, "vbox"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_6

    const-string v10, "sdk_gphone"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    if-eqz v10, :cond_7

    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :catch_4
    move-object v9, v2

    :catch_5
    const-string v10, "get property buildFlavor fail."

    invoke-static {v1, v10}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    :goto_2
    :try_start_6
    const-string v10, "ro.product.board"

    invoke-static {v10}, Lio/agora/utils2/internal/CommonUtility;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    if-eqz v10, :cond_8

    :try_start_7
    invoke-virtual {v10, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_8

    const-string v11, "goldfish"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    if-eqz v11, :cond_9

    :cond_8
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :catch_6
    move-object v10, v2

    :catch_7
    const-string v11, "get property productBoard fail."

    invoke-static {v1, v11}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    :goto_3
    :try_start_8
    const-string v11, "ro.board.platform"

    invoke-static {v11}, Lio/agora/utils2/internal/CommonUtility;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    if-eqz v0, :cond_b

    :cond_a
    add-int/lit8 v7, v7, 0x1

    :cond_b
    :goto_4
    move-object v0, v2

    move-object v2, v9

    goto :goto_5

    :catch_8
    const-string v0, "get property boardPlatform fail."

    invoke-static {v1, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_c
    move-object v0, v2

    move-object v10, v0

    :goto_5
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v11, "suspectCount = "

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, ", hardware = "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", arch = "

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", baseBandVersion = , buildFlavor = "

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", productBoard = "

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", boardPlatform = "

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", manufacturer = "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-lez v7, :cond_d

    goto :goto_6

    :cond_d
    move v4, v5

    :goto_6
    return v4
.end method

.method public static isSpeakerphoneEnabled(Landroid/content/Context;)I
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    if-nez p0, :cond_0

    const-string p0, "CommonUtility"

    const-string v0, "fail to isSpeakerphoneEnabled, context null"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0

    :cond_0
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/AudioManager;

    invoke-virtual {p0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result p0

    return p0
.end method

.method private monitorOrientationChange(Landroid/content/Context;Z)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-direct {p0, p1}, Lio/agora/utils2/internal/CommonUtility;->enableDisplayListener(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lio/agora/utils2/internal/CommonUtility;->regiseterBroadcaster(Landroid/content/Context;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lio/agora/utils2/internal/CommonUtility;->disableDisplayListener()V

    invoke-direct {p0, p1}, Lio/agora/utils2/internal/CommonUtility;->unregisterBroadcaster(Landroid/content/Context;)V

    return-void
.end method

.method private regiseterBroadcaster(Landroid/content/Context;)V
    .locals 2

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationObserver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_1

    :goto_0
    return-void

    :cond_1
    new-instance v0, Lio/agora/utils2/internal/CommonUtility$11;

    invoke-direct {v0, p0}, Lio/agora/utils2/internal/CommonUtility$11;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationObserver:Landroid/content/BroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationObserver:Landroid/content/BroadcastReceiver;

    invoke-static {p1, p0, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const-string p0, "CommonUtility"

    const-string p1, "[regiseterBroadcaster] done!"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static safeLoadLibrary(Ljava/lang/String;)I
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, -0x2

    return p0

    :cond_0
    const/4 v0, -0x1

    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x0

    :catch_0
    return v0
.end method

.method public static setIgnoreMonitor(Z)V
    .locals 0

    sput-boolean p0, Lio/agora/utils2/internal/CommonUtility;->ignoreMonitor:Z

    return-void
.end method

.method private stopMonitor()V
    .locals 6

    const-string v0, "stopMonitor()"

    const-string v1, "CommonUtility"

    invoke-static {v1, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Lio/agora/utils2/internal/CommonUtility;->mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

    if-eqz v4, :cond_1

    const-string v4, "phone"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    iget-object v5, p0, Lio/agora/utils2/internal/CommonUtility;->mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

    invoke-virtual {v4, v5, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    iput-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    :goto_0
    :try_start_1
    iget-object v4, p0, Lio/agora/utils2/internal/CommonUtility;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    if-eqz v4, :cond_2

    const-string v4, "connectivity"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/ConnectivityManager;

    iget-object v5, p0, Lio/agora/utils2/internal/CommonUtility;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v4, v5}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_2
    :goto_1
    :try_start_2
    iget-object v4, p0, Lio/agora/utils2/internal/CommonUtility;->mConnectionBroadcastReceiver:Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;

    if-eqz v4, :cond_3

    invoke-virtual {v0, v4}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mConnectionBroadcastReceiver:Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_3
    :goto_2
    :try_start_3
    iget-object v4, p0, Lio/agora/utils2/internal/CommonUtility;->mPowerChangeReceiver:Lio/agora/utils2/internal/PowerChangeReceiver;

    if-eqz v4, :cond_4

    invoke-virtual {v0, v4}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mPowerChangeReceiver:Lio/agora/utils2/internal/PowerChangeReceiver;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_4
    :goto_3
    :try_start_4
    iget-object v4, p0, Lio/agora/utils2/internal/CommonUtility;->mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    if-eqz v4, :cond_5

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Landroid/app/Application;

    iget-object v5, p0, Lio/agora/utils2/internal/CommonUtility;->mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    invoke-virtual {v4, v5}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    iput-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v3

    const-string v4, "unregister ProcessLifecycleOwner failed "

    invoke-static {v1, v4, v3}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    :goto_4
    :try_start_5
    invoke-direct {p0, v0, v2}, Lio/agora/utils2/internal/CommonUtility;->monitorOrientationChange(Landroid/content/Context;Z)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v0

    const-string v2, "Unable to monitorOrientationChange, "

    invoke-static {v1, v2, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_5
    invoke-virtual {p0}, Lio/agora/utils2/internal/CommonUtility;->closeGravityMonitor()I

    return-void
.end method

.method private unregisterBroadcaster(Landroid/content/Context;)V
    .locals 0

    if-eqz p1, :cond_1

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationObserver:Landroid/content/BroadcastReceiver;

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const-string p0, "CommonUtility"

    const-string p1, "[unregisterBroadcaster] done!"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public VPNBehindAddress()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    invoke-static {p0}, Lio/agora/utils2/internal/Connectivity;->VPNBehindAddress(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public bindSocket2Network(ILjava/lang/String;)V
    .locals 7
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/net/ConnectivityManager;

    new-instance v0, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v0}, Landroid/net/NetworkRequest$Builder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object p2, p0, Lio/agora/utils2/internal/CommonUtility;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    if-eqz p2, :cond_0

    invoke-virtual {v3, p2}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    :cond_0
    new-instance v1, Lio/agora/utils2/internal/CommonUtility$6;

    move-object v6, p0

    move-object v2, p0

    move v5, p1

    invoke-direct/range {v1 .. v6}, Lio/agora/utils2/internal/CommonUtility$6;-><init>(Lio/agora/utils2/internal/CommonUtility;Landroid/net/ConnectivityManager;Ljava/lang/String;ILio/agora/utils2/internal/CommonUtility;)V

    iput-object v1, v2, Lio/agora/utils2/internal/CommonUtility;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    :try_start_0
    invoke-virtual {v3, v0, v1}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p0, v0

    const/4 p1, 0x0

    iput-object p1, v2, Lio/agora/utils2/internal/CommonUtility;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "requestNetwork failed "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "CommonUtility"

    invoke-static {p1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public checkOrientation(I)I
    .locals 2

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    return v0

    :cond_0
    const/16 v0, 0x154

    if-gt p1, v0, :cond_1

    const/16 v0, 0x14

    if-ge p1, v0, :cond_2

    :cond_1
    iget v0, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    const/16 v1, 0x10e

    if-eq v0, v1, :cond_2

    :goto_0
    iput v1, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    goto :goto_1

    :cond_2
    const/16 v0, 0x46

    if-le p1, v0, :cond_3

    const/16 v0, 0x6e

    if-ge p1, v0, :cond_3

    iget v0, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    const/16 v1, 0xb4

    if-eq v0, v1, :cond_3

    goto :goto_0

    :cond_3
    const/16 v0, 0xa0

    if-le p1, v0, :cond_4

    const/16 v0, 0xc8

    if-ge p1, v0, :cond_4

    iget v0, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_4

    goto :goto_0

    :cond_4
    const/16 v0, 0xfa

    if-le p1, v0, :cond_5

    const/16 v0, 0x122

    if-ge p1, v0, :cond_5

    iget p1, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    if-eqz p1, :cond_5

    const/4 p1, 0x0

    iput p1, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    :cond_5
    :goto_1
    monitor-enter p0

    :try_start_0
    iget-object p1, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;

    iget v1, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    invoke-interface {v0, v1}, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;->onGravityOriChange(I)V

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :cond_6
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility;->mLastOrientation:I

    return p0

    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public closeGravityMonitor()I
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const-string v0, "CommonUtility"

    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    const/4 v2, -0x1

    if-nez v1, :cond_0

    return v2

    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationListener:Landroid/view/OrientationEventListener;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->disable()V

    const/4 v1, 0x0

    iput-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationListener:Landroid/view/OrientationEventListener;

    const-string p0, "[closeGravityMonitor] done!"

    invoke-static {v0, p0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :catch_0
    move-exception p0

    goto :goto_0

    :cond_1
    const-string p0, "[closeGravityMonitor] mOrientationListener is null!"

    invoke-static {v0, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :goto_0
    const-string v1, "Unable to close OrientationEventListener, "

    invoke-static {v0, v1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return v2
.end method

.method public dispose()V
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    sget-object v0, Lio/agora/utils2/internal/CommonUtility;->sInstance:Lio/agora/utils2/internal/CommonUtility;

    if-eqz v0, :cond_4

    sget-object v0, Lio/agora/utils2/internal/CommonUtility;->sInstance:Lio/agora/utils2/internal/CommonUtility;

    iget-object v0, v0, Lio/agora/utils2/internal/CommonUtility;->reference:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mThreadChecker:Lio/agora/base/internal/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lio/agora/base/internal/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    iget-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisposed:Z

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisposed:Z

    const-string v1, "CommonUtility"

    const-string v2, "dispose()"

    invoke-static {v1, v2}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    new-instance v2, Lio/agora/utils2/internal/CommonUtility$3;

    invoke-direct {v2, p0}, Lio/agora/utils2/internal/CommonUtility$3;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    sget-object v1, Lio/agora/utils2/internal/CommonUtility;->mProcessInfoHandler:Landroid/os/Handler;

    if-eqz v1, :cond_2

    new-instance v2, Lio/agora/utils2/internal/CommonUtility$4;

    invoke-direct {v2, p0}, Lio/agora/utils2/internal/CommonUtility$4;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_2
    new-instance v1, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    new-instance v2, Lio/agora/utils2/internal/CommonUtility$5;

    invoke-direct {v2, p0, v1}, Lio/agora/utils2/internal/CommonUtility$5;-><init>(Lio/agora/utils2/internal/CommonUtility;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :try_start_0
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mListener:Lio/agora/utils2/internal/CommonUtility$Listener;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/agora/utils2/internal/CommonUtility$Listener;->onDispose()V

    :cond_3
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const-class v0, Lio/agora/utils2/internal/CommonUtility;

    monitor-enter v0

    const/4 p0, 0x0

    :try_start_2
    sput-object p0, Lio/agora/utils2/internal/CommonUtility;->sInstance:Lio/agora/utils2/internal/CommonUtility;

    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    :cond_4
    :goto_1
    return-void
.end method

.method public getAssetsCacheFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "getAssetsCacheFile filePath: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "CommonUtility"

    invoke-static {v0, p0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "content://"

    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 p3, 0x0

    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    goto/16 :goto_10

    :cond_0
    :goto_0
    if-eqz p0, :cond_1

    :try_start_1
    new-instance p0, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string v1, "r"

    invoke-virtual {p1, p2, v1}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    move-object p1, p3

    goto/16 :goto_c

    :catch_1
    move-exception p0

    move-object p1, p3

    move-object p2, p1

    goto/16 :goto_4

    :catch_2
    move-exception p0

    move-object p1, p3

    move-object p2, p1

    goto/16 :goto_8

    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    :try_start_2
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    const/16 p2, 0x400

    :try_start_3
    new-array p2, p2, [B

    :goto_2
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_2

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v2, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p2

    move-object p3, p0

    move-object p0, p2

    goto/16 :goto_c

    :catch_3
    move-exception p2

    move-object v3, p1

    move-object p1, p0

    move-object p0, p2

    move-object p2, v3

    goto :goto_4

    :catch_4
    move-exception p2

    move-object v3, p1

    move-object p1, p0

    move-object p0, p2

    move-object p2, v3

    goto :goto_8

    :cond_2
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    goto :goto_3

    :catch_5
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_3
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catchall_2
    move-exception p1

    move-object v3, p3

    move-object p3, p0

    move-object p0, p1

    move-object p1, v3

    goto :goto_c

    :catch_6
    move-exception p1

    move-object p2, p1

    move-object p1, p0

    move-object p0, p2

    move-object p2, p3

    goto :goto_4

    :catch_7
    move-exception p1

    move-object p2, p1

    move-object p1, p0

    move-object p0, p2

    move-object p2, p3

    goto :goto_8

    :goto_4
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    if-eqz p1, :cond_3

    :try_start_6
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    goto :goto_5

    :catch_8
    move-exception p0

    goto :goto_6

    :cond_3
    :goto_5
    if-eqz p2, :cond_4

    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_8

    goto :goto_7

    :goto_6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_4
    :goto_7
    return-object p3

    :catchall_3
    move-exception p0

    move-object p3, p1

    move-object p1, p2

    goto :goto_c

    :goto_8
    :try_start_7
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    if-eqz p1, :cond_5

    :try_start_8
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    goto :goto_9

    :catch_9
    move-exception p0

    goto :goto_a

    :cond_5
    :goto_9
    if-eqz p2, :cond_6

    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_9

    goto :goto_b

    :goto_a
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_6
    :goto_b
    return-object p3

    :goto_c
    if-eqz p3, :cond_7

    :try_start_9
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V

    goto :goto_d

    :catch_a
    move-exception p1

    goto :goto_e

    :cond_7
    :goto_d
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_a

    goto :goto_f

    :goto_e
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_8
    :goto_f
    throw p0

    :goto_10
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-object p3
.end method

.method public getBatteryLifePercent()I
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_0

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility;->mBatteryPercentage:I

    return p0

    :cond_0
    const/16 p0, 0xff

    return p0
.end method

.method public getDisplayRotation()I
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->mUpdateRotationTrigger:Z

    if-nez v0, :cond_0

    iget v0, p0, Lio/agora/utils2/internal/CommonUtility;->lastOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility;->lastOrientation:I

    return p0

    :cond_0
    invoke-direct {p0}, Lio/agora/utils2/internal/CommonUtility;->getRotationByDM()I

    move-result v0

    if-gez v0, :cond_1

    invoke-direct {p0}, Lio/agora/utils2/internal/CommonUtility;->getRotationByWM()I

    move-result v0

    :cond_1
    iput v0, p0, Lio/agora/utils2/internal/CommonUtility;->lastOrientation:I

    return v0
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method public getNetworkInfo()Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lio/agora/utils2/internal/CommonUtility;->getNetworkInfo(Landroid/content/Context;)Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getNetworkType()I
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    const/4 v0, -0x1

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-static {p0}, Lio/agora/utils2/internal/CommonUtility;->checkAccessNetworkState(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0}, Lio/agora/utils2/internal/Connectivity;->getNetworkType(Landroid/content/Context;)I

    move-result p0

    return p0

    :cond_1
    const-string p0, "CommonUtility"

    const-string v1, "fail to getNetworkType, permission ACCESS_NETWORK_STATE not granted"

    invoke-static {p0, v1}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public getProcessLifecycleOwner()Lio/agora/utils2/internal/ProcessLifecycleOwner;
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    return-object p0
.end method

.method public getRealFilePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const-string p0, ""

    if-eqz p1, :cond_4

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "/assets/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1, p2}, Lio/agora/utils2/internal/CommonUtility;->getAssetsFilePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string v0, "content://"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-static {p1, p2}, Lio/agora/utils2/internal/CommonUtility;->getContentFilePath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_3

    return-object p1

    :cond_3
    return-object p0

    :cond_4
    :goto_1
    const-string p1, "CommonUtility"

    const-string p2, "getRealFilePath failed for init error"

    invoke-static {p1, p2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public getVpnIfconfigs()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/NetworkInterface;

    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "tun"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "ppp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "ipsec"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "tap"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    return-object p0

    :goto_2
    const-string v1, "CommonUtility"

    const-string v2, "Fail to get network interfaces array list. "

    invoke-static {v1, v2, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0
.end method

.method public notifyAddressBound(Ljava/lang/String;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;

    invoke-interface {v1, p1}, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;->onAddressBound(Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onAudioRoutingPhoneChanged(ZII)V
    .locals 3

    iget-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisposed:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "CommonUtility"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onAudioRoutingPhoneChanged() enableAudio:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", event:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", arg: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1, p1, p2, p3}, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;->onAudioRoutingPhoneChanged(ZII)V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mListener:Lio/agora/utils2/internal/CommonUtility$Listener;

    if-eqz p0, :cond_2

    invoke-interface {p0, p1, p2, p3}, Lio/agora/utils2/internal/CommonUtility$Listener;->onAudioRoutingPhoneChanged(ZII)V

    :cond_2
    :goto_1
    return-void

    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public onForegroundChanged(Z)V
    .locals 2

    iget-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mListener:Lio/agora/utils2/internal/CommonUtility$Listener;

    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Lio/agora/utils2/internal/CommonUtility$Listener;->onForegroundChanged(Z)V

    :cond_1
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;

    invoke-interface {v1, p1}, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;->onForegroundChanged(Z)V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_2
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onNetworkChange()V
    .locals 3

    iget-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisposed:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->shouldGetIp:Z

    const-string v0, "CommonUtility"

    const-string v1, "onNetworkChange()"

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-direct {p0, v0}, Lio/agora/utils2/internal/CommonUtility;->getNetworkInfo(Landroid/content/Context;)Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;

    move-result-object v0

    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2, v0}, Lio/agora/utils2/internal/CommonUtility$SystemEventListener;->onNetworkChange(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_2

    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mListener:Lio/agora/utils2/internal/CommonUtility$Listener;

    if-eqz p0, :cond_2

    invoke-interface {p0, v0}, Lio/agora/utils2/internal/CommonUtility$Listener;->onNetworkChange(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V

    :cond_2
    :goto_1
    return-void

    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onPowerChange(I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onPowerChange() "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CommonUtility"

    invoke-static {v1, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput p1, p0, Lio/agora/utils2/internal/CommonUtility;->mBatteryPercentage:I

    return-void
.end method

.method public registerSystemEventListener(Lio/agora/utils2/internal/CommonUtility$SystemEventListener;)V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setExtraConnectionActionForTesting(Ljava/lang/String;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    iput-object p1, p0, Lio/agora/utils2/internal/CommonUtility;->mExtraConnectivityFilterActionForTesting:Ljava/lang/String;

    return-void
.end method

.method public setListener(Lio/agora/utils2/internal/CommonUtility$Listener;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    iput-object p1, p0, Lio/agora/utils2/internal/CommonUtility;->mListener:Lio/agora/utils2/internal/CommonUtility$Listener;

    return-void
.end method

.method public setupGravityMonitor()I
    .locals 5
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const-string v0, "CommonUtility"

    iget-object v1, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    const/4 v2, -0x1

    if-nez v1, :cond_0

    return v2

    :cond_0
    :try_start_0
    iget-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationListener:Landroid/view/OrientationEventListener;

    if-nez v3, :cond_1

    new-instance v3, Lio/agora/utils2/internal/CommonUtility$7;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v1, v4}, Lio/agora/utils2/internal/CommonUtility$7;-><init>(Lio/agora/utils2/internal/CommonUtility;Landroid/content/Context;I)V

    iput-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationListener:Landroid/view/OrientationEventListener;

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {p0}, Landroid/view/OrientationEventListener;->enable()V

    const-string p0, "[setupGravityMonitor] done!"

    invoke-static {v0, p0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :goto_1
    const-string v1, "Unable to create OrientationEventListener, "

    invoke-static {v0, v1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    return v2
.end method

.method public startMonitor()V
    .locals 5

    const-string v0, "startMonitor()"

    const-string v1, "CommonUtility"

    invoke-static {v1, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-boolean v0, Lio/agora/utils2/internal/CommonUtility;->ignoreMonitor:Z

    if-eqz v0, :cond_0

    const-string p0, "ignoreMonitor in simulator, just for ut"

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-nez v0, :cond_1

    goto/16 :goto_4

    :cond_1
    :try_start_0
    new-instance v2, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

    iget-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    invoke-direct {v2, p0, v3}, Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;-><init>(Lio/agora/utils2/internal/CommonUtility;Landroid/os/Handler;)V

    iput-object v2, p0, Lio/agora/utils2/internal/CommonUtility;->mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

    const-string v2, "phone"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mPhoneStateListener:Lio/agora/utils2/internal/CommonUtility$AgoraPhoneStateListener;

    const/16 v4, 0x120

    invoke-virtual {v2, v3, v4}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    const-string v3, "Unable to create PhoneStateListener, "

    invoke-static {v1, v3, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    :try_start_1
    new-instance v2, Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;

    invoke-direct {v2, p0}, Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    iput-object v2, p0, Lio/agora/utils2/internal/CommonUtility;->mConnectionBroadcastReceiver:Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2, v3}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    iget-object v2, p0, Lio/agora/utils2/internal/CommonUtility;->mExtraConnectivityFilterActionForTesting:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lio/agora/utils2/internal/CommonUtility;->mConnectionBroadcastReceiver:Lio/agora/utils2/internal/ConnectionChangeBroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    iget-object v4, p0, Lio/agora/utils2/internal/CommonUtility;->mExtraConnectivityFilterActionForTesting:Ljava/lang/String;

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2, v3}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v2

    const-string v3, "Unable to create ConnectionChangeBroadcastReceiver, "

    invoke-static {v1, v3, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    :try_start_2
    new-instance v2, Lio/agora/utils2/internal/PowerChangeReceiver;

    invoke-direct {v2, p0}, Lio/agora/utils2/internal/PowerChangeReceiver;-><init>(Lio/agora/utils2/internal/CommonUtility;)V

    iput-object v2, p0, Lio/agora/utils2/internal/CommonUtility;->mPowerChangeReceiver:Lio/agora/utils2/internal/PowerChangeReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mPowerChangeReceiver:Lio/agora/utils2/internal/PowerChangeReceiver;

    invoke-static {v0, v3, v2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v2

    const-string v3, "Unable to create PowerChangeReceiver, "

    invoke-static {v1, v3, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    :try_start_3
    new-instance v2, Lio/agora/utils2/internal/ProcessLifecycleOwner;

    invoke-static {}, Lio/agora/utils2/internal/CommonUtility;->isAppInForeground()Z

    move-result v3

    invoke-direct {v2, v3, p0}, Lio/agora/utils2/internal/ProcessLifecycleOwner;-><init>(ZLio/agora/utils2/internal/CommonUtility;)V

    iput-object v2, p0, Lio/agora/utils2/internal/CommonUtility;->mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Application;

    iget-object v3, p0, Lio/agora/utils2/internal/CommonUtility;->mProcessLifecycleOwner:Lio/agora/utils2/internal/ProcessLifecycleOwner;

    invoke-virtual {v2, v3}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v2

    const-string v3, "Unable to registerActivityLifecycleCallbacks, "

    invoke-static {v1, v3, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_3
    const/4 v2, 0x1

    :try_start_4
    invoke-direct {p0, v0, v2}, Lio/agora/utils2/internal/CommonUtility;->monitorOrientationChange(Landroid/content/Context;Z)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception p0

    const-string v0, "Unable to monitorOrientationChange, "

    invoke-static {v1, v0, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_4
    return-void
.end method

.method public unregisterSystemEventListener(Lio/agora/utils2/internal/CommonUtility$SystemEventListener;)V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->systemEventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public updateOrientationManual()V
    .locals 3

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->mDisposed:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/utils2/internal/CommonUtility;->mUpdateRotationTrigger:Z

    iget-object v0, p0, Lio/agora/utils2/internal/CommonUtility;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility;->rotationRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    :goto_0
    return-void
.end method
