.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/b;
.source "SourceFile"


# instance fields
.field public final synthetic b:I

.field public final synthetic c:Lcom/tencent/cloud/ai/network/okio/e;

.field public final synthetic d:I

.field public final synthetic e:Z

.field public final synthetic f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;


# direct methods
.method public varargs constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Ljava/lang/String;[Ljava/lang/Object;ILcom/tencent/cloud/ai/network/okio/e;IZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 2
    .line 3
    iput p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->b:I

    .line 4
    .line 5
    iput-object p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->c:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    iput p6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->d:I

    .line 8
    .line 9
    iput-boolean p7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->e:Z

    .line 10
    .line 11
    invoke-direct {p0, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/t;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->c:Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->d:I

    .line 8
    .line 9
    check-cast v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/t$a;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    int-to-long v2, v2

    .line 14
    invoke-virtual {v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/e;->d(J)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    .line 20
    .line 21
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->b:I

    .line 22
    .line 23
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 29
    .line 30
    monitor-enter v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    :try_start_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->x:Ljava/util/Set;

    .line 34
    .line 35
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;->b:I

    .line 36
    .line 37
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    monitor-exit v0

    .line 45
    return-void

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    :try_start_2
    throw p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    throw p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 51
    :catch_0
    return-void
.end method
