.class public Lcom/bytedance/realx/base/NetworkMonitor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0x1a
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "NetworkMonitor"


# instance fields
.field private cellularIfName:Ljava/lang/String;

.field private cellularNetwork:Landroid/net/Network;

.field private cellularNetworkRequested:Ljava/lang/Boolean;

.field private cellularRequestCallback:J

.field private connectivityManager:Landroid/net/ConnectivityManager;

.field private networkMonitorCallback:Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;

.field private shouldEmitAvailable:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetwork:Landroid/net/Network;

    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    iput-wide v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularRequestCallback:J

    .line 12
    .line 13
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetworkRequested:Ljava/lang/Boolean;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->shouldEmitAvailable:Ljava/lang/Boolean;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor;->networkMonitorCallback:Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;

    .line 20
    .line 21
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "connectivity"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic access$000(Lcom/bytedance/realx/base/NetworkMonitor;)Landroid/net/Network;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetwork:Landroid/net/Network;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$002(Lcom/bytedance/realx/base/NetworkMonitor;Landroid/net/Network;)Landroid/net/Network;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetwork:Landroid/net/Network;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$100(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor;->shouldEmitAvailable:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/bytedance/realx/base/NetworkMonitor;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->shouldEmitAvailable:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularRequestCallback:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$300(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularIfName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/bytedance/realx/base/NetworkMonitor;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularIfName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static create()Lcom/bytedance/realx/base/NetworkMonitor;
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    return-object v0

    .line 9
    :cond_0
    new-instance v0, Lcom/bytedance/realx/base/NetworkMonitor;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/bytedance/realx/base/NetworkMonitor;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public bindSocketToCellularNetwork(ILjava/lang/String;)I
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "bind socket to network exception: "

    .line 2
    .line 3
    const-string v1, "bind socket to network, fd: "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetwork:Landroid/net/Network;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularIfName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    const-string p2, "NetworkMonitor"

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {p2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    :try_start_1
    invoke-static {p1}, Landroid/os/ParcelFileDescriptor;->fromFd(I)Landroid/os/ParcelFileDescriptor;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p2, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetwork:Landroid/net/Network;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p2, v1}, Landroid/net/Network;->bindSocket(Ljava/io/FileDescriptor;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    move-exception p1

    .line 57
    goto :goto_1

    .line 58
    :catch_0
    move-exception p1

    .line 59
    :try_start_2
    const-string p2, "NetworkMonitor"

    .line 60
    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {p2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 81
    .line 82
    .line 83
    :cond_0
    const/4 p1, -0x1

    .line 84
    :goto_0
    monitor-exit p0

    .line 85
    return p1

    .line 86
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 87
    throw p1
.end method

.method public cancelRequestCellularNetwork()V
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "Cancel request cellular network exception: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetworkRequested:Ljava/lang/Boolean;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    :try_start_1
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/bytedance/realx/base/NetworkMonitor;->networkMonitorCallback:Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetwork:Landroid/net/Network;

    .line 21
    .line 22
    const-wide/16 v1, 0x0

    .line 23
    .line 24
    iput-wide v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularRequestCallback:J

    .line 25
    .line 26
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetworkRequested:Ljava/lang/Boolean;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :catch_0
    move-exception v1

    .line 34
    :try_start_2
    const-string v2, "NetworkMonitor"

    .line 35
    .line 36
    new-instance v3, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    :goto_0
    monitor-exit p0

    .line 56
    return-void

    .line 57
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    throw v0
.end method

.method public requestCellularNetwork(J)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "Request cellular network exception: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetworkRequested:Ljava/lang/Boolean;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    :try_start_1
    iput-wide p1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularRequestCallback:J

    .line 13
    .line 14
    new-instance p1, Landroid/net/NetworkRequest$Builder;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-virtual {p1, p2}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/16 p2, 0xc

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance p2, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;

    .line 35
    .line 36
    invoke-direct {p2, p0}, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;-><init>(Lcom/bytedance/realx/base/NetworkMonitor;)V

    .line 37
    .line 38
    .line 39
    iput-object p2, p0, Lcom/bytedance/realx/base/NetworkMonitor;->networkMonitorCallback:Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 42
    .line 43
    invoke-virtual {v1, p1, p2}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 44
    .line 45
    .line 46
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor;->cellularNetworkRequested:Ljava/lang/Boolean;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p1

    .line 52
    goto :goto_1

    .line 53
    :catch_0
    move-exception p1

    .line 54
    :try_start_2
    const-string p2, "NetworkMonitor"

    .line 55
    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p2, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    :goto_0
    monitor-exit p0

    .line 76
    return-void

    .line 77
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    throw p1
.end method
