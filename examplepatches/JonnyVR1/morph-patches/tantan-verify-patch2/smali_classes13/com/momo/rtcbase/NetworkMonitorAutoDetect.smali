.class public Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;,
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiDirectManagerDelegate;,
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;,
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;,
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$SimpleNetworkCallback;,
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;,
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;,
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;,
        Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    }
.end annotation


# static fields
.field static final INVALID_NET_ID:J = -0x1L

.field private static final TAG:Ljava/lang/String; = "NetworkMonitorAutoDetect"


# instance fields
.field private final allNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

.field private connectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field private connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

.field private final context:Landroid/content/Context;

.field private final intentFilter:Landroid/content/IntentFilter;

.field private isRegistered:Z

.field private final mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

.field private final observer:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;

.field private wifiDirectManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiDirectManagerDelegate;

.field private wifiManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;

.field private wifiSSID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;Landroid/content/Context;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->observer:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->context:Landroid/content/Context;

    .line 7
    .line 8
    new-instance p1, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 9
    .line 10
    invoke-direct {p1, p2}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 14
    .line 15
    new-instance p1, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->wifiManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;

    .line 21
    .line 22
    iget-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->getNetworkState()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getConnectionType(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iput-object p2, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getWifiSSID(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->wifiSSID:Ljava/lang/String;

    .line 39
    .line 40
    new-instance p1, Landroid/content/IntentFilter;

    .line 41
    .line 42
    const-string p2, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->intentFilter:Landroid/content/IntentFilter;

    .line 48
    .line 49
    invoke-direct {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->registerReceiver()V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->supportNetworkCallback()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const/4 p2, 0x0

    .line 59
    if-eqz p1, :cond_0

    .line 60
    .line 61
    new-instance p1, Landroid/net/ConnectivityManager$NetworkCallback;

    .line 62
    .line 63
    invoke-direct {p1}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    .line 64
    .line 65
    .line 66
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->requestMobileNetwork(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catch_0
    const-string p1, "NetworkMonitorAutoDetect"

    .line 73
    .line 74
    const-string v0, "Unable to obtain permission to request a cellular network."

    .line 75
    .line 76
    invoke-static {p1, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    move-object p1, p2

    .line 80
    :goto_0
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 81
    .line 82
    new-instance p1, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$SimpleNetworkCallback;

    .line 83
    .line 84
    invoke-direct {p1, p0, p2}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$SimpleNetworkCallback;-><init>(Lcom/momo/rtcbase/NetworkMonitorAutoDetect;Lcom/momo/rtcbase/NetworkMonitorAutoDetect$1;)V

    .line 85
    .line 86
    .line 87
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->allNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->registerNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    iput-object p2, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 96
    .line 97
    iput-object p2, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->allNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 98
    .line 99
    return-void
.end method

.method public static synthetic access$000(Landroid/net/Network;)J
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->networkToNetId(Landroid/net/Network;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/NetworkMonitorAutoDetect;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->observer:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/NetworkMonitorAutoDetect;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getUnderlyingConnectionTypeForVpn(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private connectionTypeChanged(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getConnectionType(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getWifiSSID(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->wifiSSID:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iput-object v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->wifiSSID:Ljava/lang/String;

    .line 25
    .line 26
    new-instance p1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v1, "Network connectivity changed, type is: "

    .line 29
    .line 30
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v1, "NetworkMonitorAutoDetect"

    .line 43
    .line 44
    invoke-static {v1, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->observer:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;

    .line 48
    .line 49
    invoke-interface {p0, v0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;->onConnectionTypeChanged(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static getConnectionType(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 2

    .line 59
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->isConnected()Z

    move-result v0

    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->getNetworkType()I

    move-result v1

    .line 60
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->getNetworkSubType()I

    move-result p0

    .line 61
    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getConnectionType(ZII)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    move-result-object p0

    return-object p0
.end method

.method private static getConnectionType(ZII)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_NONE:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    if-eqz p1, :cond_6

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    if-eq p1, p0, :cond_5

    .line 10
    .line 11
    const/4 p0, 0x6

    .line 12
    if-eq p1, p0, :cond_4

    .line 13
    .line 14
    const/4 p0, 0x7

    .line 15
    if-eq p1, p0, :cond_3

    .line 16
    .line 17
    const/16 p0, 0x9

    .line 18
    .line 19
    if-eq p1, p0, :cond_2

    .line 20
    .line 21
    const/16 p0, 0x11

    .line 22
    .line 23
    if-eq p1, p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_UNKNOWN:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_VPN:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_ETHERNET:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_BLUETOOTH:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_4
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_4G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_5
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_WIFI:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_6
    packed-switch p2, :pswitch_data_0

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_UNKNOWN_CELLULAR:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_0
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_4G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_1
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_3G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 53
    .line 54
    return-object p0

    .line 55
    :pswitch_2
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_2G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 56
    .line 57
    return-object p0

    .line 58
    nop

    .line 59
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private static getUnderlyingConnectionTypeForVpn(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->getNetworkType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x11

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_NONE:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->isConnected()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->getUnderlyingNetworkTypeForVpn()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->getUnderlyingNetworkSubtypeForVpn()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getConnectionType(ZII)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method private getWifiSSID(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getConnectionType(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_WIFI:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->wifiManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;->getWifiSSID()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method private static networkToNetId(Landroid/net/Network;)J
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/net/Network;->getNetworkHandle()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method private registerReceiver()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->isRegistered:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->isRegistered:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->context:Landroid/content/Context;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->intentFilter:Landroid/content/IntentFilter;

    .line 12
    .line 13
    invoke-static {v0, p0, v1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private unregisterReceiver()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->isRegistered:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->isRegistered:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->context:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->allNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->releaseCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->mobileNetworkCallback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->releaseCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->wifiDirectManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiDirectManagerDelegate;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiDirectManagerDelegate;->release()V

    .line 24
    .line 25
    .line 26
    :cond_2
    invoke-direct {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->unregisterReceiver()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public getActiveNetworkList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->getActiveNetworkList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->wifiDirectManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiDirectManagerDelegate;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiDirectManagerDelegate;->getActiveNetworkList()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    return-object v1
.end method

.method public getCurrentNetworkState()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->getNetworkState()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDefaultNetId()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->getDefaultNetId()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public isReceiverRegisteredForTesting()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->isRegistered:Z

    .line 2
    .line 3
    return p0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getCurrentNetworkState()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectionTypeChanged(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setConnectivityManagerDelegateForTests(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 2
    .line 3
    return-void
.end method

.method public setWifiManagerDelegateForTests(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->wifiManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$WifiManagerDelegate;

    .line 2
    .line 3
    return-void
.end method

.method public supportNetworkCallback()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->connectivityManagerDelegate:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectivityManagerDelegate;->supportNetworkCallback()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
