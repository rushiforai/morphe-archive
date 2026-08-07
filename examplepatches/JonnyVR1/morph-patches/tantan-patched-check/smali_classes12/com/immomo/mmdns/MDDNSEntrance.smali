.class public Lcom/immomo/mmdns/MDDNSEntrance;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mmdns/MDDNSEntrance$IPV6Callback;,
        Lcom/immomo/mmdns/MDDNSEntrance$ILogger;,
        Lcom/immomo/mmdns/MDDNSEntrance$ForegroundGetter;,
        Lcom/immomo/mmdns/MDDNSEntrance$LibraryLoader;
    }
.end annotation


# static fields
.field private static final MT_TRACER:Ljava/lang/String; = "mmdns"

.field private static instance:Lcom/immomo/mmdns/MDDNSEntrance; = null

.field public static ipHostMap:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static libraryLoader:Lcom/immomo/mmdns/MDDNSEntrance$LibraryLoader; = null

.field public static sContext:Landroid/content/Context; = null

.field private static setMainServerRequestAllEnable:Z = true

.field private static sslSessionCache:Landroid/net/SSLSessionCache;


# instance fields
.field private appId:Ljava/lang/String;

.field private currentEnv:I

.field private dnsLogger:Lcom/immomo/mmdns/DNSLogger;

.field private foregroundGetter:Lcom/immomo/mmdns/MDDNSEntrance$ForegroundGetter;

.field private inited:Z

.field private ipv6Callback:Lcom/immomo/mmdns/MDDNSEntrance$IPV6Callback;

.field private openAll:Z

.field private openDNS:Z

.field private stackDebug:Z

.field private syncMode:Z

.field private final whiteHostSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    const/16 v1, 0x14

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/immomo/mmdns/MDDNSEntrance;->ipHostMap:Ljava/util/Map;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    sput-object v0, Lcom/immomo/mmdns/MDDNSEntrance;->instance:Lcom/immomo/mmdns/MDDNSEntrance;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->syncMode:Z

    .line 6
    .line 7
    new-instance v1, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->whiteHostSet:Ljava/util/Set;

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 15
    .line 16
    new-instance v0, Lcom/immomo/mmdns/DNSLogger;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/immomo/mmdns/DNSLogger;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->dnsLogger:Lcom/immomo/mmdns/DNSLogger;

    .line 22
    .line 23
    return-void
.end method

.method private checkInited()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->inited:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "please call com.immomo.mmdns.DNSManager.init(android.content.Context, com.immomo.mmdns.IMDDNSConfig) first"

    .line 7
    .line 8
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static getInstance()Lcom/immomo/mmdns/MDDNSEntrance;
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/mmdns/MDDNSEntrance;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/immomo/mmdns/MDDNSEntrance;->instance:Lcom/immomo/mmdns/MDDNSEntrance;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/immomo/mmdns/MDDNSEntrance;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/immomo/mmdns/MDDNSEntrance;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/immomo/mmdns/MDDNSEntrance;->instance:Lcom/immomo/mmdns/MDDNSEntrance;

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
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    sget-object v0, Lcom/immomo/mmdns/MDDNSEntrance;->instance:Lcom/immomo/mmdns/MDDNSEntrance;

    .line 20
    .line 21
    return-object v0

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method public static getSslSessionCache()Landroid/net/SSLSessionCache;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mmdns/MDDNSEntrance;->sslSessionCache:Landroid/net/SSLSessionCache;

    .line 2
    .line 3
    return-object v0
.end method

.method private loadSharedLibs()V
    .locals 4

    .line 1
    sget-object v0, Lcom/immomo/mmdns/MDDNSEntrance;->libraryLoader:Lcom/immomo/mmdns/MDDNSEntrance$LibraryLoader;

    .line 2
    .line 3
    const-string v1, "MMDNS"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const-string v3, "mmdns"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    :try_start_0
    invoke-interface {v0, v3}, Lcom/immomo/mmdns/MDDNSEntrance$LibraryLoader;->loadLibrary(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-boolean v2, p0, Lcom/immomo/mmdns/MDDNSEntrance;->inited:Z
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-void

    .line 16
    :catch_0
    move-exception p0

    .line 17
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    :try_start_1
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iput-boolean v2, p0, Lcom/immomo/mmdns/MDDNSEntrance;->inited:Z
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_1

    .line 25
    .line 26
    return-void

    .line 27
    :catch_1
    move-exception p0

    .line 28
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    return-void
.end method

.method private native nativeDestroy(Ljava/lang/String;)V
.end method

.method private native nativeGetAPList(Ljava/lang/String;IZLjava/lang/String;Z)[Ljava/lang/String;
.end method

.method private native nativeGetImUsableAP(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private native nativeGetImUsableAPV6First(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private native nativeGetUsableHost(Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;
.end method

.method private native nativeGetUsableHostList(Ljava/lang/String;Ljava/lang/String;ZZ)[Ljava/lang/String;
.end method

.method private native nativeGetV6Toggle(Ljava/lang/String;)I
.end method

.method private native nativeImConnectFailed(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method private native nativeImConnectSuccessed(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method private native nativeInitDNSConfig(Lcom/immomo/mmdns/IMDDNSConfig;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeRequestFailedForDomain(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeRequestSucceedForDomain(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeSetEnv(ILjava/lang/String;)V
.end method

.method private native nativeSetMainServerRequestAllEnable(Z)V
.end method

.method private native nativeSwitchClearHttpDNSCache(ZLjava/lang/String;)V
.end method

.method public static setLibraryLoader(Lcom/immomo/mmdns/MDDNSEntrance$LibraryLoader;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/immomo/mmdns/MDDNSEntrance;->libraryLoader:Lcom/immomo/mmdns/MDDNSEntrance$LibraryLoader;

    .line 2
    .line 3
    return-void
.end method

.method public static setMainServerRequestAllEnable(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/mmdns/MDDNSEntrance;->setMainServerRequestAllEnable:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public addWhiteHostList(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->whiteHostSet:Ljava/util/Set;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->whiteHostSet:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->whiteHostSet:Ljava/util/Set;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0

    .line 21
    :cond_0
    return-void
.end method

.method public closeDebug()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->setConsoleLogOpen(Z)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x7

    .line 6
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->setLevel(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeDestroy(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getIMAps(Ljava/lang/String;IZZ)[Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v4, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeGetAPList(Ljava/lang/String;IZLjava/lang/String;Z)[Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public getIMUsableAP()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeGetImUsableAP(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string p0, "ap.immomo.com:443"

    .line 17
    .line 18
    :cond_0
    return-object p0
.end method

.method public getIMV6AP()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeGetImUsableAPV6First(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string p0, "ap.immomo.com:443"

    .line 17
    .line 18
    :cond_0
    return-object p0
.end method

.method public getUsableHost(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 135
    invoke-virtual {p0, p1, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->getUsableHost(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public declared-synchronized getUsableHost(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "mmdns"

    .line 3
    .line 4
    invoke-static {v0}, Lcom/immomo/motracing/GlobalTracer;->b(Ljava/lang/String;)Lcom/immomo/motracing/Tracer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "getUsableHost"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/immomo/motracing/Tracer;->a(Ljava/lang/String;)Ll/quf0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "domain"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, Ll/quf0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/quf0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "findV6"

    .line 21
    .line 22
    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v1, v2}, Ll/quf0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/quf0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/quf0;->b()Lcom/immomo/motracing/Span;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/immomo/motracing/Span;->e()Ll/lbe0;

    .line 35
    .line 36
    .line 37
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    :try_start_1
    iget-boolean v2, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 39
    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    iget-object v4, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 57
    .line 58
    iget-boolean v5, p0, Lcom/immomo/mmdns/MDDNSEntrance;->syncMode:Z

    .line 59
    .line 60
    invoke-direct {p0, p1, v4, p2, v5}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeGetUsableHost(Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    const-string v4, "MMDNS"

    .line 65
    .line 66
    const-string v5, "replace %s \u2014\u2014> %s"

    .line 67
    .line 68
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-static {v4, v5, v6}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    sget-object v4, Lcom/immomo/mmdns/MDDNSEntrance;->ipHostMap:Ljava/util/Map;

    .line 76
    .line 77
    invoke-interface {v4, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    iget-object v4, p0, Lcom/immomo/mmdns/MDDNSEntrance;->dnsLogger:Lcom/immomo/mmdns/DNSLogger;

    .line 81
    .line 82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 83
    .line 84
    .line 85
    move-result-wide v5

    .line 86
    sub-long/2addr v5, v2

    .line 87
    invoke-virtual {v4, v5, v6, p1, p2}, Lcom/immomo/mmdns/DNSLogger;->recordDnsResult(JLjava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const-string v2, "replace %s \u2014\u2014> %s"

    .line 91
    .line 92
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {v0, p1}, Lcom/immomo/motracing/Span;->d(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 101
    .line 102
    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    :try_start_2
    invoke-virtual {v1}, Ll/lbe0;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :catchall_0
    move-exception p1

    .line 110
    goto :goto_4

    .line 111
    :cond_1
    :goto_0
    monitor-exit p0

    .line 112
    return-object p2

    .line 113
    :catchall_1
    move-exception p1

    .line 114
    goto :goto_2

    .line 115
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 116
    .line 117
    :try_start_3
    invoke-virtual {v1}, Ll/lbe0;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 118
    .line 119
    .line 120
    :cond_3
    monitor-exit p0

    .line 121
    return-object p1

    .line 122
    :goto_2
    if-eqz v1, :cond_4

    .line 123
    .line 124
    :try_start_4
    invoke-virtual {v1}, Ll/lbe0;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 125
    .line 126
    .line 127
    goto :goto_3

    .line 128
    :catchall_2
    move-exception p2

    .line 129
    :try_start_5
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    :cond_4
    :goto_3
    throw p1

    .line 133
    :goto_4
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 134
    throw p1
.end method

.method public declared-synchronized getUsableHostFromUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 74
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->getUsableHostFromUrl(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized getUsableHostFromUrl(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    :try_start_1
    new-instance v1, Ljava/net/URL;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    iget-object p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 31
    .line 32
    iget-boolean v3, p0, Lcom/immomo/mmdns/MDDNSEntrance;->syncMode:Z

    .line 33
    .line 34
    invoke-direct {p0, v0, p1, p2, v3}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeGetUsableHost(Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p2, "MMDNS"

    .line 39
    .line 40
    const-string v3, "replace %s \u2014\u2014> %s"

    .line 41
    .line 42
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-static {p2, v3, v4}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    sget-object p2, Lcom/immomo/mmdns/MDDNSEntrance;->ipHostMap:Ljava/util/Map;

    .line 50
    .line 51
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Lcom/immomo/mmdns/MDDNSEntrance;->dnsLogger:Lcom/immomo/mmdns/DNSLogger;

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    sub-long/2addr v3, v1

    .line 61
    invoke-virtual {p2, v3, v4, v0, p1}, Lcom/immomo/mmdns/DNSLogger;->recordDnsResult(JLjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    .line 63
    .line 64
    monitor-exit p0

    .line 65
    return-object p1

    .line 66
    :catchall_0
    move-exception p1

    .line 67
    goto :goto_1

    .line 68
    :catch_0
    monitor-exit p0

    .line 69
    return-object v0

    .line 70
    :cond_1
    :goto_0
    monitor-exit p0

    .line 71
    return-object p1

    .line 72
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 73
    throw p1
.end method

.method public declared-synchronized getUsableHostList(Ljava/lang/String;Z)[Ljava/lang/String;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "mmdns"

    .line 3
    .line 4
    invoke-static {v0}, Lcom/immomo/motracing/GlobalTracer;->b(Ljava/lang/String;)Lcom/immomo/motracing/Tracer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "getUsableHostList"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/immomo/motracing/Tracer;->a(Ljava/lang/String;)Ll/quf0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "domain"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, Ll/quf0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/quf0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "findV6"

    .line 21
    .line 22
    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v1, v2}, Ll/quf0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/quf0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/quf0;->b()Lcom/immomo/motracing/Span;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/immomo/motracing/Span;->e()Ll/lbe0;

    .line 35
    .line 36
    .line 37
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 38
    :try_start_1
    iget-boolean v1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 39
    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 53
    .line 54
    iget-boolean v2, p0, Lcom/immomo/mmdns/MDDNSEntrance;->syncMode:Z

    .line 55
    .line 56
    invoke-direct {p0, p1, v1, p2, v2}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeGetUsableHostList(Ljava/lang/String;Ljava/lang/String;ZZ)[Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    new-array p1, p1, [Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception p1

    .line 67
    goto :goto_3

    .line 68
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 69
    .line 70
    :try_start_2
    invoke-virtual {v0}, Ll/lbe0;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :catchall_1
    move-exception p1

    .line 75
    goto :goto_5

    .line 76
    :cond_2
    :goto_1
    monitor-exit p0

    .line 77
    return-object p1

    .line 78
    :cond_3
    :goto_2
    :try_start_3
    filled-new-array {p1}, [Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    :try_start_4
    invoke-virtual {v0}, Ll/lbe0;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 85
    .line 86
    .line 87
    :cond_4
    monitor-exit p0

    .line 88
    return-object p1

    .line 89
    :goto_3
    if-eqz v0, :cond_5

    .line 90
    .line 91
    :try_start_5
    invoke-virtual {v0}, Ll/lbe0;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 92
    .line 93
    .line 94
    goto :goto_4

    .line 95
    :catchall_2
    move-exception p2

    .line 96
    :try_start_6
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    :cond_5
    :goto_4
    throw p1

    .line 100
    :goto_5
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 101
    throw p1
.end method

.method public declared-synchronized getUseableURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 83
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->getUseableURL(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized getUseableURL(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 3
    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    :try_start_1
    new-instance v0, Ljava/net/URL;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iget-object v3, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 30
    .line 31
    iget-boolean v4, p0, Lcom/immomo/mmdns/MDDNSEntrance;->syncMode:Z

    .line 32
    .line 33
    invoke-direct {p0, v0, v3, p2, v4}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeGetUsableHost(Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const-string v4, "MMDNS"

    .line 48
    .line 49
    const-string v5, "replace %s \u2014\u2014> %s"

    .line 50
    .line 51
    filled-new-array {p1, v3}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {v4, v5, v6}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    sget-object v4, Lcom/immomo/mmdns/MDDNSEntrance;->ipHostMap:Ljava/util/Map;

    .line 59
    .line 60
    invoke-interface {v4, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    iget-object v4, p0, Lcom/immomo/mmdns/MDDNSEntrance;->dnsLogger:Lcom/immomo/mmdns/DNSLogger;

    .line 64
    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide v5

    .line 69
    sub-long/2addr v5, v1

    .line 70
    invoke-virtual {v4, v5, v6, v0, p2}, Lcom/immomo/mmdns/DNSLogger;->recordDnsResult(JLjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    .line 72
    .line 73
    monitor-exit p0

    .line 74
    return-object v3

    .line 75
    :catchall_0
    move-exception p1

    .line 76
    goto :goto_1

    .line 77
    :catch_0
    :cond_1
    monitor-exit p0

    .line 78
    return-object p1

    .line 79
    :cond_2
    :goto_0
    monitor-exit p0

    .line 80
    return-object p1

    .line 81
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    throw p1
.end method

.method public getV6Toggle()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeGetV6Toggle(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v0, 0x1

    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public initDNSConfig(Landroid/content/Context;Lcom/immomo/mmdns/IMDDNSConfig;)V
    .locals 1

    .line 44
    invoke-static {p1}, Lcom/immomo/mmdns/DNSUtils;->getCurrentProcessName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->initDNSConfig(Landroid/content/Context;Lcom/immomo/mmdns/IMDDNSConfig;Ljava/lang/String;)V

    return-void
.end method

.method public initDNSConfig(Landroid/content/Context;Lcom/immomo/mmdns/IMDDNSConfig;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->dnsLogger:Lcom/immomo/mmdns/DNSLogger;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lcom/immomo/mmdns/IMDDNSConfig;->setDnsLogger(Lcom/immomo/mmdns/DNSLogger;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/immomo/mmdns/IMDDNSConfig;->getAppId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->loadSharedLibs()V

    .line 13
    .line 14
    .line 15
    sput-object p1, Lcom/immomo/mmdns/MDDNSEntrance;->sContext:Landroid/content/Context;

    .line 16
    .line 17
    new-instance v0, Landroid/net/SSLSessionCache;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Landroid/net/SSLSessionCache;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/immomo/mmdns/MDDNSEntrance;->sslSessionCache:Landroid/net/SSLSessionCache;

    .line 23
    .line 24
    sget-boolean v0, Lcom/immomo/mmdns/MDDNSEntrance;->setMainServerRequestAllEnable:Z

    .line 25
    .line 26
    invoke-direct {p0, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeSetMainServerRequestAllEnable(Z)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Lcom/immomo/mmdns/NetUtil;->init(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p2, p0}, Lcom/immomo/mmdns/DNSManager;->init(Lcom/immomo/mmdns/IMDDNSConfig;Lcom/immomo/mmdns/MDDNSEntrance;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-direct {p0, p2, p3, p1}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeInitDNSConfig(Lcom/immomo/mmdns/IMDDNSConfig;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x1

    .line 41
    iput-boolean p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 42
    .line 43
    return-void
.end method

.method public isForeGround()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->foregroundGetter:Lcom/immomo/mmdns/MDDNSEntrance$ForegroundGetter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/immomo/mmdns/MDDNSEntrance$ForegroundGetter;->isForeGround()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public onIMConnectSuccess(Ljava/lang/String;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeImConnectSuccessed(Ljava/lang/String;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onImConnectFailed(Ljava/lang/String;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeImConnectFailed(Ljava/lang/String;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onToggleChanged(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->ipv6Callback:Lcom/immomo/mmdns/MDDNSEntrance$IPV6Callback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/immomo/mmdns/MDDNSEntrance$IPV6Callback;->onToggleChanged(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public openAll(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openAll:Z

    .line 2
    .line 3
    return-void
.end method

.method public openDNS(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 2
    .line 3
    return-void
.end method

.method public openDebug(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p0, "mdlog_"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {v0, v1, p1, p1, p0}, Lcom/cosmos/mdlog/XLogImpl;->open(ZILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Lcom/cosmos/mdlog/XLogImpl;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/cosmos/mdlog/XLogImpl;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->setLogImp(Lcom/cosmos/mdlog/MDLog$LogImp;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Lcom/cosmos/mdlog/MDLog;->setConsoleLogOpen(Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Lcom/cosmos/mdlog/MDLog;->setLevel(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public openStackDebug(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->stackDebug:Z

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->setOpenStackInfo(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public requestFailedForDomain(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->stackDebug:Z

    .line 19
    .line 20
    const-string v1, "MMDNS"

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    new-instance v0, Ljava/lang/Exception;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->currentEnv:I

    .line 33
    .line 34
    const/16 v2, 0xb

    .line 35
    .line 36
    if-ne v0, v2, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 40
    .line 41
    .line 42
    const-string v0, "Failed For Domain %s \u2014\u2014> %s"

    .line 43
    .line 44
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-static {v1, v0, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 52
    .line 53
    invoke-direct {p0, p1, p2, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeRequestFailedForDomain(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_0
    return-void
.end method

.method public requestFailedForOriURL(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->stackDebug:Z

    .line 19
    .line 20
    const-string v1, "MMDNS"

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    new-instance v0, Ljava/lang/Exception;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 33
    .line 34
    .line 35
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v0, "Failed For Domain %s \u2014\u2014> %s"

    .line 45
    .line 46
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v1, v0, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mmdns/MDDNSEntrance;->requestFailedForDomain(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    :catch_0
    :cond_2
    :goto_0
    return-void
.end method

.method public requestSucceedForDomain(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 19
    .line 20
    .line 21
    const-string v0, "Success For Domain %s \u2014\u2014> %s"

    .line 22
    .line 23
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "MMDNS"

    .line 28
    .line 29
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->currentEnv:I

    .line 33
    .line 34
    const/16 v1, 0xb

    .line 35
    .line 36
    if-ne v0, v1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {p0, p1, p2, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeRequestSucceedForDomain(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method

.method public requestSucceedForOriURL(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 19
    .line 20
    .line 21
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mmdns/MDDNSEntrance;->requestSucceedForDomain(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method public setClearHttpDNSCacheSwitch(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0, p1, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeSwitchClearHttpDNSCache(ZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setForegroundGetter(Lcom/immomo/mmdns/MDDNSEntrance$ForegroundGetter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->foregroundGetter:Lcom/immomo/mmdns/MDDNSEntrance$ForegroundGetter;

    .line 2
    .line 3
    return-void
.end method

.method public setIpv6Callback(Lcom/immomo/mmdns/MDDNSEntrance$IPV6Callback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->ipv6Callback:Lcom/immomo/mmdns/MDDNSEntrance$IPV6Callback;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestEnv(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->checkInited()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->currentEnv:I

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->appId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Lcom/immomo/mmdns/MDDNSEntrance;->nativeSetEnv(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setSyncMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mmdns/MDDNSEntrance;->syncMode:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUploadLogger(Lcom/immomo/mmdns/MDDNSEntrance$ILogger;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->dnsLogger:Lcom/immomo/mmdns/DNSLogger;

    .line 2
    .line 3
    new-instance v1, Lcom/immomo/mmdns/MDDNSEntrance$1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/immomo/mmdns/MDDNSEntrance$1;-><init>(Lcom/immomo/mmdns/MDDNSEntrance;Lcom/immomo/mmdns/MDDNSEntrance$ILogger;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/immomo/mmdns/DNSLogger;->setLogCallback(Lcom/immomo/mmdns/DNSLogger$LogCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public useDNS(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openAll:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->openDNS:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    iget-object v0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->whiteHostSet:Ljava/util/Set;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mmdns/MDDNSEntrance;->whiteHostSet:Ljava/util/Set;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    monitor-exit v0

    .line 23
    return p0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method
