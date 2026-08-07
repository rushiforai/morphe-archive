.class public Ll/jsp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/isp0;
.implements Ll/ctp0$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jsp0$e;,
        Ll/jsp0$i;,
        Ll/jsp0$f;,
        Ll/jsp0$g;,
        Ll/jsp0$h;
    }
.end annotation


# static fields
.field public static final v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ll/x1d0;

.field public final b:Ll/lsp0;

.field public final c:Ljava/util/Random;

.field public final d:Ljava/lang/String;

.field public e:Ll/ry3;

.field public final f:Ljava/lang/Runnable;

.field public g:Ll/ctp0;

.field public h:Ll/etp0;

.field public i:Ljava/util/concurrent/ScheduledExecutorService;

.field public j:Ll/jsp0$i;

.field public final k:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lokio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public m:J

.field public n:Z

.field public o:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field public p:I

.field public q:Ljava/lang/String;

.field public r:Z

.field public s:I

.field public t:I

.field public u:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/jsp0;->v:Ljava/util/List;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/x1d0;Ll/lsp0;Ljava/util/Random;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayDeque;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/jsp0;->k:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/jsp0;->l:Ljava/util/ArrayDeque;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Ll/jsp0;->p:I

    .line 20
    .line 21
    const-string v0, "GET"

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/x1d0;->g()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iput-object p1, p0, Ll/jsp0;->a:Ll/x1d0;

    .line 34
    .line 35
    iput-object p2, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 36
    .line 37
    iput-object p3, p0, Ll/jsp0;->c:Ljava/util/Random;

    .line 38
    .line 39
    const/16 p1, 0x10

    .line 40
    .line 41
    new-array p1, p1, [B

    .line 42
    .line 43
    invoke-virtual {p3, p1}, Ljava/util/Random;->nextBytes([B)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1}, Lokio/ByteString;->of([B)Lokio/ByteString;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lokio/ByteString;->base64()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Ll/jsp0;->d:Ljava/lang/String;

    .line 55
    .line 56
    new-instance p1, Ll/jsp0$a;

    .line 57
    .line 58
    invoke-direct {p1, p0}, Ll/jsp0$a;-><init>(Ll/jsp0;)V

    .line 59
    .line 60
    .line 61
    iput-object p1, p0, Ll/jsp0;->f:Ljava/lang/Runnable;

    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    const-string p0, "Request must be GET: "

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/x1d0;->g()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p0, p1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    const/4 p0, 0x0

    .line 74
    throw p0
.end method

.method public static m(Ll/x1d0;Ll/rg50;ILjava/lang/String;ZLl/lsp0;)Ll/isp0;
    .locals 2

    .line 1
    new-instance v0, Ll/jsp0;

    .line 2
    .line 3
    new-instance v1, Ljava/util/Random;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0, p5, v1}, Ll/jsp0;-><init>(Ll/x1d0;Ll/lsp0;Ljava/util/Random;)V

    .line 9
    .line 10
    .line 11
    iput p2, v0, Ll/jsp0;->u:I

    .line 12
    .line 13
    invoke-virtual {v0, p1, p3, p4}, Ll/jsp0;->j(Ll/rg50;Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public declared-synchronized a(Lokio/ByteString;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/jsp0;->r:Z

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-boolean v0, p0, Ll/jsp0;->n:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/jsp0;->l:Ljava/util/ArrayDeque;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget-object v0, p0, Ll/jsp0;->k:Ljava/util/ArrayDeque;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/jsp0;->n()V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Ll/jsp0;->s:I

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    iput v0, p0, Ll/jsp0;->s:I

    .line 34
    .line 35
    iget-object v0, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/lsp0;->g(Lokio/ByteString;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :cond_1
    :goto_0
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw p1
.end method

.method public declared-synchronized b(Lokio/ByteString;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Ll/jsp0;->t:I

    .line 3
    .line 4
    add-int/lit8 v0, v0, 0x1

    .line 5
    .line 6
    iput v0, p0, Ll/jsp0;->t:I

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/jsp0;->r:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :cond_0
    :try_start_1
    iget-object v0, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/lsp0;->h(Lokio/ByteString;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 23
    throw p1
.end method

.method public c(Lokio/ByteString;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/jsp0;->o(Lokio/ByteString;I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0

    .line 9
    :cond_0
    const-string p0, "bytes == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public close(ILjava/lang/String;)Z
    .locals 2

    .line 1
    const-wide/32 v0, 0xea60

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/jsp0;->i(ILjava/lang/String;J)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public d(Lokio/ByteString;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/jsp0;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/lsp0;->e(Ll/isp0;Lokio/ByteString;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public e(Lokio/ByteString;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/jsp0;->r:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-boolean v0, p0, Ll/jsp0;->n:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 22
    .line 23
    new-instance v1, Ll/jsp0$h;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/jsp0$h;-><init>(Ll/jsp0;Lokio/ByteString;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    :goto_0
    return v1
.end method

.method public f(Ljava/lang/Exception;Ll/i5d0;)V
    .locals 3
    .param p2    # Ll/i5d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/jsp0;->r:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/jsp0;->r:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 17
    .line 18
    iget-object v1, p0, Ll/jsp0;->o:Ljava/util/concurrent/ScheduledFuture;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 31
    .line 32
    .line 33
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :try_start_1
    iget-object v1, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 35
    .line 36
    invoke-virtual {v1, p0, p1, p2}, Ll/lsp0;->c(Ll/isp0;Ljava/lang/Throwable;Ll/i5d0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    .line 38
    .line 39
    invoke-static {v0}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_1
    move-exception p0

    .line 44
    invoke-static {v0}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 45
    .line 46
    .line 47
    throw p0

    .line 48
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    throw p1
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jsp0;->e:Ll/ry3;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ry3;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Ll/i5d0;Ll/n6f;)V
    .locals 3
    .param p2    # Ll/n6f;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/i5d0;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x65

    .line 6
    .line 7
    if-ne v0, v1, :cond_4

    .line 8
    .line 9
    const-string v0, "Connection"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "Upgrade"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_3

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "websocket"

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    const-string v0, "Sec-WebSocket-Accept"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/jsp0;->d:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lokio/ByteString;->sha1()Lokio/ByteString;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lokio/ByteString;->base64()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    if-eqz p2, :cond_0

    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    const-string p0, "Web Socket exchange missing: bad interceptor?"

    .line 82
    .line 83
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    invoke-static {p0, p1}, Ll/fnc0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    const-string p0, "Expected \'Upgrade\' header value \'websocket\' but was \'"

    .line 92
    .line 93
    invoke-static {p0, v0}, Ll/gnc0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    const-string p0, "Expected \'Connection\' header value \'Upgrade\' but was \'"

    .line 98
    .line 99
    invoke-static {p0, v0}, Ll/gnc0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    new-instance p0, Ljava/net/ProtocolException;

    .line 104
    .line 105
    invoke-virtual {p1}, Ll/i5d0;->q()I

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    invoke-virtual {p1}, Ll/i5d0;->J()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v1, "Expected HTTP 101 response but was \'"

    .line 116
    .line 117
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string p2, " "

    .line 124
    .line 125
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p1, "\'"

    .line 132
    .line 133
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    throw p0
.end method

.method public declared-synchronized i(ILjava/lang/String;J)Z
    .locals 6

    .line 1
    const-string v0, "reason.size() > 123: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-static {p1}, Ll/btp0;->c(I)V

    .line 5
    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-static {p2}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lokio/ByteString;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    int-to-long v2, v2

    .line 18
    const-wide/16 v4, 0x7b

    .line 19
    .line 20
    cmp-long v2, v2, v4

    .line 21
    .line 22
    if-gtz v2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 26
    .line 27
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p1

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    const/4 v1, 0x0

    .line 38
    :goto_0
    iget-boolean p2, p0, Ll/jsp0;->r:Z

    .line 39
    .line 40
    if-nez p2, :cond_3

    .line 41
    .line 42
    iget-boolean p2, p0, Ll/jsp0;->n:Z

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const/4 p2, 0x1

    .line 48
    iput-boolean p2, p0, Ll/jsp0;->n:Z

    .line 49
    .line 50
    iget-object v0, p0, Ll/jsp0;->l:Ljava/util/ArrayDeque;

    .line 51
    .line 52
    new-instance v2, Ll/jsp0$f;

    .line 53
    .line 54
    invoke-direct {v2, p1, v1, p3, p4}, Ll/jsp0$f;-><init>(ILokio/ByteString;J)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/jsp0;->n()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    .line 63
    monitor-exit p0

    .line 64
    return p2

    .line 65
    :cond_3
    :goto_1
    monitor-exit p0

    .line 66
    const/4 p0, 0x0

    .line 67
    return p0

    .line 68
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    throw p1
.end method

.method public j(Ll/rg50;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/rg50;->v()Ll/rg50$b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Ll/t4f;->NONE:Ll/t4f;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/rg50$b;->k(Ll/t4f;)Ll/rg50$b;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Ll/jsp0;->v:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/rg50$b;->r(Ljava/util/List;)Ll/rg50$b;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p3, :cond_0

    .line 18
    .line 19
    new-instance p3, Ll/jsp0$b;

    .line 20
    .line 21
    invoke-direct {p3, p0}, Ll/jsp0$b;-><init>(Ll/jsp0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p3}, Ll/rg50$b;->t(Ljava/net/ProxySelector;)Ll/rg50$b;

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p3, p0, Ll/jsp0;->a:Ll/x1d0;

    .line 32
    .line 33
    invoke-virtual {p3}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    const-string v0, "User-Agent"

    .line 38
    .line 39
    invoke-virtual {p3, v0, p2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const-string p3, "websocket"

    .line 44
    .line 45
    const-string v0, "Upgrade"

    .line 46
    .line 47
    invoke-virtual {p2, v0, p3}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    const-string p3, "Connection"

    .line 52
    .line 53
    invoke-virtual {p2, p3, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string p3, "Sec-WebSocket-Key"

    .line 58
    .line 59
    iget-object v0, p0, Ll/jsp0;->d:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p2, p3, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    const-string p3, "Sec-WebSocket-Version"

    .line 66
    .line 67
    const-string v0, "13"

    .line 68
    .line 69
    invoke-virtual {p2, p3, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p2}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    sget-object p3, Ll/kzm;->a:Ll/kzm;

    .line 78
    .line 79
    invoke-virtual {p3, p1, p2}, Ll/kzm;->h(Ll/rg50;Ll/x1d0;)Ll/ry3;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Ll/jsp0;->e:Ll/ry3;

    .line 84
    .line 85
    new-instance p3, Ll/jsp0$c;

    .line 86
    .line 87
    invoke-direct {p3, p0, p2}, Ll/jsp0$c;-><init>(Ll/jsp0;Ll/x1d0;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p1, p3}, Ll/zj20;->c(Ll/ry3;Ll/w84;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public k(Ljava/lang/String;JLl/jsp0$i;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p4, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 3
    .line 4
    new-instance v0, Ll/etp0;

    .line 5
    .line 6
    iget-boolean v1, p4, Ll/jsp0$i;->a:Z

    .line 7
    .line 8
    iget-object v2, p4, Ll/jsp0$i;->c:Lokio/BufferedSink;

    .line 9
    .line 10
    iget-object v3, p0, Ll/jsp0;->c:Ljava/util/Random;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3}, Ll/etp0;-><init>(ZLokio/BufferedSink;Ljava/util/Random;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/jsp0;->h:Ll/etp0;

    .line 16
    .line 17
    new-instance v4, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, v0}, Ll/zlk0;->H(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/jsp0$d;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/jsp0$d;-><init>(Ll/jsp0;)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-direct {v4, v1, p1, v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 31
    .line 32
    .line 33
    iput-object v4, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 34
    .line 35
    const-wide/16 v0, 0x0

    .line 36
    .line 37
    cmp-long p1, p2, v0

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    new-instance v5, Ll/jsp0$h;

    .line 42
    .line 43
    invoke-direct {v5, p0}, Ll/jsp0$h;-><init>(Ll/jsp0;)V

    .line 44
    .line 45
    .line 46
    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 47
    .line 48
    move-wide v8, p2

    .line 49
    move-wide v6, p2

    .line 50
    invoke-interface/range {v4 .. v10}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception v0

    .line 55
    move-object p1, v0

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/jsp0;->l:Ljava/util/ArrayDeque;

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/jsp0;->n()V

    .line 66
    .line 67
    .line 68
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    new-instance p1, Ll/ctp0;

    .line 70
    .line 71
    iget-boolean p2, p4, Ll/jsp0$i;->a:Z

    .line 72
    .line 73
    iget-object p3, p4, Ll/jsp0$i;->b:Lokio/BufferedSource;

    .line 74
    .line 75
    invoke-direct {p1, p2, p3, p0}, Ll/ctp0;-><init>(ZLokio/BufferedSource;Ll/ctp0$a;)V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Ll/jsp0;->g:Ll/ctp0;

    .line 79
    .line 80
    return-void

    .line 81
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    throw p1
.end method

.method public l()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget v0, p0, Ll/jsp0;->p:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/jsp0;->g:Ll/ctp0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ctp0;->a()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jsp0;->f:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public declared-synchronized o(Lokio/ByteString;I)Z
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/jsp0;->r:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/jsp0;->n:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-wide v2, p0, Ll/jsp0;->m:J

    .line 13
    .line 14
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-long v4, v0

    .line 19
    add-long/2addr v2, v4

    .line 20
    const-wide/32 v4, 0x1000000

    .line 21
    .line 22
    .line 23
    cmp-long v0, v2, v4

    .line 24
    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    const/16 p1, 0x3e9

    .line 28
    .line 29
    const/4 p2, 0x0

    .line 30
    invoke-virtual {p0, p1, p2}, Ll/jsp0;->close(ILjava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    monitor-exit p0

    .line 34
    return v1

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :try_start_1
    iget-wide v0, p0, Ll/jsp0;->m:J

    .line 38
    .line 39
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    int-to-long v2, v2

    .line 44
    add-long/2addr v0, v2

    .line 45
    iput-wide v0, p0, Ll/jsp0;->m:J

    .line 46
    .line 47
    iget-object v0, p0, Ll/jsp0;->l:Ljava/util/ArrayDeque;

    .line 48
    .line 49
    new-instance v1, Ll/jsp0$g;

    .line 50
    .line 51
    invoke-direct {v1, p2, p1}, Ll/jsp0$g;-><init>(ILokio/ByteString;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/jsp0;->n()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    .line 59
    .line 60
    monitor-exit p0

    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_2
    :goto_0
    monitor-exit p0

    .line 64
    return v1

    .line 65
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    throw p1
.end method

.method public onReadClose(ILjava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_4

    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget v1, p0, Ll/jsp0;->p:I

    .line 6
    .line 7
    if-ne v1, v0, :cond_3

    .line 8
    .line 9
    iput p1, p0, Ll/jsp0;->p:I

    .line 10
    .line 11
    iput-object p2, p0, Ll/jsp0;->q:Ljava/lang/String;

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/jsp0;->n:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/jsp0;->l:Ljava/util/ArrayDeque;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 27
    .line 28
    iput-object v1, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 29
    .line 30
    iget-object v1, p0, Ll/jsp0;->o:Ljava/util/concurrent/ScheduledFuture;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_3

    .line 41
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 44
    .line 45
    .line 46
    move-object v1, v0

    .line 47
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :try_start_1
    iget-object v0, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 49
    .line 50
    invoke-virtual {v0, p0, p1, p2}, Ll/lsp0;->b(Ll/isp0;ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 56
    .line 57
    invoke-virtual {v0, p0, p1, p2}, Ll/lsp0;->a(Ll/isp0;ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catchall_1
    move-exception p0

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    :goto_1
    invoke-static {v1}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :goto_2
    invoke-static {v1}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 68
    .line 69
    .line 70
    throw p0

    .line 71
    :cond_3
    :try_start_2
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 72
    .line 73
    const-string p2, "already closed"

    .line 74
    .line 75
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p1

    .line 79
    :goto_3
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    throw p1

    .line 81
    :cond_4
    invoke-static {}, Ll/fig0;->a()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public onReadMessage(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/jsp0;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/lsp0;->d(Ll/isp0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public p()Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/jsp0;->r:Z

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
    move-exception v0

    .line 10
    goto/16 :goto_4

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/jsp0;->h:Ll/etp0;

    .line 13
    .line 14
    iget-object v2, p0, Ll/jsp0;->k:Ljava/util/ArrayDeque;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lokio/ByteString;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    const/4 v4, -0x1

    .line 24
    if-nez v2, :cond_4

    .line 25
    .line 26
    iget-object v5, p0, Ll/jsp0;->l:Ljava/util/ArrayDeque;

    .line 27
    .line 28
    invoke-virtual {v5}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    instance-of v6, v5, Ll/jsp0$f;

    .line 33
    .line 34
    if-eqz v6, :cond_2

    .line 35
    .line 36
    iget v1, p0, Ll/jsp0;->p:I

    .line 37
    .line 38
    iget-object v6, p0, Ll/jsp0;->q:Ljava/lang/String;

    .line 39
    .line 40
    if-eq v1, v4, :cond_1

    .line 41
    .line 42
    iget-object v4, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 43
    .line 44
    iput-object v3, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 45
    .line 46
    iget-object v3, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 47
    .line 48
    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 49
    .line 50
    .line 51
    :goto_0
    move-object v3, v5

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    iget-object v4, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 54
    .line 55
    new-instance v7, Ll/jsp0$e;

    .line 56
    .line 57
    invoke-direct {v7, p0}, Ll/jsp0$e;-><init>(Ll/jsp0;)V

    .line 58
    .line 59
    .line 60
    move-object v8, v5

    .line 61
    check-cast v8, Ll/jsp0$f;

    .line 62
    .line 63
    iget-wide v8, v8, Ll/jsp0$f;->c:J

    .line 64
    .line 65
    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 66
    .line 67
    invoke-interface {v4, v7, v8, v9, v10}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    iput-object v4, p0, Ll/jsp0;->o:Ljava/util/concurrent/ScheduledFuture;

    .line 72
    .line 73
    move-object v4, v3

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    if-nez v5, :cond_3

    .line 76
    .line 77
    monitor-exit p0

    .line 78
    return v1

    .line 79
    :cond_3
    move-object v6, v3

    .line 80
    move v1, v4

    .line 81
    move-object v4, v6

    .line 82
    goto :goto_0

    .line 83
    :cond_4
    move-object v6, v3

    .line 84
    move v1, v4

    .line 85
    move-object v4, v6

    .line 86
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    if-eqz v2, :cond_5

    .line 88
    .line 89
    :try_start_1
    invoke-virtual {v0, v2}, Ll/etp0;->f(Lokio/ByteString;)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :catchall_1
    move-exception p0

    .line 94
    goto :goto_3

    .line 95
    :cond_5
    instance-of v2, v3, Ll/jsp0$g;

    .line 96
    .line 97
    if-eqz v2, :cond_6

    .line 98
    .line 99
    move-object v1, v3

    .line 100
    check-cast v1, Ll/jsp0$g;

    .line 101
    .line 102
    iget-object v1, v1, Ll/jsp0$g;->b:Lokio/ByteString;

    .line 103
    .line 104
    check-cast v3, Ll/jsp0$g;

    .line 105
    .line 106
    iget v2, v3, Ll/jsp0$g;->a:I

    .line 107
    .line 108
    invoke-virtual {v1}, Lokio/ByteString;->size()I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    int-to-long v5, v3

    .line 113
    invoke-virtual {v0, v2, v5, v6}, Ll/etp0;->a(IJ)Lokio/Sink;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-interface {v0, v1}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 122
    .line 123
    .line 124
    invoke-interface {v0}, Lokio/Sink;->close()V

    .line 125
    .line 126
    .line 127
    monitor-enter p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 128
    :try_start_2
    iget-wide v2, p0, Ll/jsp0;->m:J

    .line 129
    .line 130
    invoke-virtual {v1}, Lokio/ByteString;->size()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    int-to-long v0, v0

    .line 135
    sub-long/2addr v2, v0

    .line 136
    iput-wide v2, p0, Ll/jsp0;->m:J

    .line 137
    .line 138
    monitor-exit p0

    .line 139
    goto :goto_2

    .line 140
    :catchall_2
    move-exception v0

    .line 141
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 142
    :try_start_3
    throw v0

    .line 143
    :cond_6
    instance-of v2, v3, Ll/jsp0$f;

    .line 144
    .line 145
    if-eqz v2, :cond_8

    .line 146
    .line 147
    check-cast v3, Ll/jsp0$f;

    .line 148
    .line 149
    iget v2, v3, Ll/jsp0$f;->a:I

    .line 150
    .line 151
    iget-object v3, v3, Ll/jsp0$f;->b:Lokio/ByteString;

    .line 152
    .line 153
    invoke-virtual {v0, v2, v3}, Ll/etp0;->b(ILokio/ByteString;)V

    .line 154
    .line 155
    .line 156
    if-eqz v4, :cond_7

    .line 157
    .line 158
    iget-object v0, p0, Ll/jsp0;->b:Ll/lsp0;

    .line 159
    .line 160
    invoke-virtual {v0, p0, v1, v6}, Ll/lsp0;->a(Ll/isp0;ILjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 161
    .line 162
    .line 163
    :cond_7
    :goto_2
    invoke-static {v4}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 164
    .line 165
    .line 166
    const/4 p0, 0x1

    .line 167
    return p0

    .line 168
    :cond_8
    :try_start_4
    new-instance p0, Ljava/lang/AssertionError;

    .line 169
    .line 170
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 171
    .line 172
    .line 173
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 174
    :goto_3
    invoke-static {v4}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 175
    .line 176
    .line 177
    throw p0

    .line 178
    :goto_4
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 179
    throw v0
.end method

.method public q(Lokio/ByteString;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/jsp0;->r:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v0, p0, Ll/jsp0;->h:Ll/etp0;

    .line 11
    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    :try_start_1
    sget-object p1, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception p1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    invoke-virtual {v0, p1}, Ll/etp0;->e(Lokio/ByteString;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :goto_1
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, p1, v0}, Ll/jsp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 30
    throw p1
.end method

.method public release()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/jsp0;->r:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/jsp0;->r:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Ll/jsp0;->j:Ll/jsp0$i;

    .line 17
    .line 18
    iget-object v1, p0, Ll/jsp0;->o:Ljava/util/concurrent/ScheduledFuture;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Ll/jsp0;->i:Ljava/util/concurrent/ScheduledExecutorService;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 31
    .line 32
    .line 33
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    invoke-static {v0}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw v0
.end method
