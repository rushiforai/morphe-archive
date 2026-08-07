.class public Ll/dml$l;
.super Ll/gc20;
.source "SourceFile"

# interfaces
.implements Ll/fml$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "l"
.end annotation


# instance fields
.field public final b:Ll/fml;

.field public final synthetic c:Ll/dml;


# direct methods
.method public constructor <init>(Ll/dml;Ll/fml;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    iget-object p1, p1, Ll/dml;->d:Ljava/lang/String;

    .line 4
    .line 5
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "OkHttp %s"

    .line 10
    .line 11
    invoke-direct {p0, v0, p1}, Ll/gc20;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Ll/dml$l;->b:Ll/fml;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(IILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Ll/xzk;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p3}, Ll/dml;->Q(ILjava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(ZII)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    if-ne p2, v1, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Ll/dml$l;->c:Ll/dml;

    .line 10
    .line 11
    invoke-static {p0}, Ll/dml;->e(Ll/dml;)J

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/4 p1, 0x2

    .line 18
    if-ne p2, p1, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/dml$l;->c:Ll/dml;

    .line 21
    .line 22
    invoke-static {p0}, Ll/dml;->n(Ll/dml;)J

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p1, 0x3

    .line 27
    if-ne p2, p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Ll/dml$l;->c:Ll/dml;

    .line 30
    .line 31
    invoke-static {p1}, Ll/dml;->q(Ll/dml;)J

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/dml$l;->c:Ll/dml;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_0
    monitor-exit v0

    .line 40
    return-void

    .line 41
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    throw p0

    .line 43
    :cond_3
    :try_start_1
    invoke-static {v0}, Ll/dml;->m(Ll/dml;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/dml$k;

    .line 48
    .line 49
    iget-object p0, p0, Ll/dml$l;->c:Ll/dml;

    .line 50
    .line 51
    invoke-direct {v0, p0, v1, p2, p3}, Ll/dml$k;-><init>(Ll/dml;ZII)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 55
    .line 56
    .line 57
    :catch_0
    return-void
.end method

.method public c(ILokhttp3/internal/http2/ErrorCode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dml;->U(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/dml$l;->c:Ll/dml;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/dml;->S(ILokhttp3/internal/http2/ErrorCode;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Ll/dml;->Z(I)Ll/gml;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Ll/gml;->o(Lokhttp3/internal/http2/ErrorCode;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public d(ILokhttp3/internal/http2/ErrorCode;Lokio/ByteString;)V
    .locals 3

    .line 1
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/dml$l;->c:Ll/dml;

    .line 5
    .line 6
    monitor-enter p2

    .line 7
    :try_start_0
    iget-object p3, p0, Ll/dml$l;->c:Ll/dml;

    .line 8
    .line 9
    iget-object p3, p3, Ll/dml;->c:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iget-object v0, p0, Ll/dml$l;->c:Ll/dml;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dml;->c:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    new-array v0, v0, [Ll/gml;

    .line 24
    .line 25
    invoke-interface {p3, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    check-cast p3, [Ll/gml;

    .line 30
    .line 31
    iget-object v0, p0, Ll/dml$l;->c:Ll/dml;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-static {v0, v1}, Ll/dml;->j(Ll/dml;Z)Z

    .line 35
    .line 36
    .line 37
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    array-length p2, p3

    .line 39
    const/4 v0, 0x0

    .line 40
    :goto_0
    if-ge v0, p2, :cond_1

    .line 41
    .line 42
    aget-object v1, p3, v0

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/gml;->g()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-le v2, p1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/gml;->j()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    sget-object v2, Lokhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lokhttp3/internal/http2/ErrorCode;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ll/gml;->o(Lokhttp3/internal/http2/ErrorCode;)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Ll/dml$l;->c:Ll/dml;

    .line 62
    .line 63
    invoke-virtual {v1}, Ll/gml;->g()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v2, v1}, Ll/dml;->Z(I)Ll/gml;

    .line 68
    .line 69
    .line 70
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    return-void

    .line 74
    :catchall_0
    move-exception p0

    .line 75
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    throw p0
.end method

.method public e(ZIILjava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZII",
            "Ljava/util/List<",
            "Ll/xzk;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p3, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    invoke-virtual {p3, p2}, Ll/dml;->U(I)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    iget-object v1, p0, Ll/dml$l;->c:Ll/dml;

    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1, p2, p4, p1}, Ll/dml;->N(ILjava/util/List;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    monitor-enter v1

    .line 16
    :try_start_0
    iget-object p3, p0, Ll/dml$l;->c:Ll/dml;

    .line 17
    .line 18
    invoke-virtual {p3, p2}, Ll/dml;->v(I)Ll/gml;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    if-nez p3, :cond_4

    .line 23
    .line 24
    iget-object p3, p0, Ll/dml$l;->c:Ll/dml;

    .line 25
    .line 26
    invoke-static {p3}, Ll/dml;->i(Ll/dml;)Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    monitor-exit v1

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    move-object p0, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object p3, p0, Ll/dml$l;->c:Ll/dml;

    .line 38
    .line 39
    iget v0, p3, Ll/dml;->e:I

    .line 40
    .line 41
    if-gt p2, v0, :cond_2

    .line 42
    .line 43
    monitor-exit v1

    .line 44
    return-void

    .line 45
    :cond_2
    rem-int/lit8 v0, p2, 0x2

    .line 46
    .line 47
    iget p3, p3, Ll/dml;->f:I

    .line 48
    .line 49
    rem-int/lit8 p3, p3, 0x2

    .line 50
    .line 51
    if-ne v0, p3, :cond_3

    .line 52
    .line 53
    monitor-exit v1

    .line 54
    return-void

    .line 55
    :cond_3
    invoke-static {p4}, Ll/zlk0;->J(Ljava/util/List;)Ll/e0l;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    new-instance v2, Ll/gml;

    .line 60
    .line 61
    iget-object v4, p0, Ll/dml$l;->c:Ll/dml;

    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    move v6, p1

    .line 65
    move v3, p2

    .line 66
    invoke-direct/range {v2 .. v7}, Ll/gml;-><init>(ILl/dml;ZZLl/e0l;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/dml$l;->c:Ll/dml;

    .line 70
    .line 71
    iput v3, p1, Ll/dml;->e:I

    .line 72
    .line 73
    iget-object p1, p1, Ll/dml;->c:Ljava/util/Map;

    .line 74
    .line 75
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-interface {p1, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    invoke-static {}, Ll/dml;->k()Ljava/util/concurrent/ExecutorService;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    new-instance p2, Ll/dml$l$a;

    .line 87
    .line 88
    const-string p3, "OkHttp %s stream %d"

    .line 89
    .line 90
    iget-object p4, p0, Ll/dml$l;->c:Ll/dml;

    .line 91
    .line 92
    iget-object p4, p4, Ll/dml;->d:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    filled-new-array {p4, v0}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p4

    .line 102
    invoke-direct {p2, p0, p3, p4, v2}, Ll/dml$l$a;-><init>(Ll/dml$l;Ljava/lang/String;[Ljava/lang/Object;Ll/gml;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 106
    .line 107
    .line 108
    monitor-exit v1

    .line 109
    return-void

    .line 110
    :cond_4
    move v6, p1

    .line 111
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    invoke-static {p4}, Ll/zlk0;->J(Ljava/util/List;)Ll/e0l;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p3, p0, v6}, Ll/gml;->n(Ll/e0l;Z)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :goto_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    throw p0
.end method

.method public f(IJ)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object p0, p0, Ll/dml$l;->c:Ll/dml;

    .line 7
    .line 8
    iget-wide v1, p0, Ll/dml;->s:J

    .line 9
    .line 10
    add-long/2addr v1, p2

    .line 11
    iput-wide v1, p0, Ll/dml;->s:J

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

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
    invoke-virtual {v0, p1}, Ll/dml;->v(I)Ll/gml;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    monitor-enter p0

    .line 28
    :try_start_1
    invoke-virtual {p0, p2, p3}, Ll/gml;->a(J)V

    .line 29
    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-void

    .line 33
    :catchall_1
    move-exception p1

    .line 34
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 35
    throw p1

    .line 36
    :cond_1
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public h(ZLl/vve0;)V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    invoke-static {v0}, Ll/dml;->m(Ll/dml;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/dml$l$b;

    .line 8
    .line 9
    const-string v3, "OkHttp %s ACK Settings"

    .line 10
    .line 11
    iget-object v2, p0, Ll/dml$l;->c:Ll/dml;

    .line 12
    .line 13
    iget-object v2, v2, Ll/dml;->d:Ljava/lang/String;

    .line 14
    .line 15
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    move-object v2, p0

    .line 20
    move v5, p1

    .line 21
    move-object v6, p2

    .line 22
    invoke-direct/range {v1 .. v6}, Ll/dml$l$b;-><init>(Ll/dml$l;Ljava/lang/String;[Ljava/lang/Object;ZLl/vve0;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    :catch_0
    return-void
.end method

.method public i(ZILokio/BufferedSource;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ll/dml;->U(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/dml$l;->c:Ll/dml;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1, p2, p3, p4, p1}, Ll/dml;->J(ILokio/BufferedSource;IZ)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {v1, p2}, Ll/dml;->v(I)Ll/gml;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Ll/dml$l;->c:Ll/dml;

    .line 22
    .line 23
    sget-object v0, Lokhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lokhttp3/internal/http2/ErrorCode;

    .line 24
    .line 25
    invoke-virtual {p1, p2, v0}, Ll/dml;->n0(ILokhttp3/internal/http2/ErrorCode;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/dml$l;->c:Ll/dml;

    .line 29
    .line 30
    int-to-long p1, p4

    .line 31
    invoke-virtual {p0, p1, p2}, Ll/dml;->i0(J)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p3, p1, p2}, Lokio/BufferedSource;->skip(J)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {v0, p3, p4}, Ll/gml;->m(Lokio/BufferedSource;I)V

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    sget-object p0, Ll/zlk0;->c:Ll/e0l;

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    invoke-virtual {v0, p0, p1}, Ll/gml;->n(Ll/e0l;Z)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method public j(IIIZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public k()V
    .locals 5

    .line 1
    sget-object v0, Lokhttp3/internal/http2/ErrorCode;->INTERNAL_ERROR:Lokhttp3/internal/http2/ErrorCode;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Ll/dml$l;->b:Ll/fml;

    .line 5
    .line 6
    invoke-virtual {v2, p0}, Ll/fml;->e(Ll/fml$b;)V

    .line 7
    .line 8
    .line 9
    :goto_0
    iget-object v2, p0, Ll/dml$l;->b:Ll/fml;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v2, v3, p0}, Ll/fml;->d(ZLl/fml$b;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object v2, Lokhttp3/internal/http2/ErrorCode;->NO_ERROR:Lokhttp3/internal/http2/ErrorCode;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 20
    .line 21
    :try_start_1
    sget-object v0, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    iget-object v3, p0, Ll/dml$l;->c:Ll/dml;

    .line 24
    .line 25
    invoke-virtual {v3, v2, v0, v1}, Ll/dml;->t(Lokhttp3/internal/http2/ErrorCode;Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    .line 26
    .line 27
    .line 28
    :goto_1
    iget-object p0, p0, Ll/dml$l;->b:Ll/fml;

    .line 29
    .line 30
    invoke-static {p0}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception v3

    .line 35
    goto :goto_3

    .line 36
    :catch_0
    move-exception v1

    .line 37
    goto :goto_2

    .line 38
    :catchall_1
    move-exception v3

    .line 39
    move-object v2, v0

    .line 40
    goto :goto_3

    .line 41
    :catch_1
    move-exception v1

    .line 42
    move-object v2, v0

    .line 43
    :goto_2
    :try_start_2
    sget-object v0, Lokhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lokhttp3/internal/http2/ErrorCode;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    .line 45
    iget-object v2, p0, Ll/dml$l;->c:Ll/dml;

    .line 46
    .line 47
    invoke-virtual {v2, v0, v0, v1}, Ll/dml;->t(Lokhttp3/internal/http2/ErrorCode;Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :goto_3
    iget-object v4, p0, Ll/dml$l;->c:Ll/dml;

    .line 52
    .line 53
    invoke-virtual {v4, v2, v0, v1}, Ll/dml;->t(Lokhttp3/internal/http2/ErrorCode;Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/dml$l;->b:Ll/fml;

    .line 57
    .line 58
    invoke-static {p0}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 59
    .line 60
    .line 61
    throw v3
.end method

.method public l(ZLl/vve0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dml$l;->c:Ll/dml;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dml;->w:Ll/hml;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/dml$l;->c:Ll/dml;

    .line 7
    .line 8
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    :try_start_1
    iget-object v2, p0, Ll/dml$l;->c:Ll/dml;

    .line 10
    .line 11
    iget-object v2, v2, Ll/dml;->u:Ll/vve0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/vve0;->d()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/dml$l;->c:Ll/dml;

    .line 20
    .line 21
    iget-object p1, p1, Ll/dml;->u:Ll/vve0;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/vve0;->a()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto/16 :goto_4

    .line 29
    .line 30
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/dml$l;->c:Ll/dml;

    .line 31
    .line 32
    iget-object p1, p1, Ll/dml;->u:Ll/vve0;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/vve0;->h(Ll/vve0;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/dml$l;->c:Ll/dml;

    .line 38
    .line 39
    iget-object p1, p1, Ll/dml;->u:Ll/vve0;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/vve0;->d()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/4 p2, -0x1

    .line 46
    const/4 v3, 0x0

    .line 47
    if-eq p1, p2, :cond_1

    .line 48
    .line 49
    if-eq p1, v2, :cond_1

    .line 50
    .line 51
    sub-int/2addr p1, v2

    .line 52
    int-to-long p1, p1

    .line 53
    iget-object v2, p0, Ll/dml$l;->c:Ll/dml;

    .line 54
    .line 55
    iget-object v2, v2, Ll/dml;->c:Ljava/util/Map;

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-nez v2, :cond_2

    .line 62
    .line 63
    iget-object v2, p0, Ll/dml$l;->c:Ll/dml;

    .line 64
    .line 65
    iget-object v2, v2, Ll/dml;->c:Ljava/util/Map;

    .line 66
    .line 67
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iget-object v3, p0, Ll/dml$l;->c:Ll/dml;

    .line 72
    .line 73
    iget-object v3, v3, Ll/dml;->c:Ljava/util/Map;

    .line 74
    .line 75
    invoke-interface {v3}, Ljava/util/Map;->size()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    new-array v3, v3, [Ll/gml;

    .line 80
    .line 81
    invoke-interface {v2, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    move-object v3, v2

    .line 86
    check-cast v3, [Ll/gml;

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_1
    const-wide/16 p1, 0x0

    .line 90
    .line 91
    :cond_2
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    :try_start_2
    iget-object v1, p0, Ll/dml$l;->c:Ll/dml;

    .line 93
    .line 94
    iget-object v2, v1, Ll/dml;->w:Ll/hml;

    .line 95
    .line 96
    iget-object v1, v1, Ll/dml;->u:Ll/vve0;

    .line 97
    .line 98
    invoke-virtual {v2, v1}, Ll/hml;->b(Ll/vve0;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :catchall_1
    move-exception p0

    .line 103
    goto :goto_5

    .line 104
    :catch_0
    move-exception v1

    .line 105
    :try_start_3
    iget-object v2, p0, Ll/dml$l;->c:Ll/dml;

    .line 106
    .line 107
    invoke-static {v2, v1}, Ll/dml;->b(Ll/dml;Ljava/io/IOException;)V

    .line 108
    .line 109
    .line 110
    :goto_2
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 111
    if-eqz v3, :cond_3

    .line 112
    .line 113
    array-length v0, v3

    .line 114
    const/4 v1, 0x0

    .line 115
    :goto_3
    if-ge v1, v0, :cond_3

    .line 116
    .line 117
    aget-object v2, v3, v1

    .line 118
    .line 119
    monitor-enter v2

    .line 120
    :try_start_4
    invoke-virtual {v2, p1, p2}, Ll/gml;->a(J)V

    .line 121
    .line 122
    .line 123
    monitor-exit v2

    .line 124
    add-int/lit8 v1, v1, 0x1

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :catchall_2
    move-exception p0

    .line 128
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 129
    throw p0

    .line 130
    :cond_3
    invoke-static {}, Ll/dml;->k()Ljava/util/concurrent/ExecutorService;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    new-instance p2, Ll/dml$l$c;

    .line 135
    .line 136
    const-string v0, "OkHttp %s settings"

    .line 137
    .line 138
    iget-object v1, p0, Ll/dml$l;->c:Ll/dml;

    .line 139
    .line 140
    iget-object v1, v1, Ll/dml;->d:Ljava/lang/String;

    .line 141
    .line 142
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-direct {p2, p0, v0, v1}, Ll/dml$l$c;-><init>(Ll/dml$l;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :goto_4
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 154
    :try_start_6
    throw p0

    .line 155
    :goto_5
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 156
    throw p0
.end method
