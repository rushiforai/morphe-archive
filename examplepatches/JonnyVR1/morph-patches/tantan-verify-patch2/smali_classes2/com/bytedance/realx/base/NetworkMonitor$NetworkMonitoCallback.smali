.class Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/base/NetworkMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NetworkMonitoCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bytedance/realx/base/NetworkMonitor;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/base/NetworkMonitor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 4

    .line 1
    const-string v0, "on available, network: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "NetworkMonitor"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/net/Network;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/bytedance/realx/base/NetworkMonitor;->access$000(Lcom/bytedance/realx/base/NetworkMonitor;)Landroid/net/Network;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 36
    .line 37
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$002(Lcom/bytedance/realx/base/NetworkMonitor;Landroid/net/Network;)Landroid/net/Network;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 41
    .line 42
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$102(Lcom/bytedance/realx/base/NetworkMonitor;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    monitor-exit v1

    .line 51
    return-void

    .line 52
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0
.end method

.method public onBlockedStatusChanged(Landroid/net/Network;Z)V
    .locals 6

    .line 1
    const-string v0, "on network block status changed, network: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "NetworkMonitor"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/net/Network;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ", blocked: "

    .line 21
    .line 22
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/bytedance/realx/base/NetworkMonitor;->access$000(Lcom/bytedance/realx/base/NetworkMonitor;)Landroid/net/Network;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Landroid/net/Network;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 48
    .line 49
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    const-wide/16 v4, 0x0

    .line 54
    .line 55
    cmp-long p1, v2, v4

    .line 56
    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$300(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$300(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 74
    .line 75
    invoke-static {p0}, Lcom/bytedance/realx/base/NetworkMonitor;->access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J

    .line 76
    .line 77
    .line 78
    move-result-wide v2

    .line 79
    invoke-static {p1, p2, v2, v3}, Lcom/bytedance/realx/base/NativeNetworkFunctions;->nativeOnBlockedStatusChanged(Ljava/lang/String;ZJ)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception p0

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    :goto_0
    monitor-exit v1

    .line 86
    return-void

    .line 87
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    throw p0
.end method

.method public onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V
    .locals 3

    .line 1
    const-string v0, "on capabilities changed, network: "

    .line 2
    .line 3
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    const-string v1, "NetworkMonitor"

    .line 7
    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/net/Network;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, ", capabilities: "

    .line 21
    .line 22
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/net/NetworkCapabilities;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v1, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception p1

    .line 42
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p1
.end method

.method public onLinkPropertiesChanged(Landroid/net/Network;Landroid/net/LinkProperties;)V
    .locals 4

    .line 1
    const-string v0, "on link properties changed, network: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "NetworkMonitor"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/net/Network;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ", capabilities: "

    .line 21
    .line 22
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/net/LinkProperties;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/bytedance/realx/base/NetworkMonitor;->access$000(Lcom/bytedance/realx/base/NetworkMonitor;)Landroid/net/Network;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1, v0}, Landroid/net/Network;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 52
    .line 53
    invoke-virtual {p2}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/NetworkMonitor;->access$302(Lcom/bytedance/realx/base/NetworkMonitor;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J

    .line 63
    .line 64
    .line 65
    move-result-wide p1

    .line 66
    const-wide/16 v2, 0x0

    .line 67
    .line 68
    cmp-long p1, p1, v2

    .line 69
    .line 70
    if-eqz p1, :cond_0

    .line 71
    .line 72
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$100(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/Boolean;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_0

    .line 83
    .line 84
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$300(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-eqz p1, :cond_0

    .line 91
    .line 92
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 93
    .line 94
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$300(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object p2, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 99
    .line 100
    invoke-static {p2}, Lcom/bytedance/realx/base/NetworkMonitor;->access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J

    .line 101
    .line 102
    .line 103
    move-result-wide v2

    .line 104
    invoke-static {p1, v2, v3}, Lcom/bytedance/realx/base/NativeNetworkFunctions;->nativeOnNetworkAvailable(Ljava/lang/String;J)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 108
    .line 109
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 110
    .line 111
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$102(Lcom/bytedance/realx/base/NetworkMonitor;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :catchall_0
    move-exception p0

    .line 116
    goto :goto_1

    .line 117
    :cond_0
    :goto_0
    monitor-exit v1

    .line 118
    return-void

    .line 119
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    throw p0
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 6

    .line 1
    const-string v0, "on lost, network: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "NetworkMonitor"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/net/Network;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/bytedance/realx/base/NetworkMonitor;->access$000(Lcom/bytedance/realx/base/NetworkMonitor;)Landroid/net/Network;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Landroid/net/Network;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/NetworkMonitor;->access$002(Lcom/bytedance/realx/base/NetworkMonitor;Landroid/net/Network;)Landroid/net/Network;

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J

    .line 48
    .line 49
    .line 50
    move-result-wide v2

    .line 51
    const-wide/16 v4, 0x0

    .line 52
    .line 53
    cmp-long p1, v2, v4

    .line 54
    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$300(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    iget-object p1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$300(Lcom/bytedance/realx/base/NetworkMonitor;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/bytedance/realx/base/NetworkMonitor;->access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    invoke-static {p1, v2, v3}, Lcom/bytedance/realx/base/NativeNetworkFunctions;->nativeOnNetworkLost(Ljava/lang/String;J)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto :goto_1

    .line 83
    :cond_0
    :goto_0
    monitor-exit v1

    .line 84
    return-void

    .line 85
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    throw p0
.end method

.method public onUnavailable()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    const-string v1, "NetworkMonitor"

    .line 5
    .line 6
    const-string v2, "on unavailable"

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/bytedance/realx/base/NetworkMonitor;->access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/bytedance/realx/base/NetworkMonitor$NetworkMonitoCallback;->this$0:Lcom/bytedance/realx/base/NetworkMonitor;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/bytedance/realx/base/NetworkMonitor;->access$200(Lcom/bytedance/realx/base/NetworkMonitor;)J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/NativeNetworkFunctions;->nativeOnNetworkUnavailable(J)V

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
