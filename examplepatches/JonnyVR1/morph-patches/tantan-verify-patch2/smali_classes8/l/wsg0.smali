.class public final Ll/wsg0;
.super Ll/t4f;
.source "SourceFile"


# instance fields
.field public final a:Ll/cpg0;

.field public b:J

.field public final c:Ll/bxg0;

.field public d:J

.field public e:J

.field public f:J

.field public g:J

.field public h:J

.field public final i:Ll/t4f;


# direct methods
.method public constructor <init>(Ll/bxg0;Ll/t4f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/t4f;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/cpg0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/cpg0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wsg0;->a:Ll/cpg0;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Ll/bxg0;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/bxg0;-><init>()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput-object p1, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 19
    .line 20
    iput-object p2, p0, Ll/wsg0;->i:Ll/t4f;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/wsg0;->b:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/32 v2, 0xf4240

    .line 9
    .line 10
    .line 11
    div-long/2addr v0, v2

    .line 12
    iget-object p0, p0, Ll/wsg0;->a:Ll/cpg0;

    .line 13
    .line 14
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 15
    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "["

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, " ms] "

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/cpg0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final callEnd(Ll/ry3;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->callEnd(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "callEnd"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/t4f;->callEnd(Ll/ry3;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final callFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->callFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "callFailed: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2}, Ll/t4f;->callFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final callStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->callStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Ll/wsg0;->b:J

    .line 9
    .line 10
    const-string v0, "callStart: ${call.request()}"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/t4f;->callStart(Ll/ry3;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/t4f;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "connectEnd: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iget-wide v3, p0, Ll/wsg0;->e:J

    .line 28
    .line 29
    sub-long/2addr v1, v3

    .line 30
    const-wide/32 v3, 0xf4240

    .line 31
    .line 32
    .line 33
    div-long/2addr v1, v3

    .line 34
    iput-wide v1, v0, Ll/bxg0;->b:J

    .line 35
    .line 36
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/t4f;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
    .locals 5

    .line 1
    invoke-super/range {p0 .. p5}, Ll/t4f;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "connectFailed: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    iget-wide v3, p0, Ll/wsg0;->e:J

    .line 36
    .line 37
    sub-long/2addr v1, v3

    .line 38
    const-wide/32 v3, 0xf4240

    .line 39
    .line 40
    .line 41
    div-long/2addr v1, v3

    .line 42
    iput-wide v1, v0, Ll/bxg0;->b:J

    .line 43
    .line 44
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 45
    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    invoke-virtual/range {p0 .. p5}, Ll/t4f;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public final connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/t4f;->connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "connectStart: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iput-wide v0, p0, Ll/wsg0;->e:J

    .line 34
    .line 35
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    iput-boolean v1, v0, Ll/bxg0;->g:Z

    .line 39
    .line 40
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0, p1, p2, p3}, Ll/t4f;->connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final connectionAcquired(Ll/ry3;Ll/bx5;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->connectionAcquired(Ll/ry3;Ll/bx5;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "connectionAcquired: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Ll/t4f;->connectionAcquired(Ll/ry3;Ll/bx5;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final connectionReleased(Ll/ry3;Ll/bx5;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->connectionReleased(Ll/ry3;Ll/bx5;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "connectionReleased"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Ll/t4f;->connectionReleased(Ll/ry3;Ll/bx5;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/t4f;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "dnsEnd: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iget-wide v3, p0, Ll/wsg0;->d:J

    .line 28
    .line 29
    sub-long/2addr v1, v3

    .line 30
    const-wide/32 v3, 0xf4240

    .line 31
    .line 32
    .line 33
    div-long/2addr v1, v3

    .line 34
    iput-wide v1, v0, Ll/bxg0;->a:J

    .line 35
    .line 36
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2, p3}, Ll/t4f;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final dnsStart(Ll/ry3;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->dnsStart(Ll/ry3;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "dnsStart: $domainName"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Ll/wsg0;->d:J

    .line 26
    .line 27
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Ll/t4f;->dnsStart(Ll/ry3;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final requestBodyEnd(Ll/ry3;J)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/t4f;->requestBodyEnd(Ll/ry3;J)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "requestBodyEnd: byteCount="

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iget-wide v3, p0, Ll/wsg0;->g:J

    .line 28
    .line 29
    sub-long/2addr v1, v3

    .line 30
    const-wide/32 v3, 0xf4240

    .line 31
    .line 32
    .line 33
    div-long/2addr v1, v3

    .line 34
    iput-wide v1, v0, Ll/bxg0;->d:J

    .line 35
    .line 36
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2, p3}, Ll/t4f;->requestBodyEnd(Ll/ry3;J)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final requestBodyStart(Ll/ry3;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->requestBodyStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "requestBodyStart"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/t4f;->requestBodyStart(Ll/ry3;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->requestHeadersEnd(Ll/ry3;Ll/x1d0;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "requestHeadersEnd"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iget-wide v3, p0, Ll/wsg0;->g:J

    .line 16
    .line 17
    sub-long/2addr v1, v3

    .line 18
    const-wide/32 v3, 0xf4240

    .line 19
    .line 20
    .line 21
    div-long/2addr v1, v3

    .line 22
    iput-wide v1, v0, Ll/bxg0;->d:J

    .line 23
    .line 24
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/t4f;->requestHeadersEnd(Ll/ry3;Ll/x1d0;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final requestHeadersStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->requestHeadersStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "requestHeadersStart"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Ll/wsg0;->g:J

    .line 14
    .line 15
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/t4f;->requestHeadersStart(Ll/ry3;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final responseBodyEnd(Ll/ry3;J)V
    .locals 9

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/t4f;->responseBodyEnd(Ll/ry3;J)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "responseBodyEnd: byteCount="

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iget-wide v3, p0, Ll/wsg0;->h:J

    .line 28
    .line 29
    sub-long/2addr v1, v3

    .line 30
    const-wide/32 v5, 0xf4240

    .line 31
    .line 32
    .line 33
    div-long/2addr v1, v5

    .line 34
    iput-wide v1, v0, Ll/bxg0;->e:J

    .line 35
    .line 36
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 37
    .line 38
    iget-wide v1, p0, Ll/wsg0;->g:J

    .line 39
    .line 40
    iget-wide v7, v0, Ll/bxg0;->d:J

    .line 41
    .line 42
    add-long/2addr v1, v7

    .line 43
    sub-long/2addr v3, v1

    .line 44
    div-long/2addr v3, v5

    .line 45
    iput-wide v3, v0, Ll/bxg0;->f:J

    .line 46
    .line 47
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 48
    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    invoke-virtual {p0, p1, p2, p3}, Ll/t4f;->responseBodyEnd(Ll/ry3;J)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final responseBodyStart(Ll/ry3;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->responseBodyStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "responseBodyStart"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-wide v0, p0, Ll/wsg0;->h:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Ll/wsg0;->h:J

    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/t4f;->responseBodyStart(Ll/ry3;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "responseHeadersEnd: $response"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iget-wide v3, p0, Ll/wsg0;->h:J

    .line 16
    .line 17
    sub-long/2addr v1, v3

    .line 18
    const-wide/32 v3, 0xf4240

    .line 19
    .line 20
    .line 21
    div-long/2addr v1, v3

    .line 22
    iput-wide v1, v0, Ll/bxg0;->e:J

    .line 23
    .line 24
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final responseHeadersStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->responseHeadersStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "responseHeadersStart"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Ll/wsg0;->h:J

    .line 14
    .line 15
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/t4f;->responseHeadersStart(Ll/ry3;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final secureConnectEnd(Ll/ry3;Ll/txk;)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2}, Ll/t4f;->secureConnectEnd(Ll/ry3;Ll/txk;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "secureConnectEnd: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/wsg0;->c:Ll/bxg0;

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iget-wide v3, p0, Ll/wsg0;->f:J

    .line 28
    .line 29
    sub-long/2addr v1, v3

    .line 30
    const-wide/32 v3, 0xf4240

    .line 31
    .line 32
    .line 33
    div-long/2addr v1, v3

    .line 34
    iput-wide v1, v0, Ll/bxg0;->c:J

    .line 35
    .line 36
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2}, Ll/t4f;->secureConnectEnd(Ll/ry3;Ll/txk;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final secureConnectStart(Ll/ry3;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/t4f;->secureConnectStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "secureConnectStart"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wsg0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Ll/wsg0;->f:J

    .line 14
    .line 15
    iget-object p0, p0, Ll/wsg0;->i:Ll/t4f;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/t4f;->secureConnectStart(Ll/ry3;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
