.class public final Ll/gml;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gml$c;,
        Ll/gml$a;,
        Ll/gml$b;
    }
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public final c:I

.field public final d:Ll/dml;

.field public final e:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ll/e0l;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public final g:Ll/gml$b;

.field public final h:Ll/gml$a;

.field public final i:Ll/gml$c;

.field public final j:Ll/gml$c;

.field public k:Lokhttp3/internal/http2/ErrorCode;

.field public l:Ljava/io/IOException;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(ILl/dml;ZZLl/e0l;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/gml;->a:J

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayDeque;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/gml;->e:Ljava/util/Deque;

    .line 14
    .line 15
    new-instance v1, Ll/gml$c;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/gml$c;-><init>(Ll/gml;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/gml;->i:Ll/gml$c;

    .line 21
    .line 22
    new-instance v1, Ll/gml$c;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/gml$c;-><init>(Ll/gml;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/gml;->j:Ll/gml$c;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    if-eqz p2, :cond_5

    .line 31
    .line 32
    iput p1, p0, Ll/gml;->c:I

    .line 33
    .line 34
    iput-object p2, p0, Ll/gml;->d:Ll/dml;

    .line 35
    .line 36
    iget-object p1, p2, Ll/dml;->u:Ll/vve0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/vve0;->d()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-long v2, p1

    .line 43
    iput-wide v2, p0, Ll/gml;->b:J

    .line 44
    .line 45
    new-instance p1, Ll/gml$b;

    .line 46
    .line 47
    iget-object p2, p2, Ll/dml;->t:Ll/vve0;

    .line 48
    .line 49
    invoke-virtual {p2}, Ll/vve0;->d()I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    int-to-long v2, p2

    .line 54
    invoke-direct {p1, p0, v2, v3}, Ll/gml$b;-><init>(Ll/gml;J)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Ll/gml;->g:Ll/gml$b;

    .line 58
    .line 59
    new-instance p2, Ll/gml$a;

    .line 60
    .line 61
    invoke-direct {p2, p0}, Ll/gml$a;-><init>(Ll/gml;)V

    .line 62
    .line 63
    .line 64
    iput-object p2, p0, Ll/gml;->h:Ll/gml$a;

    .line 65
    .line 66
    iput-boolean p4, p1, Ll/gml$b;->f:Z

    .line 67
    .line 68
    iput-boolean p3, p2, Ll/gml$a;->d:Z

    .line 69
    .line 70
    if-eqz p5, :cond_0

    .line 71
    .line 72
    invoke-interface {v0, p5}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_0
    invoke-virtual {p0}, Ll/gml;->j()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    if-nez p5, :cond_1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    const-string p0, "locally-initiated streams shouldn\'t have headers yet"

    .line 85
    .line 86
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    throw v1

    .line 90
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/gml;->j()Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-nez p0, :cond_4

    .line 95
    .line 96
    if-eqz p5, :cond_3

    .line 97
    .line 98
    return-void

    .line 99
    :cond_3
    const-string p0, "remotely-initiated streams should have headers"

    .line 100
    .line 101
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw v1

    .line 105
    :cond_4
    return-void

    .line 106
    :cond_5
    const-string p0, "connection == null"

    .line 107
    .line 108
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw v1
.end method


# virtual methods
.method public a(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/gml;->b:J

    .line 2
    .line 3
    add-long/2addr v0, p1

    .line 4
    iput-wide v0, p0, Ll/gml;->b:J

    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long p1, p1, v0

    .line 9
    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/gml;->g:Ll/gml$b;

    .line 3
    .line 4
    iget-boolean v1, v0, Ll/gml$b;->f:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    iget-boolean v0, v0, Ll/gml$b;->e:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/gml;->h:Ll/gml$a;

    .line 13
    .line 14
    iget-boolean v1, v0, Ll/gml$a;->d:Z

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-boolean v0, v0, Ll/gml$a;->c:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_2

    .line 25
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_1
    invoke-virtual {p0}, Ll/gml;->k()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    sget-object v0, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v0, v1}, Ll/gml;->d(Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    if-nez v1, :cond_3

    .line 43
    .line 44
    iget-object v0, p0, Ll/gml;->d:Ll/dml;

    .line 45
    .line 46
    iget p0, p0, Ll/gml;->c:I

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ll/dml;->Z(I)Ll/gml;

    .line 49
    .line 50
    .line 51
    :cond_3
    return-void

    .line 52
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw v0
.end method

.method public c()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gml;->h:Ll/gml$a;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/gml$a;->c:Z

    .line 4
    .line 5
    if-nez v1, :cond_3

    .line 6
    .line 7
    iget-boolean v0, v0, Ll/gml$a;->d:Z

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Ll/gml;->l:Ljava/io/IOException;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Lokhttp3/internal/http2/StreamResetException;

    .line 21
    .line 22
    invoke-direct {p0, v0}, Lokhttp3/internal/http2/StreamResetException;-><init>(Lokhttp3/internal/http2/ErrorCode;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    throw p0

    .line 26
    :cond_1
    return-void

    .line 27
    :cond_2
    const-string p0, "stream finished"

    .line 28
    .line 29
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_3
    const-string p0, "stream closed"

    .line 34
    .line 35
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d(Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gml;->e(Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p2, p0, Ll/gml;->d:Ll/dml;

    .line 9
    .line 10
    iget p0, p0, Ll/gml;->c:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, p1}, Ll/dml;->m0(ILokhttp3/internal/http2/ErrorCode;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final e(Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return v1

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/gml;->g:Ll/gml$b;

    .line 12
    .line 13
    iget-boolean v0, v0, Ll/gml$b;->f:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/gml;->h:Ll/gml$a;

    .line 18
    .line 19
    iget-boolean v0, v0, Ll/gml$a;->d:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return v1

    .line 25
    :cond_1
    iput-object p1, p0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 26
    .line 27
    iput-object p2, p0, Ll/gml;->l:Ljava/io/IOException;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 30
    .line 31
    .line 32
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    iget-object p1, p0, Ll/gml;->d:Ll/dml;

    .line 34
    .line 35
    iget p0, p0, Ll/gml;->c:I

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ll/dml;->Z(I)Ll/gml;

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw p1
.end method

.method public f(Lokhttp3/internal/http2/ErrorCode;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/gml;->e(Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ll/gml;->d:Ll/dml;

    .line 10
    .line 11
    iget p0, p0, Ll/gml;->c:I

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Ll/dml;->n0(ILokhttp3/internal/http2/ErrorCode;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gml;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Lokio/Sink;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gml;->f:Z

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gml;->j()Z

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
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 14
    .line 15
    const-string v1, "reply before requesting the sink"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw v0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    iget-object p0, p0, Ll/gml;->h:Ll/gml$a;

    .line 25
    .line 26
    return-object p0

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v0
.end method

.method public i()Lokio/Source;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gml;->g:Ll/gml$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Z
    .locals 3

    .line 1
    iget v0, p0, Ll/gml;->c:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    and-int/2addr v0, v1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v2

    .line 11
    :goto_0
    iget-object p0, p0, Ll/gml;->d:Ll/dml;

    .line 12
    .line 13
    iget-boolean p0, p0, Ll/dml;->a:Z

    .line 14
    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    return v2
.end method

.method public declared-synchronized k()Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_1
    iget-object v0, p0, Ll/gml;->g:Ll/gml$b;

    .line 10
    .line 11
    iget-boolean v2, v0, Ll/gml$b;->f:Z

    .line 12
    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    iget-boolean v0, v0, Ll/gml$b;->e:Z

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/gml;->h:Ll/gml$a;

    .line 23
    .line 24
    iget-boolean v2, v0, Ll/gml$a;->d:Z

    .line 25
    .line 26
    if-nez v2, :cond_2

    .line 27
    .line 28
    iget-boolean v0, v0, Ll/gml$a;->c:Z

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    :cond_2
    iget-boolean v0, p0, Ll/gml;->f:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return v1

    .line 38
    :cond_3
    monitor-exit p0

    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    throw v0
.end method

.method public l()Lokio/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gml;->i:Ll/gml$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Lokio/BufferedSource;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gml;->g:Ll/gml$b;

    .line 2
    .line 3
    int-to-long v0, p2

    .line 4
    invoke-virtual {p0, p1, v0, v1}, Ll/gml$b;->d(Lokio/BufferedSource;J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n(Ll/e0l;Z)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gml;->f:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/gml;->g:Ll/gml$b;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/gml$b;->b(Ll/gml$b;Ll/e0l;)Ll/e0l;

    .line 13
    .line 14
    .line 15
    goto :goto_1

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_2

    .line 18
    :cond_1
    :goto_0
    iput-boolean v1, p0, Ll/gml;->f:Z

    .line 19
    .line 20
    iget-object v0, p0, Ll/gml;->e:Ljava/util/Deque;

    .line 21
    .line 22
    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :goto_1
    if-eqz p2, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Ll/gml;->g:Ll/gml$b;

    .line 28
    .line 29
    iput-boolean v1, p1, Ll/gml$b;->f:Z

    .line 30
    .line 31
    :cond_2
    invoke-virtual {p0}, Ll/gml;->k()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 36
    .line 37
    .line 38
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Ll/gml;->d:Ll/dml;

    .line 42
    .line 43
    iget p0, p0, Ll/gml;->c:I

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ll/dml;->Z(I)Ll/gml;

    .line 46
    .line 47
    .line 48
    :cond_3
    return-void

    .line 49
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    throw p1
.end method

.method public declared-synchronized o(Lokhttp3/internal/http2/ErrorCode;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public declared-synchronized p()Ll/e0l;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/gml;->i:Ll/gml$c;

    .line 3
    .line 4
    invoke-virtual {v0}, Lokio/AsyncTimeout;->enter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    .line 7
    :goto_0
    :try_start_1
    iget-object v0, p0, Ll/gml;->e:Ljava/util/Deque;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/gml;->q()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_2

    .line 25
    :cond_0
    :try_start_2
    iget-object v0, p0, Ll/gml;->i:Ll/gml$c;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/gml$c;->a()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/gml;->e:Ljava/util/Deque;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/gml;->e:Ljava/util/Deque;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ll/e0l;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return-object v0

    .line 48
    :catchall_1
    move-exception v0

    .line 49
    goto :goto_3

    .line 50
    :cond_1
    :try_start_3
    iget-object v0, p0, Ll/gml;->l:Ljava/io/IOException;

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    new-instance v0, Lokhttp3/internal/http2/StreamResetException;

    .line 56
    .line 57
    iget-object v1, p0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 58
    .line 59
    invoke-direct {v0, v1}, Lokhttp3/internal/http2/StreamResetException;-><init>(Lokhttp3/internal/http2/ErrorCode;)V

    .line 60
    .line 61
    .line 62
    :goto_1
    throw v0

    .line 63
    :goto_2
    iget-object v1, p0, Ll/gml;->i:Ll/gml$c;

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/gml$c;->a()V

    .line 66
    .line 67
    .line 68
    throw v0

    .line 69
    :goto_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 70
    throw v0
.end method

.method public q()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/io/InterruptedIOException;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 15
    .line 16
    .line 17
    throw p0
.end method

.method public r()Lokio/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gml;->j:Ll/gml$c;

    .line 2
    .line 3
    return-object p0
.end method
