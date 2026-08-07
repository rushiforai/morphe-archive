.class public Lcom/tencent/cloud/ai/network/okio/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/w;


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okio/w;

.field public final synthetic b:Lcom/tencent/cloud/ai/network/okio/c;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/c;Lcom/tencent/cloud/ai/network/okio/w;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okio/b;->a:Lcom/tencent/cloud/ai/network/okio/w;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/c;->h()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/b;->a:Lcom/tencent/cloud/ai/network/okio/w;

    .line 7
    .line 8
    invoke-interface {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 9
    .line 10
    .line 11
    move-result-wide p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 13
    .line 14
    const/4 p3, 0x1

    .line 15
    invoke-virtual {p0, p3}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 16
    .line 17
    .line 18
    return-wide p1

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :catch_0
    move-exception p1

    .line 22
    :try_start_1
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    if-nez p3, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p2, p1}, Lcom/tencent/cloud/ai/network/okio/c;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    :goto_0
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    :goto_1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 37
    .line 38
    const/4 p2, 0x0

    .line 39
    invoke-virtual {p0, p2}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 40
    .line 41
    .line 42
    throw p1
.end method

.method public close()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/b;->a:Lcom/tencent/cloud/ai/network/okio/w;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/w;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :catch_0
    move-exception v0

    .line 16
    :try_start_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okio/c;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_0
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    :goto_1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/c;->a(Z)V

    .line 34
    .line 35
    .line 36
    throw v0
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/b;->b:Lcom/tencent/cloud/ai/network/okio/c;

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
    const-string v1, "AsyncTimeout.source("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/b;->a:Lcom/tencent/cloud/ai/network/okio/w;

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
