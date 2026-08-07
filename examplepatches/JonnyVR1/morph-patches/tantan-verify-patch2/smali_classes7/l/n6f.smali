.class public final Ll/n6f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n6f$b;,
        Ll/n6f$a;
    }
.end annotation


# instance fields
.field public final a:Ll/oij0;

.field public final b:Ll/ry3;

.field public final c:Ll/t4f;

.field public final d:Ll/p6f;

.field public final e:Ll/o6f;

.field public f:Z


# direct methods
.method public constructor <init>(Ll/oij0;Ll/ry3;Ll/t4f;Ll/p6f;Ll/o6f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n6f;->a:Ll/oij0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/n6f;->b:Ll/ry3;

    .line 7
    .line 8
    iput-object p3, p0, Ll/n6f;->c:Ll/t4f;

    .line 9
    .line 10
    iput-object p4, p0, Ll/n6f;->d:Ll/p6f;

    .line 11
    .line 12
    iput-object p5, p0, Ll/n6f;->e:Ll/o6f;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(JZZLjava/io/IOException;)Ljava/io/IOException;
    .locals 2

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p5}, Ll/n6f;->p(Ljava/io/IOException;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    if-eqz p4, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 9
    .line 10
    if-eqz p5, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p5}, Ll/t4f;->requestFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1, p2}, Ll/t4f;->requestBodyEnd(Ll/ry3;J)V

    .line 21
    .line 22
    .line 23
    :cond_2
    :goto_0
    if-eqz p3, :cond_4

    .line 24
    .line 25
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 26
    .line 27
    if-eqz p5, :cond_3

    .line 28
    .line 29
    iget-object p1, p0, Ll/n6f;->b:Ll/ry3;

    .line 30
    .line 31
    invoke-virtual {v0, p1, p5}, Ll/t4f;->responseFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_3
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 36
    .line 37
    invoke-virtual {v0, v1, p1, p2}, Ll/t4f;->responseBodyEnd(Ll/ry3;J)V

    .line 38
    .line 39
    .line 40
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/n6f;->a:Ll/oij0;

    .line 41
    .line 42
    invoke-virtual {p1, p0, p4, p3, p5}, Ll/oij0;->g(Ll/n6f;ZZLjava/io/IOException;)Ljava/io/IOException;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6f;->e:Ll/o6f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/o6f;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()Ll/imc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6f;->e:Ll/o6f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/o6f;->connection()Ll/imc0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ll/x1d0;Z)Lokio/Sink;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Ll/n6f;->f:Z

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Ll/z1d0;->contentLength()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-object p2, p0, Ll/n6f;->c:Ll/t4f;

    .line 12
    .line 13
    iget-object v2, p0, Ll/n6f;->b:Ll/ry3;

    .line 14
    .line 15
    invoke-virtual {p2, v2}, Ll/t4f;->requestBodyStart(Ll/ry3;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/n6f;->e:Ll/o6f;

    .line 19
    .line 20
    invoke-interface {p2, p1, v0, v1}, Ll/o6f;->b(Ll/x1d0;J)Lokio/Sink;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/n6f$a;

    .line 25
    .line 26
    invoke-direct {p2, p0, p1, v0, v1}, Ll/n6f$a;-><init>(Ll/n6f;Lokio/Sink;J)V

    .line 27
    .line 28
    .line 29
    return-object p2
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n6f;->e:Ll/o6f;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/o6f;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/n6f;->a:Ll/oij0;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, p0, v1, v1, v2}, Ll/oij0;->g(Ll/n6f;ZZLjava/io/IOException;)Ljava/io/IOException;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public f()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/n6f;->e:Ll/o6f;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/o6f;->e()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    iget-object v1, p0, Ll/n6f;->c:Ll/t4f;

    .line 9
    .line 10
    iget-object v2, p0, Ll/n6f;->b:Ll/ry3;

    .line 11
    .line 12
    invoke-virtual {v1, v2, v0}, Ll/t4f;->requestFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/n6f;->p(Ljava/io/IOException;)V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public g()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/n6f;->e:Ll/o6f;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/o6f;->c()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    iget-object v1, p0, Ll/n6f;->c:Ll/t4f;

    .line 9
    .line 10
    iget-object v2, p0, Ll/n6f;->b:Ll/ry3;

    .line 11
    .line 12
    invoke-virtual {v1, v2, v0}, Ll/t4f;->requestFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/n6f;->p(Ljava/io/IOException;)V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/n6f;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()Ll/jnc0$f;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/n6f;->a:Ll/oij0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/oij0;->o()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/n6f;->e:Ll/o6f;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/o6f;->connection()Ll/imc0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0}, Ll/imc0;->s(Ll/n6f;)Ll/jnc0$f;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6f;->e:Ll/o6f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/o6f;->connection()Ll/imc0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/imc0;->t()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n6f;->a:Ll/oij0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    invoke-virtual {v0, p0, v3, v1, v2}, Ll/oij0;->g(Ll/n6f;ZZLjava/io/IOException;)Ljava/io/IOException;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l(Ll/i5d0;)Ll/k5d0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 2
    .line 3
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/t4f;->responseBodyStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "Content-Type"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/n6f;->e:Ll/o6f;

    .line 15
    .line 16
    invoke-interface {v1, p1}, Ll/o6f;->a(Ll/i5d0;)J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iget-object v3, p0, Ll/n6f;->e:Ll/o6f;

    .line 21
    .line 22
    invoke-interface {v3, p1}, Ll/o6f;->g(Ll/i5d0;)Lokio/Source;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v3, Ll/n6f$b;

    .line 27
    .line 28
    invoke-direct {v3, p0, p1, v1, v2}, Ll/n6f$b;-><init>(Ll/n6f;Lokio/Source;J)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ll/vmc0;

    .line 32
    .line 33
    invoke-static {v3}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-direct {p1, v0, v1, v2, v3}, Ll/vmc0;-><init>(Ljava/lang/String;JLokio/BufferedSource;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    return-object p1

    .line 41
    :catch_0
    move-exception p1

    .line 42
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 43
    .line 44
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 45
    .line 46
    invoke-virtual {v0, v1, p1}, Ll/t4f;->responseFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/n6f;->p(Ljava/io/IOException;)V

    .line 50
    .line 51
    .line 52
    throw p1
.end method

.method public m(Z)Ll/i5d0$a;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/n6f;->e:Ll/o6f;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/o6f;->f(Z)Ll/i5d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/kzm;->a:Ll/kzm;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p0}, Ll/kzm;->g(Ll/i5d0$a;Ll/n6f;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-object p1

    .line 15
    :catch_0
    move-exception p1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-object p1

    .line 18
    :goto_0
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 19
    .line 20
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 21
    .line 22
    invoke-virtual {v0, v1, p1}, Ll/t4f;->responseFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/n6f;->p(Ljava/io/IOException;)V

    .line 26
    .line 27
    .line 28
    throw p1
.end method

.method public n(Ll/i5d0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n6f;->b:Ll/ry3;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/t4f;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n6f;->b:Ll/ry3;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/t4f;->responseHeadersStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p(Ljava/io/IOException;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n6f;->d:Ll/p6f;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/p6f;->h()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/n6f;->e:Ll/o6f;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/o6f;->connection()Ll/imc0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p1}, Ll/imc0;->x(Ljava/io/IOException;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public q()V
    .locals 6

    .line 1
    const/4 v4, 0x1

    .line 2
    const/4 v5, 0x0

    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    const/4 v3, 0x1

    .line 6
    move-object v0, p0

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/n6f;->a(JZZLjava/io/IOException;)Ljava/io/IOException;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r(Ll/x1d0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 2
    .line 3
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/t4f;->requestHeadersStart(Ll/ry3;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/n6f;->e:Ll/o6f;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ll/o6f;->d(Ll/x1d0;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 14
    .line 15
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Ll/t4f;->requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p1

    .line 22
    iget-object v0, p0, Ll/n6f;->c:Ll/t4f;

    .line 23
    .line 24
    iget-object v1, p0, Ll/n6f;->b:Ll/ry3;

    .line 25
    .line 26
    invoke-virtual {v0, v1, p1}, Ll/t4f;->requestFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/n6f;->p(Ljava/io/IOException;)V

    .line 30
    .line 31
    .line 32
    throw p1
.end method
