.class public Ll/bpg0;
.super Ll/t4f;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/t4f;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/bpg0;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    check-cast v2, Ll/bpg0;

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public final c(Ll/bpg0;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/bpg0;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public callEnd(Ll/ry3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->callEnd(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Ll/t4f;->callEnd(Ll/ry3;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public callFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->callFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2}, Ll/t4f;->callFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public callStart(Ll/ry3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->callStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Ll/t4f;->callStart(Ll/ry3;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/t4f;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2, p3, p4}, Ll/t4f;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/t4f;->connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2, p3}, Ll/t4f;->connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/t4f;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2, p3}, Ll/t4f;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public dnsStart(Ll/ry3;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->dnsStart(Ll/ry3;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2}, Ll/t4f;->dnsStart(Ll/ry3;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public requestBodyEnd(Ll/ry3;J)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/t4f;->requestBodyEnd(Ll/ry3;J)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2, p3}, Ll/t4f;->requestBodyEnd(Ll/ry3;J)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public requestBodyStart(Ll/ry3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->requestBodyStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Ll/t4f;->requestBodyStart(Ll/ry3;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->requestHeadersEnd(Ll/ry3;Ll/x1d0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2}, Ll/t4f;->requestHeadersEnd(Ll/ry3;Ll/x1d0;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public requestHeadersStart(Ll/ry3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->requestHeadersStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Ll/t4f;->requestHeadersStart(Ll/ry3;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public responseBodyEnd(Ll/ry3;J)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/t4f;->responseBodyEnd(Ll/ry3;J)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2, p3}, Ll/t4f;->responseBodyEnd(Ll/ry3;J)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public responseBodyStart(Ll/ry3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->responseBodyStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Ll/t4f;->responseBodyStart(Ll/ry3;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public responseHeadersStart(Ll/ry3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->responseHeadersStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Ll/t4f;->responseHeadersStart(Ll/ry3;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public secureConnectEnd(Ll/ry3;Ll/txk;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->secureConnectEnd(Ll/ry3;Ll/txk;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2}, Ll/t4f;->secureConnectEnd(Ll/ry3;Ll/txk;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public secureConnectStart(Ll/ry3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->secureConnectStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bpg0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Ll/t4f;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Ll/t4f;->secureConnectStart(Ll/ry3;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method
