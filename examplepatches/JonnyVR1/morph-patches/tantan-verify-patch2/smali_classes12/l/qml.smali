.class public Ll/qml;
.super Ll/t4f;
.source "SourceFile"


# instance fields
.field private final a:Ll/xgw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/xgw<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/t4f;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xgw;

    .line 5
    .line 6
    const/16 v1, 0x14

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/xgw;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/qml;->a:Ll/xgw;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/Object;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/qml;->b:Ljava/lang/Object;

    .line 19
    .line 20
    return-void
.end method

.method private isSupportDns(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object p0, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    sget-object p0, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/immomo/hdata/android/MDevice$Config;->getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    sget-object p0, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 22
    .line 23
    invoke-interface {p0}, Lcom/immomo/hdata/android/MDevice$Config;->getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p1}, Lcom/immomo/mmdns/MDDNSEntrance;->useDNS(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method private recordFailed(Ll/ry3;)V
    .locals 1

    const/4 v0, 0x0

    .line 110
    invoke-direct {p0, p1, v0, v0}, Ll/qml;->recordFailed(Ll/ry3;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private recordFailed(Ll/ry3;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/x1d0;->k()Ll/rnl;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ll/rnl;->m()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    :cond_0
    invoke-direct {p0, p2}, Ll/qml;->isSupportDns(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p3, p0, Ll/qml;->b:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    :try_start_1
    iget-object p0, p0, Ll/qml;->a:Ll/xgw;

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    new-array v1, v1, [B

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    const/16 v3, 0xa

    .line 49
    .line 50
    aput-byte v3, v1, v2

    .line 51
    .line 52
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ll/xgw;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    check-cast p0, Ljava/lang/String;

    .line 75
    .line 76
    monitor-exit p3

    .line 77
    move-object p3, p0

    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    :try_start_2
    throw p0

    .line 82
    :cond_1
    :goto_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_2

    .line 87
    .line 88
    sget-object p0, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 89
    .line 90
    if-eqz p0, :cond_2

    .line 91
    .line 92
    sget-object p0, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 93
    .line 94
    invoke-interface {p0}, Lcom/immomo/hdata/android/MDevice$Config;->getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    if-eqz p0, :cond_2

    .line 99
    .line 100
    sget-object p0, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 101
    .line 102
    invoke-interface {p0}, Lcom/immomo/hdata/android/MDevice$Config;->getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0, p2, p3}, Lcom/immomo/mmdns/MDDNSEntrance;->requestFailedForDomain(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 107
    .line 108
    .line 109
    :catch_0
    :cond_2
    return-void
.end method

.method private recordSuccess(Ll/ry3;)V
    .locals 6

    .line 1
    :try_start_0
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p0, v0}, Ll/qml;->isSupportDns(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/qml;->b:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :try_start_1
    iget-object p0, p0, Ll/qml;->a:Ll/xgw;

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    new-array v3, v3, [B

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    const/16 v5, 0xa

    .line 37
    .line 38
    aput-byte v5, v3, v4

    .line 39
    .line 40
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Ll/xgw;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Ljava/lang/String;

    .line 63
    .line 64
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    :try_start_2
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_0

    .line 70
    .line 71
    sget-object p1, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 72
    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    sget-object p1, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 76
    .line 77
    invoke-interface {p1}, Lcom/immomo/hdata/android/MDevice$Config;->getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    if-eqz p1, :cond_0

    .line 82
    .line 83
    sget-object p1, Lcom/immomo/hdata/android/MDevice;->config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 84
    .line 85
    invoke-interface {p1}, Lcom/immomo/hdata/android/MDevice$Config;->getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1, v0, p0}, Lcom/immomo/mmdns/MDDNSEntrance;->requestSucceedForDomain(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :catchall_0
    move-exception p0

    .line 94
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 95
    :try_start_4
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 96
    :catch_0
    :cond_0
    return-void
.end method


# virtual methods
.method public callFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qml;->recordFailed(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/x1d0;->k()Ll/rnl;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p3}, Ll/rnl;->m()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p2}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-direct {p0, p1, p3, p2}, Ll/qml;->recordFailed(Ll/ry3;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ry3;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Ll/qml;->isSupportDns(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    check-cast p3, Ljava/net/InetAddress;

    .line 21
    .line 22
    invoke-virtual {p3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iget-object v1, p0, Ll/qml;->b:Ljava/lang/Object;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    iget-object p0, p0, Ll/qml;->a:Ll/xgw;

    .line 30
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const/4 p2, 0x1

    .line 40
    new-array p2, p2, [B

    .line 41
    .line 42
    const/16 v3, 0xa

    .line 43
    .line 44
    aput-byte v3, p2, v0

    .line 45
    .line 46
    invoke-static {p2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1, p3}, Ll/xgw;->e(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    monitor-exit v1

    .line 68
    return-void

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    throw p0

    .line 72
    :cond_0
    return-void
.end method

.method public responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/i5d0;->q()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/16 v0, 0x194

    .line 6
    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x190

    .line 10
    .line 11
    if-lt p2, v0, :cond_0

    .line 12
    .line 13
    const/16 v0, 0x257

    .line 14
    .line 15
    if-gt p2, v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ll/qml;->recordFailed(Ll/ry3;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/16 v0, 0xc8

    .line 22
    .line 23
    if-lt p2, v0, :cond_1

    .line 24
    .line 25
    const/16 v0, 0x12b

    .line 26
    .line 27
    if-gt p2, v0, :cond_1

    .line 28
    .line 29
    invoke-direct {p0, p1}, Ll/qml;->recordSuccess(Ll/ry3;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method
