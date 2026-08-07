.class public Lcom/immomo/mmdns/WebDnsEventListenerWrapper;
.super Ll/t4f;
.source "SourceFile"


# instance fields
.field private final eventListener:Ll/t4f;

.field public outterEventListener:Ll/t4f;


# direct methods
.method public constructor <init>(Ll/t4f;Ll/t4f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t4f;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public callEnd(Ll/ry3;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/t4f;->callEnd(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/t4f;->callEnd(Ll/ry3;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public callFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/t4f;->callFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/t4f;->callFailed(Ll/ry3;Ljava/io/IOException;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public callStart(Ll/ry3;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/t4f;->callStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/t4f;->callStart(Ll/ry3;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/t4f;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/t4f;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move-object v5, p5

    .line 10
    invoke-virtual/range {v0 .. v5}, Ll/t4f;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual/range {p0 .. p5}, Ll/t4f;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :catch_0
    :cond_1
    return-void
.end method

.method public connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ll/t4f;->connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Ll/t4f;->connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public connectionAcquired(Ll/ry3;Ll/bx5;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/t4f;->connectionAcquired(Ll/ry3;Ll/bx5;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/t4f;->connectionAcquired(Ll/ry3;Ll/bx5;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public connectionReleased(Ll/ry3;Ll/bx5;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/t4f;->connectionReleased(Ll/ry3;Ll/bx5;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/t4f;->connectionReleased(Ll/ry3;Ll/bx5;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
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
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ll/t4f;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Ll/t4f;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public dnsStart(Ll/ry3;Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/t4f;->dnsStart(Ll/ry3;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/t4f;->dnsStart(Ll/ry3;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public requestBodyEnd(Ll/ry3;J)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ll/t4f;->requestBodyEnd(Ll/ry3;J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Ll/t4f;->requestBodyEnd(Ll/ry3;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public requestBodyStart(Ll/ry3;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/t4f;->requestBodyStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/t4f;->requestBodyStart(Ll/ry3;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/t4f;->requestHeadersEnd(Ll/ry3;Ll/x1d0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/t4f;->requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public requestHeadersStart(Ll/ry3;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/t4f;->requestHeadersStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/t4f;->requestHeadersStart(Ll/ry3;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public responseBodyEnd(Ll/ry3;J)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ll/t4f;->responseBodyEnd(Ll/ry3;J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Ll/t4f;->responseBodyEnd(Ll/ry3;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public responseBodyStart(Ll/ry3;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/t4f;->responseBodyStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/t4f;->responseBodyStart(Ll/ry3;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public responseHeadersStart(Ll/ry3;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/t4f;->responseHeadersStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/t4f;->responseHeadersStart(Ll/ry3;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public secureConnectEnd(Ll/ry3;Ll/txk;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/t4f;->secureConnectEnd(Ll/ry3;Ll/txk;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/t4f;->secureConnectEnd(Ll/ry3;Ll/txk;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method

.method public secureConnectStart(Ll/ry3;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->eventListener:Ll/t4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/t4f;->secureConnectStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/WebDnsEventListenerWrapper;->outterEventListener:Ll/t4f;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/t4f;->secureConnectStart(Ll/ry3;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    :cond_1
    return-void
.end method
