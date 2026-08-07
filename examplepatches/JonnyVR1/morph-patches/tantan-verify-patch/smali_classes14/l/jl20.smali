.class public Ll/jl20;
.super Ll/t4f;
.source "SourceFile"


# instance fields
.field public a:Ll/rml;


# direct methods
.method public constructor <init>(Ll/rml;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t4f;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jl20;->a:Ll/rml;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Ll/ry3;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v0}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-class v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 46
    .line 47
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->Y(Ljava/lang/String;Lcom/tantanapp/common/network/NetworkTrackInfo;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public callEnd(Ll/ry3;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setCallEndTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Ll/jl20;->b(Ll/ry3;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public callFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setThrowable(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setCallEndTime(J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0, p1}, Ll/jl20;->b(Ll/ry3;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/jl20;->a:Ll/rml;

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Ll/rml;->callFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public callStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setCallStartTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    .locals 0
    .param p3    # Ljava/net/Proxy;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lokhttp3/Protocol;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnectEndTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
    .locals 3
    .param p3    # Ljava/net/Proxy;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lokhttp3/Protocol;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/io/IOException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnectEndTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/jl20;->a:Ll/rml;

    .line 23
    .line 24
    invoke-virtual/range {p0 .. p5}, Ll/rml;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnectStartTime(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setInetSocketAddress(Ljava/net/InetSocketAddress;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public connectionAcquired(Ll/ry3;Ll/bx5;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnection(Ll/bx5;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnectionAcquiredTime(J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public connectionReleased(Ll/ry3;Ll/bx5;)V
    .locals 0

    .line 1
    return-void
.end method

.method public dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
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
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setDnsEndTime(J)V

    .line 20
    .line 21
    .line 22
    if-eqz p3, :cond_2

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Ljava/net/InetAddress;

    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v3, ","

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-lez v2, :cond_1

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    add-int/lit8 v2, v2, -0x1

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnectIp(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    iget-object p0, p0, Ll/jl20;->a:Ll/rml;

    .line 81
    .line 82
    invoke-virtual {p0, p1, p2, p3}, Ll/rml;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public dnsStart(Ll/ry3;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setDnsStartTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public requestBodyEnd(Ll/ry3;J)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequestBodyEndTime(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2, p3}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequestBodyByteCount(J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public requestBodyStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseBodyStartTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequestHeadersEndTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public requestHeadersStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequestHeadersStartTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public responseBodyEnd(Ll/ry3;J)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseBodyEndTime(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2, p3}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseBodyByteCount(J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public responseBodyStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseBodyStartTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseHeadersEndTime(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponse(Ll/i5d0;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Ll/jl20;->a:Ll/rml;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Ll/rml;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public responseHeadersStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseHeadersStartTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public secureConnectEnd(Ll/ry3;Ll/txk;)V
    .locals 0
    .param p2    # Ll/txk;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setSecureConnectEndTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public secureConnectStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setSecureConnectStartTime(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
