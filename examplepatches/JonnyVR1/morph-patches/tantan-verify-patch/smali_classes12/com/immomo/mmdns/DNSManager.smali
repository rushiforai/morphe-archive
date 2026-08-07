.class public Lcom/immomo/mmdns/DNSManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static entranceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/immomo/mmdns/MDDNSEntrance;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/immomo/mmdns/DNSManager;->entranceMap:Ljava/util/Map;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized destroy(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class v0, Lcom/immomo/mmdns/DNSManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    sget-object v1, Lcom/immomo/mmdns/DNSManager;->entranceMap:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/immomo/mmdns/MDDNSEntrance;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :cond_1
    :try_start_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 33
    .line 34
    const-string v1, "please call destory in main thread"

    .line 35
    .line 36
    invoke-direct {p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p0

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p0
.end method

.method public static declared-synchronized getInstance(Ljava/lang/String;)Lcom/immomo/mmdns/MDDNSEntrance;
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/mmdns/DNSManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/immomo/mmdns/DNSManager;->entranceMap:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    sget-object v1, Lcom/immomo/mmdns/DNSManager;->entranceMap:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/immomo/mmdns/MDDNSEntrance;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object p0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 25
    .line 26
    const-string v1, "please call DNSManager#init first"

    .line 27
    .line 28
    invoke-direct {p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p0

    .line 32
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw p0
.end method

.method public static init(Landroid/content/Context;Lcom/immomo/mmdns/IMDDNSConfig;)V
    .locals 1

    const/4 v0, 0x0

    .line 105
    invoke-static {p0, p1, v0}, Lcom/immomo/mmdns/DNSManager;->init(Landroid/content/Context;Lcom/immomo/mmdns/IMDDNSConfig;Ljava/lang/String;)V

    return-void
.end method

.method public static declared-synchronized init(Landroid/content/Context;Lcom/immomo/mmdns/IMDDNSConfig;Ljava/lang/String;)V
    .locals 4

    .line 1
    const-class v0, Lcom/immomo/mmdns/DNSManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-ne v1, v2, :cond_2

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/immomo/mmdns/IMDDNSConfig;->getAppId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    invoke-static {p0}, Lcom/immomo/mmdns/NetUtil;->init(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Lcom/immomo/mmdns/MDDNSEntrance;

    .line 28
    .line 29
    invoke-direct {v1}, Lcom/immomo/mmdns/MDDNSEntrance;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    invoke-static {p0}, Lcom/immomo/mmdns/DNSUtils;->getCurrentProcessName(Landroid/content/Context;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/immomo/mmdns/IMDDNSConfig;->getAppId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v3, "-"

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {v1, p0, p1, p2}, Lcom/immomo/mmdns/MDDNSEntrance;->initDNSConfig(Landroid/content/Context;Lcom/immomo/mmdns/IMDDNSConfig;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    invoke-virtual {v1, p0}, Lcom/immomo/mmdns/MDDNSEntrance;->openAll(Z)V

    .line 74
    .line 75
    .line 76
    sget-object p0, Lcom/immomo/mmdns/DNSManager;->entranceMap:Ljava/util/Map;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/immomo/mmdns/IMDDNSConfig;->getAppId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    .line 84
    .line 85
    monitor-exit v0

    .line 86
    return-void

    .line 87
    :cond_1
    :try_start_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 88
    .line 89
    const-string p1, "please fill your appId in IMDDNSConfig imp"

    .line 90
    .line 91
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    throw p0

    .line 95
    :cond_2
    new-instance p0, Ljava/lang/RuntimeException;

    .line 96
    .line 97
    const-string p1, "please call init in main thread"

    .line 98
    .line 99
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw p0

    .line 103
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    throw p0
.end method

.method public static init(Lcom/immomo/mmdns/IMDDNSConfig;Lcom/immomo/mmdns/MDDNSEntrance;)V
    .locals 1

    .line 106
    sget-object v0, Lcom/immomo/mmdns/DNSManager;->entranceMap:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/immomo/mmdns/IMDDNSConfig;->getAppId()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static setLibraryLoader(Lcom/immomo/mmdns/MDDNSEntrance$LibraryLoader;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/immomo/mmdns/MDDNSEntrance;->setLibraryLoader(Lcom/immomo/mmdns/MDDNSEntrance$LibraryLoader;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setWebConfig(Lcom/immomo/mmdns/WebConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p0, Lcom/immomo/mmdns/WebDNSHandler;->webConfig:Lcom/immomo/mmdns/WebConfig;

    .line 5
    .line 6
    return-void
.end method
