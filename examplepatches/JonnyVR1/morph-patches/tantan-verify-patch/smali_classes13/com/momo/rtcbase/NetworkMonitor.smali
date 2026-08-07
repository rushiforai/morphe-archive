.class public Lcom/momo/rtcbase/NetworkMonitor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/NetworkMonitor$InstanceHolder;,
        Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "NetworkMonitor"


# instance fields
.field private autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

.field private final autoDetectLock:Ljava/lang/Object;

.field private volatile currentConnectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field private final nativeNetworkObservers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final networkObservers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;",
            ">;"
        }
    .end annotation
.end field

.field private numObservers:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetectLock:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->nativeNetworkObservers:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->networkObservers:Ljava/util/ArrayList;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->numObservers:I

    .line 27
    .line 28
    sget-object v0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_UNKNOWN:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->currentConnectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 31
    .line 32
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/NetworkMonitor$1;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/momo/rtcbase/NetworkMonitor;-><init>()V

    return-void
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/NetworkMonitor;Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/NetworkMonitor;->updateCurrentConnectionType(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/NetworkMonitor;Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/NetworkMonitor;->notifyObserversOfNetworkConnect(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/momo/rtcbase/NetworkMonitor;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/NetworkMonitor;->notifyObserversOfNetworkDisconnect(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static addNetworkObserver(Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/NetworkMonitor;->getInstance()Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/momo/rtcbase/NetworkMonitor;->addObserver(Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static androidSdkInt()I
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    return v0
.end method

.method private static assertIsTrue(Z)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, "Expected to be true"

    .line 5
    .line 6
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static createAndSetAutoDetectForTest(Landroid/content/Context;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/NetworkMonitor;->getInstance()Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/NetworkMonitor;->createAutoDetect(Landroid/content/Context;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, v0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    .line 10
    .line 11
    return-object p0
.end method

.method private createAutoDetect(Landroid/content/Context;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/rtcbase/NetworkMonitor$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/rtcbase/NetworkMonitor$1;-><init>(Lcom/momo/rtcbase/NetworkMonitor;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1, p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;-><init>(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$Observer;Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private getCurrentConnectionType()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->currentConnectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    return-object p0
.end method

.method private getCurrentDefaultNetId()J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetectLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-wide/16 v1, -0x1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getDefaultNetId()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    :goto_0
    monitor-exit v0

    .line 16
    return-wide v1

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public static getInstance()Lcom/momo/rtcbase/NetworkMonitor;
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lcom/momo/rtcbase/NetworkMonitor$InstanceHolder;->instance:Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    return-object v0
.end method

.method private getNativeNetworkObserversSync()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->nativeNetworkObservers:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->nativeNetworkObservers:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-object v1

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public static isOnline()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/NetworkMonitor;->getInstance()Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {v0}, Lcom/momo/rtcbase/NetworkMonitor;->getCurrentConnectionType()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_NONE:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    return v0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    return v0
.end method

.method private native nativeNotifyConnectionTypeChanged(J)V
.end method

.method private native nativeNotifyOfActiveNetworkList(J[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V
.end method

.method private native nativeNotifyOfNetworkConnect(JLcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V
.end method

.method private native nativeNotifyOfNetworkDisconnect(JJ)V
.end method

.method private networkBindingSupported()Z
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetectLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->supportNetworkCallback()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    monitor-exit v0

    .line 20
    return p0

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method private notifyObserversOfConnectionTypeChange(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/NetworkMonitor;->getNativeNetworkObserversSync()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-direct {p0, v1, v2}, Lcom/momo/rtcbase/NetworkMonitor;->nativeNotifyConnectionTypeChanged(J)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->networkObservers:Ljava/util/ArrayList;

    .line 30
    .line 31
    monitor-enter v0

    .line 32
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->networkObservers:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 37
    .line 38
    .line 39
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;

    .line 55
    .line 56
    invoke-interface {v0, p1}, Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;->onConnectionTypeChanged(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    return-void

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    throw p0
.end method

.method private notifyObserversOfNetworkConnect(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/NetworkMonitor;->getNativeNetworkObserversSync()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-direct {p0, v1, v2, p1}, Lcom/momo/rtcbase/NetworkMonitor;->nativeNotifyOfNetworkConnect(JLcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method private notifyObserversOfNetworkDisconnect(J)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/NetworkMonitor;->getNativeNetworkObserversSync()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/momo/rtcbase/NetworkMonitor;->nativeNotifyOfNetworkDisconnect(JJ)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public static removeNetworkObserver(Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/NetworkMonitor;->getInstance()Lcom/momo/rtcbase/NetworkMonitor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/momo/rtcbase/NetworkMonitor;->removeObserver(Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private startMonitoring(Landroid/content/Context;J)V
    .locals 3
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "NetworkMonitor"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Start monitoring with native observer "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-virtual {p0, p1}, Lcom/momo/rtcbase/NetworkMonitor;->startMonitoring(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/rtcbase/NetworkMonitor;->nativeNetworkObservers:Ljava/util/ArrayList;

    .line 31
    .line 32
    monitor-enter p1

    .line 33
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->nativeNetworkObservers:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    invoke-direct {p0, p2, p3}, Lcom/momo/rtcbase/NetworkMonitor;->updateObserverActiveNetworkList(J)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/momo/rtcbase/NetworkMonitor;->currentConnectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 47
    .line 48
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/NetworkMonitor;->notifyObserversOfConnectionTypeChange(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p0
.end method

.method private stopMonitoring(J)V
    .locals 3
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "NetworkMonitor"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Stop monitoring with native observer "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/momo/rtcbase/NetworkMonitor;->stopMonitoring()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->nativeNetworkObservers:Ljava/util/ArrayList;

    .line 24
    .line 25
    monitor-enter v0

    .line 26
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->nativeNetworkObservers:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method

.method private updateCurrentConnectionType(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitor;->currentConnectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/NetworkMonitor;->notifyObserversOfConnectionTypeChange(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private updateObserverActiveNetworkList(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetectLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getActiveNetworkList()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    new-array v0, v0, [Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;

    .line 29
    .line 30
    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, [Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;

    .line 35
    .line 36
    invoke-direct {p0, p1, p2, v0}, Lcom/momo/rtcbase/NetworkMonitor;->nativeNotifyOfActiveNetworkList(J[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_1
    return-void

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw p0
.end method


# virtual methods
.method public addObserver(Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->networkObservers:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->networkObservers:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public getNetworkMonitorAutoDetect()Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetectLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public getNumObservers()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetectLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->numObservers:I

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public removeObserver(Lcom/momo/rtcbase/NetworkMonitor$NetworkObserver;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->networkObservers:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitor;->networkObservers:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public startMonitoring()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 55
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/momo/rtcbase/NetworkMonitor;->startMonitoring(Landroid/content/Context;)V

    return-void
.end method

.method public startMonitoring(Landroid/content/Context;)V
    .locals 2

    .line 56
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 57
    :try_start_0
    iget v1, p0, Lcom/momo/rtcbase/NetworkMonitor;->numObservers:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/momo/rtcbase/NetworkMonitor;->numObservers:I

    .line 58
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    if-nez v1, :cond_0

    .line 59
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/NetworkMonitor;->createAutoDetect(Landroid/content/Context;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    move-result-object p1

    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 60
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    .line 61
    invoke-virtual {p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getCurrentNetworkState()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;

    move-result-object p1

    invoke-static {p1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->getConnectionType(Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    move-result-object p1

    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitor;->currentConnectionType:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 62
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public stopMonitoring()V
    .locals 2

    .line 40
    iget-object v0, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 41
    :try_start_0
    iget v1, p0, Lcom/momo/rtcbase/NetworkMonitor;->numObservers:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/momo/rtcbase/NetworkMonitor;->numObservers:I

    if-nez v1, :cond_0

    .line 42
    iget-object v1, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    invoke-virtual {v1}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect;->destroy()V

    const/4 v1, 0x0

    .line 43
    iput-object v1, p0, Lcom/momo/rtcbase/NetworkMonitor;->autoDetect:Lcom/momo/rtcbase/NetworkMonitorAutoDetect;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
