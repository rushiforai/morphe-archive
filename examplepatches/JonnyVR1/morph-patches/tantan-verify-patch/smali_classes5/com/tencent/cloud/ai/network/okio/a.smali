.class public Lcom/tencent/cloud/ai/network/okio/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/v;


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okio/v;

.field public final synthetic b:Lcom/tencent/cloud/ai/network/okio/c;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/c;Lcom/tencent/cloud/ai/network/okio/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okio/a;->a:Lcom/tencent/cloud/ai/network/okio/v;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/c;->h()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/a;->a:Lcom/tencent/cloud/ai/network/okio/v;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/v;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :catch_0
    move-exception v0

    .line 21
    :try_start_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okio/c;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_0
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    :goto_1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 39
    .line 40
    .line 41
    throw v0
.end method

.method public flush()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/c;->h()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/a;->a:Lcom/tencent/cloud/ai/network/okio/v;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/v;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :catch_0
    move-exception v0

    .line 21
    :try_start_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okio/c;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_0
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    :goto_1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 39
    .line 40
    .line 41
    throw v0
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AsyncTimeout.sink("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/a;->a:Lcom/tencent/cloud/ai/network/okio/v;

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

.method public write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 6

    .line 1
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    move-wide v4, p2

    .line 6
    invoke-static/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 7
    .line 8
    .line 9
    :goto_0
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    cmp-long v2, p2, v0

    .line 12
    .line 13
    if-lez v2, :cond_3

    .line 14
    .line 15
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 16
    .line 17
    :goto_1
    const-wide/32 v3, 0x10000

    .line 18
    .line 19
    .line 20
    cmp-long v3, v0, v3

    .line 21
    .line 22
    if-gez v3, :cond_1

    .line 23
    .line 24
    iget v3, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 25
    .line 26
    iget v4, v2, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 27
    .line 28
    sub-int/2addr v3, v4

    .line 29
    int-to-long v3, v3

    .line 30
    add-long/2addr v0, v3

    .line 31
    cmp-long v3, v0, p2

    .line 32
    .line 33
    if-ltz v3, :cond_0

    .line 34
    .line 35
    move-wide v0, p2

    .line 36
    goto :goto_2

    .line 37
    :cond_0
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_2
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 41
    .line 42
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/c;->h()V

    .line 43
    .line 44
    .line 45
    :try_start_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/a;->a:Lcom/tencent/cloud/ai/network/okio/v;

    .line 46
    .line 47
    invoke-interface {v2, p1, v0, v1}, Lcom/tencent/cloud/ai/network/okio/v;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    sub-long/2addr p2, v0

    .line 51
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    move-object p1, v0

    .line 60
    goto :goto_4

    .line 61
    :catch_0
    move-exception v0

    .line 62
    move-object p1, v0

    .line 63
    :try_start_1
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    if-nez p3, :cond_2

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_2
    invoke-virtual {p2, p1}, Lcom/tencent/cloud/ai/network/okio/c;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    :goto_3
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    :goto_4
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/a;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 78
    .line 79
    const/4 p2, 0x0

    .line 80
    invoke-virtual {p0, p2}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 81
    .line 82
    .line 83
    throw p1

    .line 84
    :cond_3
    return-void
.end method
