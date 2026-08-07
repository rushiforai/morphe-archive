.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/w;


# instance fields
.field public a:Z

.field public final synthetic b:Lcom/tencent/cloud/ai/network/okio/g;

.field public final synthetic c:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;

.field public final synthetic d:Lcom/tencent/cloud/ai/network/okio/f;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;Lcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;Lcom/tencent/cloud/ai/network/okio/f;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 8

    .line 1
    const/4 v1, 0x1

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 3
    .line 4
    invoke-interface {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 5
    .line 6
    .line 7
    move-result-wide v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    const-wide/16 p2, -0x1

    .line 9
    .line 10
    cmp-long v0, v6, p2

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->a:Z

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->a:Z

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 21
    .line 22
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/v;->close()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-wide p2

    .line 26
    :cond_1
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 27
    .line 28
    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okio/f;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    iget-wide p2, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 33
    .line 34
    sub-long v4, p2, v6

    .line 35
    .line 36
    move-object v2, p1

    .line 37
    invoke-virtual/range {v2 .. v7}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)Lcom/tencent/cloud/ai/network/okio/e;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 41
    .line 42
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/f;->f()Lcom/tencent/cloud/ai/network/okio/f;

    .line 43
    .line 44
    .line 45
    return-wide v6

    .line 46
    :catch_0
    move-exception v0

    .line 47
    move-object p1, v0

    .line 48
    iget-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->a:Z

    .line 49
    .line 50
    if-nez p2, :cond_2

    .line 51
    .line 52
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->a:Z

    .line 53
    .line 54
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;

    .line 55
    .line 56
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;->b()V

    .line 57
    .line 58
    .line 59
    :cond_2
    throw p1
.end method

.method public close()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    const/16 v1, 0x64

    .line 8
    .line 9
    invoke-static {p0, v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Lcom/tencent/cloud/ai/network/okio/w;ILjava/util/concurrent/TimeUnit;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->a:Z

    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;

    .line 19
    .line 20
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;->b()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 24
    .line 25
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->close()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
