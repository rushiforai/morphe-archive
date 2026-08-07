.class public final Lcom/tencent/cloud/ai/network/okio/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/f;


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/e;

.field public final b:Lcom/tencent/cloud/ai/network/okio/v;

.field public c:Z


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/v;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "sink == null"

    .line 17
    .line 18
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    throw p0
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/w;)J
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 4
    .line 5
    move-object v3, p1

    .line 6
    check-cast v3, Lcom/tencent/cloud/ai/network/okio/n$a;

    .line 7
    .line 8
    const-wide/16 v4, 0x2000

    .line 9
    .line 10
    invoke-virtual {v3, v2, v4, v5}, Lcom/tencent/cloud/ai/network/okio/n$a;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    const-wide/16 v4, -0x1

    .line 15
    .line 16
    cmp-long v4, v2, v4

    .line 17
    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    add-long/2addr v0, v2

    .line 21
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-wide v0
.end method

.method public a()Lcom/tencent/cloud/ai/network/okio/e;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    return-object p0
.end method

.method public a(I)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 43
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    if-nez v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->g(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 45
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object p0

    return-object p0

    .line 46
    :cond_0
    const-string p0, "closed"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 26
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    if-nez v0, :cond_0

    .line 27
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->b(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/e;

    .line 28
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object p0

    return-object p0

    .line 29
    :cond_0
    const-string p0, "closed"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 30
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    if-nez v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/e;

    .line 32
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object p0

    return-object p0

    .line 33
    :cond_0
    const-string p0, "closed"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a([B)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 34
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    if-nez v0, :cond_0

    .line 35
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->b([B)Lcom/tencent/cloud/ai/network/okio/e;

    .line 36
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object p0

    return-object p0

    .line 37
    :cond_0
    const-string p0, "closed"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a([BII)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 38
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    if-nez v0, :cond_0

    .line 39
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->b([BII)Lcom/tencent/cloud/ai/network/okio/e;

    .line 40
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object p0

    return-object p0

    .line 41
    :cond_0
    const-string p0, "closed"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public b(I)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->f(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "closed"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public c(I)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "closed"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public close()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_3

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    :try_start_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 8
    .line 9
    iget-wide v2, v1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 10
    .line 11
    const-wide/16 v4, 0x0

    .line 12
    .line 13
    cmp-long v4, v2, v4

    .line 14
    .line 15
    if-lez v4, :cond_1

    .line 16
    .line 17
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 18
    .line 19
    invoke-interface {v4, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/v;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    move-object v1, v0

    .line 26
    :goto_1
    :try_start_1
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 27
    .line 28
    invoke-interface {v2}, Lcom/tencent/cloud/ai/network/okio/v;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 29
    .line 30
    .line 31
    goto :goto_2

    .line 32
    :catchall_1
    move-exception v2

    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    move-object v1, v2

    .line 36
    :cond_2
    :goto_2
    const/4 v2, 0x1

    .line 37
    iput-boolean v2, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 38
    .line 39
    if-nez v1, :cond_3

    .line 40
    .line 41
    :goto_3
    return-void

    .line 42
    :cond_3
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okio/y;->a(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public e(J)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->j(J)Lcom/tencent/cloud/ai/network/okio/e;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "closed"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public f()Lcom/tencent/cloud/ai/network/okio/f;
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->l()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-lez v2, :cond_0

    .line 16
    .line 17
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 18
    .line 19
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 20
    .line 21
    invoke-interface {v2, v3, v0, v1}, Lcom/tencent/cloud/ai/network/okio/v;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object p0

    .line 25
    :cond_1
    const-string p0, "closed"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public flush()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    iget-wide v1, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v3, v1, v3

    .line 12
    .line 13
    if-lez v3, :cond_0

    .line 14
    .line 15
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 16
    .line 17
    invoke-interface {v3, v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/v;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 21
    .line 22
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/v;->flush()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const-string p0, "closed"

    .line 27
    .line 28
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public i()Lcom/tencent/cloud/ai/network/okio/f;
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    iget-wide v1, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v3, v1, v3

    .line 12
    .line 13
    if-lez v3, :cond_0

    .line 14
    .line 15
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 16
    .line 17
    invoke-interface {v3, v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/v;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p0

    .line 21
    :cond_1
    const-string p0, "closed"

    .line 22
    .line 23
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public isOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/v;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "buffer("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/q;->b:Lcom/tencent/cloud/ai/network/okio/v;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, ")"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->write(Ljava/nio/ByteBuffer;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    .line 12
    .line 13
    .line 14
    return p1

    .line 15
    :cond_0
    const-string p0, "closed"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 1

    .line 22
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    if-nez v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 24
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;

    return-void

    .line 25
    :cond_0
    const-string p0, "closed"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-void
.end method
