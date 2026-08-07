.class public Lcom/cmic/sso/sdk/e/r;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cmic/sso/sdk/e/r$a;
    }
.end annotation


# static fields
.field private static a:Lcom/cmic/sso/sdk/e/r;


# instance fields
.field private b:Landroid/net/ConnectivityManager;

.field private c:Landroid/net/Network;

.field private d:Landroid/net/ConnectivityManager$NetworkCallback;

.field private e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    const-string v0, "connectivity"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/net/ConnectivityManager;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/cmic/sso/sdk/e/r;->b:Landroid/net/ConnectivityManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/e/r;)Landroid/net/ConnectivityManager;
    .locals 0

    .line 131
    iget-object p0, p0, Lcom/cmic/sso/sdk/e/r;->b:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/e/r;Landroid/net/Network;)Landroid/net/Network;
    .locals 0

    .line 122
    iput-object p1, p0, Lcom/cmic/sso/sdk/e/r;->c:Landroid/net/Network;

    return-object p1
.end method

.method public static a(Landroid/content/Context;)Lcom/cmic/sso/sdk/e/r;
    .locals 2

    .line 125
    sget-object v0, Lcom/cmic/sso/sdk/e/r;->a:Lcom/cmic/sso/sdk/e/r;

    if-nez v0, :cond_1

    .line 126
    const-class v0, Lcom/cmic/sso/sdk/e/r;

    monitor-enter v0

    .line 127
    :try_start_0
    sget-object v1, Lcom/cmic/sso/sdk/e/r;->a:Lcom/cmic/sso/sdk/e/r;

    if-nez v1, :cond_0

    .line 128
    new-instance v1, Lcom/cmic/sso/sdk/e/r;

    invoke-direct {v1, p0}, Lcom/cmic/sso/sdk/e/r;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/cmic/sso/sdk/e/r;->a:Lcom/cmic/sso/sdk/e/r;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 129
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 130
    :cond_1
    :goto_2
    sget-object p0, Lcom/cmic/sso/sdk/e/r;->a:Lcom/cmic/sso/sdk/e/r;

    return-object p0
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/e/r;Z)Z
    .locals 0

    .line 123
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/e/r;->e:Z

    return p1
.end method

.method public static synthetic b(Lcom/cmic/sso/sdk/e/r;)Landroid/net/ConnectivityManager$NetworkCallback;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/cmic/sso/sdk/e/r;->d:Landroid/net/ConnectivityManager$NetworkCallback;

    return-object p0
.end method


# virtual methods
.method public declared-synchronized a(Lcom/cmic/sso/sdk/e/r$a;)V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/cmic/sso/sdk/e/r;->b:Landroid/net/ConnectivityManager;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "WifiNetworkUtils"

    .line 8
    .line 9
    const-string v2, "mConnectivityManager \u4e3a\u7a7a"

    .line 10
    .line 11
    invoke-static {v0, v2}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, v1}, Lcom/cmic/sso/sdk/e/r$a;->a(Landroid/net/Network;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_2

    .line 21
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/cmic/sso/sdk/e/r;->c:Landroid/net/Network;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    iget-boolean v3, p0, Lcom/cmic/sso/sdk/e/r;->e:Z

    .line 26
    .line 27
    if-nez v3, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    const-string v0, "HttpUtils"

    .line 42
    .line 43
    const-string v1, "reuse network: "

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/cmic/sso/sdk/e/r;->c:Landroid/net/Network;

    .line 49
    .line 50
    invoke-interface {p1, v0}, Lcom/cmic/sso/sdk/e/r$a;->a(Landroid/net/Network;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    .line 53
    monitor-exit p0

    .line 54
    return-void

    .line 55
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/cmic/sso/sdk/e/r;->d:Landroid/net/ConnectivityManager$NetworkCallback;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    :try_start_3
    iget-object v2, p0, Lcom/cmic/sso/sdk/e/r;->b:Landroid/net/ConnectivityManager;

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catch_0
    move-exception v0

    .line 66
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lcom/cmic/sso/sdk/e/r;->d:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 70
    .line 71
    :goto_0
    const-string v0, "HttpUtils"

    .line 72
    .line 73
    const-string v2, "clear: "

    .line 74
    .line 75
    invoke-static {v0, v2}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    new-instance v0, Landroid/net/NetworkRequest$Builder;

    .line 79
    .line 80
    invoke-direct {v0}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 81
    .line 82
    .line 83
    const/16 v2, 0xc

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-virtual {v0, v2}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v2, Lcom/cmic/sso/sdk/e/r$1;

    .line 99
    .line 100
    invoke-direct {v2, p0, p1}, Lcom/cmic/sso/sdk/e/r$1;-><init>(Lcom/cmic/sso/sdk/e/r;Lcom/cmic/sso/sdk/e/r$a;)V

    .line 101
    .line 102
    .line 103
    iput-object v2, p0, Lcom/cmic/sso/sdk/e/r;->d:Landroid/net/ConnectivityManager$NetworkCallback;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 104
    .line 105
    :try_start_5
    iget-object v3, p0, Lcom/cmic/sso/sdk/e/r;->b:Landroid/net/ConnectivityManager;

    .line 106
    .line 107
    invoke-virtual {v3, v0, v2}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :catch_1
    move-exception v0

    .line 112
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 113
    .line 114
    .line 115
    invoke-interface {p1, v1}, Lcom/cmic/sso/sdk/e/r$a;->a(Landroid/net/Network;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 116
    .line 117
    .line 118
    :goto_1
    monitor-exit p0

    .line 119
    return-void

    .line 120
    :goto_2
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 121
    throw p1
.end method

.method public a()Z
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/cmic/sso/sdk/e/r;->c:Landroid/net/Network;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public declared-synchronized b()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/cmic/sso/sdk/e/r;->b:Landroid/net/ConnectivityManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/cmic/sso/sdk/e/r;->d:Landroid/net/ConnectivityManager$NetworkCallback;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :cond_1
    :try_start_2
    const-string v0, "WifiNetworkUtils"

    .line 15
    .line 16
    const-string v1, "unregisterNetwork"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/cmic/sso/sdk/e/r;->b:Landroid/net/ConnectivityManager;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/cmic/sso/sdk/e/r;->d:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/cmic/sso/sdk/e/r;->d:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/cmic/sso/sdk/e/r;->c:Landroid/net/Network;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :catch_0
    move-exception v0

    .line 37
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 38
    .line 39
    .line 40
    :goto_0
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :goto_1
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 43
    throw v0
.end method
