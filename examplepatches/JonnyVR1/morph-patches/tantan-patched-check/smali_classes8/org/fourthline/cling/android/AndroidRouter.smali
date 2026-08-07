.class public Lorg/fourthline/cling/android/AndroidRouter;
.super Lorg/fourthline/cling/transport/RouterImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/android/AndroidRouter$ConnectivityBroadcastReceiver;
    }
.end annotation


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field protected broadcastReceiver:Landroid/content/BroadcastReceiver;

.field private final context:Landroid/content/Context;

.field protected multicastLock:Landroid/net/wifi/WifiManager$MulticastLock;

.field protected networkInfo:Landroid/net/NetworkInfo;

.field protected wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

.field private final wifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/transport/Router;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/transport/spi/InitializationException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/fourthline/cling/transport/RouterImpl;-><init>(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/fourthline/cling/android/AndroidRouter;->context:Landroid/content/Context;

    .line 5
    .line 6
    const-string p1, "wifi"

    .line 7
    .line 8
    invoke-virtual {p3, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/net/wifi/WifiManager;

    .line 13
    .line 14
    iput-object p1, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiManager:Landroid/net/wifi/WifiManager;

    .line 15
    .line 16
    invoke-static {p3}, Lorg/fourthline/cling/android/NetworkUtils;->getConnectedNetworkInfo(Landroid/content/Context;)Landroid/net/NetworkInfo;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lorg/fourthline/cling/android/AndroidRouter;->networkInfo:Landroid/net/NetworkInfo;

    .line 21
    .line 22
    sget-boolean p1, Lorg/fourthline/cling/model/ModelUtil;->ANDROID_EMULATOR:Z

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/fourthline/cling/android/AndroidRouter;->createConnectivityBroadcastReceiver()Landroid/content/BroadcastReceiver;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lorg/fourthline/cling/android/AndroidRouter;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 31
    .line 32
    new-instance p0, Landroid/content/IntentFilter;

    .line 33
    .line 34
    const-string p2, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 35
    .line 36
    invoke-direct {p0, p2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p3, p1, p0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public createConnectivityBroadcastReceiver()Landroid/content/BroadcastReceiver;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/android/AndroidRouter$ConnectivityBroadcastReceiver;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/fourthline/cling/android/AndroidRouter$ConnectivityBroadcastReceiver;-><init>(Lorg/fourthline/cling/android/AndroidRouter;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public disable()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/transport/RouterException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/transport/RouterImpl;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/transport/RouterImpl;->lock(Ljava/util/concurrent/locks/Lock;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lorg/fourthline/cling/android/AndroidRouter;->isWifi()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/android/AndroidRouter;->setWiFiMulticastLock(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/android/AndroidRouter;->setWifiLock(Z)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    invoke-super {p0}, Lorg/fourthline/cling/transport/RouterImpl;->disable()Z

    .line 23
    .line 24
    .line 25
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    iget-object v1, p0, Lorg/fourthline/cling/transport/RouterImpl;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/transport/RouterImpl;->unlock(Ljava/util/concurrent/locks/Lock;)V

    .line 29
    .line 30
    .line 31
    return v0

    .line 32
    :goto_1
    iget-object v1, p0, Lorg/fourthline/cling/transport/RouterImpl;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/transport/RouterImpl;->unlock(Ljava/util/concurrent/locks/Lock;)V

    .line 35
    .line 36
    .line 37
    throw v0
.end method

.method public enable()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/transport/RouterException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/transport/RouterImpl;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/transport/RouterImpl;->lock(Ljava/util/concurrent/locks/Lock;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-super {p0}, Lorg/fourthline/cling/transport/RouterImpl;->enable()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/fourthline/cling/android/AndroidRouter;->isWifi()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/android/AndroidRouter;->setWiFiMulticastLock(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/android/AndroidRouter;->setWifiLock(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/fourthline/cling/transport/RouterImpl;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/transport/RouterImpl;->unlock(Ljava/util/concurrent/locks/Lock;)V

    .line 31
    .line 32
    .line 33
    return v0

    .line 34
    :goto_1
    iget-object v1, p0, Lorg/fourthline/cling/transport/RouterImpl;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/transport/RouterImpl;->unlock(Ljava/util/concurrent/locks/Lock;)V

    .line 37
    .line 38
    .line 39
    throw v0
.end method

.method public enableWiFi()Z
    .locals 3

    .line 1
    sget-object v0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    const-string v1, "Enabling WiFi..."

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiManager:Landroid/net/wifi/WifiManager;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, v0}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 12
    .line 13
    .line 14
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    return p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    sget-object v0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 18
    .line 19
    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 20
    .line 21
    const-string v2, "SetWifiEnabled failed"

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public getLockTimeoutMillis()I
    .locals 0

    const/16 p0, 0x3a98

    return p0
.end method

.method public getNetworkInfo()Landroid/net/NetworkInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->networkInfo:Landroid/net/NetworkInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public handleRouterExceptionOnNetworkTypeChange(Lorg/fourthline/cling/transport/RouterException;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lorg/seamless/util/Exceptions;->unwrap(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Ljava/lang/InterruptedException;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 10
    .line 11
    sget-object v1, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "Router was interrupted: "

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v0, v1, p1, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    sget-object p0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 32
    .line 33
    sget-object v0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "Router error on network change: "

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p0, v0, v1, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public isEthernet()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->networkInfo:Landroid/net/NetworkInfo;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/fourthline/cling/android/NetworkUtils;->isEthernet(Landroid/net/NetworkInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isMobile()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->networkInfo:Landroid/net/NetworkInfo;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/fourthline/cling/android/NetworkUtils;->isMobile(Landroid/net/NetworkInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isWifi()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->networkInfo:Landroid/net/NetworkInfo;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/fourthline/cling/android/NetworkUtils;->isWifi(Landroid/net/NetworkInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onNetworkTypeChange(Landroid/net/NetworkInfo;Landroid/net/NetworkInfo;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/transport/RouterException;
        }
    .end annotation

    .line 1
    sget-object v0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :goto_0
    const-string v2, "NONE"

    .line 13
    .line 14
    if-nez p2, :cond_1

    .line 15
    .line 16
    move-object v3, v2

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    :goto_1
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v3, "Network type changed %s => %s"

    .line 27
    .line 28
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lorg/fourthline/cling/android/AndroidRouter;->disable()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    move-object p1, v2

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    :goto_2
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v1, "Disabled router on network type change (old network: %s)"

    .line 54
    .line 55
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    iput-object p2, p0, Lorg/fourthline/cling/android/AndroidRouter;->networkInfo:Landroid/net/NetworkInfo;

    .line 63
    .line 64
    invoke-virtual {p0}, Lorg/fourthline/cling/android/AndroidRouter;->enable()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_5

    .line 69
    .line 70
    if-nez p2, :cond_4

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_4
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    :goto_3
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "Enabled router on network type change (new network: %s)"

    .line 82
    .line 83
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v0, p0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_5
    return-void
.end method

.method public setWiFiMulticastLock(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->multicastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiManager:Landroid/net/wifi/WifiManager;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->createMulticastLock(Ljava/lang/String;)Landroid/net/wifi/WifiManager$MulticastLock;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->multicastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->multicastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$MulticastLock;->isHeld()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    sget-object p0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 32
    .line 33
    const-string p1, "WiFi multicast lock already acquired"

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    sget-object p1, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 40
    .line 41
    const-string v0, "WiFi multicast lock acquired"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->multicastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager$MulticastLock;->acquire()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$MulticastLock;->isHeld()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    sget-object p1, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 59
    .line 60
    const-string v0, "WiFi multicast lock released"

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->multicastLock:Landroid/net/wifi/WifiManager$MulticastLock;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager$MulticastLock;->release()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    sget-object p0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 72
    .line 73
    const-string p1, "WiFi multicast lock already released"

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public setWifiLock(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiManager:Landroid/net/wifi/WifiManager;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x3

    .line 16
    invoke-virtual {v0, v2, v1}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    sget-object p0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 33
    .line 34
    const-string p1, "WiFi lock already acquired"

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget-object p1, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 41
    .line 42
    const-string v0, "WiFi lock acquired"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    sget-object p1, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 60
    .line 61
    const-string v0, "WiFi lock released"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidRouter;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    sget-object p0, Lorg/fourthline/cling/android/AndroidRouter;->log:Ljava/util/logging/Logger;

    .line 73
    .line 74
    const-string p1, "WiFi lock already released"

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public shutdown()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/transport/RouterException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/fourthline/cling/transport/RouterImpl;->shutdown()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lorg/fourthline/cling/android/AndroidRouter;->unregisterBroadcastReceiver()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public unregisterBroadcastReceiver()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lorg/fourthline/cling/android/AndroidRouter;->context:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lorg/fourthline/cling/android/AndroidRouter;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 12
    .line 13
    :cond_0
    return-void
.end method
