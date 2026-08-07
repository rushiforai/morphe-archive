.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;
.super Lcom/tencent/cloud/ai/network/okio/i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation


# instance fields
.field public final b:J

.field public c:J

.field public d:Z

.field public e:Z

.field public final synthetic f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;Lcom/tencent/cloud/ai/network/okio/w;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/tencent/cloud/ai/network/okio/i;-><init>(Lcom/tencent/cloud/ai/network/okio/w;)V

    .line 4
    .line 5
    .line 6
    iput-wide p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->b:J

    .line 7
    .line 8
    const-wide/16 p1, 0x0

    .line 9
    .line 10
    cmp-long p1, p3, p1

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 8

    .line 1
    const-string v0, "expected "

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->e:Z

    .line 4
    .line 5
    if-nez v1, :cond_4

    .line 6
    .line 7
    :try_start_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/i;->a:Lcom/tencent/cloud/ai/network/okio/w;

    .line 8
    .line 9
    invoke-interface {v1, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    const-wide/16 v1, -0x1

    .line 14
    .line 15
    cmp-long p3, p1, v1

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-nez p3, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 21
    .line 22
    .line 23
    return-wide v1

    .line 24
    :catch_0
    move-exception p1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget-wide v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->c:J

    .line 27
    .line 28
    add-long/2addr v4, p1

    .line 29
    iget-wide v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->b:J

    .line 30
    .line 31
    cmp-long p3, v6, v1

    .line 32
    .line 33
    if-eqz p3, :cond_2

    .line 34
    .line 35
    cmp-long p3, v4, v6

    .line 36
    .line 37
    if-gtz p3, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    new-instance p1, Ljava/net/ProtocolException;

    .line 41
    .line 42
    new-instance p2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->b:J

    .line 48
    .line 49
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p3, " bytes but received "

    .line 53
    .line 54
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p1

    .line 68
    :cond_2
    :goto_0
    iput-wide v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->c:J

    .line 69
    .line 70
    cmp-long p3, v4, v6

    .line 71
    .line 72
    if-nez p3, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->a(Ljava/io/IOException;)Ljava/io/IOException;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    :cond_3
    return-wide p1

    .line 78
    :goto_1
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    throw p0

    .line 83
    :cond_4
    const-string p0, "closed"

    .line 84
    .line 85
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const-wide/16 p0, 0x0

    .line 89
    .line 90
    return-wide p0
.end method

.method public a(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 7

    .line 91
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->d:Z

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    const/4 v0, 0x1

    .line 92
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->d:Z

    .line 93
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->c:J

    const/4 v4, 0x1

    const/4 v5, 0x0

    move-object v6, p1

    invoke-virtual/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(JZZLjava/io/IOException;)Ljava/io/IOException;

    move-result-object p0

    return-object p0
.end method

.method public close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->e:Z

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
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->e:Z

    .line 8
    .line 9
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/i;->a:Lcom/tencent/cloud/ai/network/okio/w;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/w;->close()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->a(Ljava/io/IOException;)Ljava/io/IOException;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception v0

    .line 20
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    throw p0
.end method
