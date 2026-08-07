.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;
.super Lcom/tencent/cloud/ai/network/okio/h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public b:Z

.field public c:J

.field public d:J

.field public e:Z

.field public final synthetic f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;Lcom/tencent/cloud/ai/network/okio/v;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/tencent/cloud/ai/network/okio/h;-><init>(Lcom/tencent/cloud/ai/network/okio/v;)V

    .line 4
    .line 5
    .line 6
    iput-wide p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->c:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->b:Z

    .line 8
    .line 9
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 10
    .line 11
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->d:J

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x1

    .line 15
    move-object v6, p1

    .line 16
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(JZZLjava/io/IOException;)Ljava/io/IOException;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public close()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->e:Z

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->c:J

    .line 10
    .line 11
    const-wide/16 v2, -0x1

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->d:J

    .line 18
    .line 19
    cmp-long v0, v2, v0

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p0, "unexpected end of stream"

    .line 25
    .line 26
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/h;->a:Lcom/tencent/cloud/ai/network/okio/v;

    .line 31
    .line 32
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/v;->close()V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->a(Ljava/io/IOException;)Ljava/io/IOException;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    throw p0
.end method

.method public flush()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/h;->a:Lcom/tencent/cloud/ai/network/okio/v;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/v;->flush()V
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
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    throw p0
.end method

.method public write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->c:J

    .line 6
    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->d:J

    .line 14
    .line 15
    add-long/2addr v2, p2

    .line 16
    cmp-long v0, v2, v0

    .line 17
    .line 18
    if-gtz v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance p1, Ljava/net/ProtocolException;

    .line 22
    .line 23
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->c:J

    .line 24
    .line 25
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->d:J

    .line 26
    .line 27
    add-long/2addr v2, p2

    .line 28
    new-instance p0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string p2, "expected "

    .line 31
    .line 32
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p2, " bytes but received "

    .line 39
    .line 40
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {p1, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p1

    .line 54
    :cond_1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/h;->a:Lcom/tencent/cloud/ai/network/okio/v;

    .line 55
    .line 56
    invoke-interface {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/v;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 57
    .line 58
    .line 59
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->d:J

    .line 60
    .line 61
    add-long/2addr v0, p2

    .line 62
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->d:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    return-void

    .line 65
    :catch_0
    move-exception p1

    .line 66
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    throw p0

    .line 71
    :cond_2
    const-string p0, "closed"

    .line 72
    .line 73
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
