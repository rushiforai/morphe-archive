.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/b;
.source "SourceFile"


# instance fields
.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;


# direct methods
.method public varargs constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Ljava/lang/String;[Ljava/lang/Object;ILjava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 2
    .line 3
    iput p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;->b:I

    .line 4
    .line 5
    iput-object p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/t;

    .line 4
    .line 5
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;->b:I

    .line 6
    .line 7
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/t$a;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    .line 13
    .line 14
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 20
    .line 21
    monitor-enter v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :try_start_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->x:Ljava/util/Set;

    .line 25
    .line 26
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;->b:I

    .line 27
    .line 28
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 40
    :catch_0
    return-void
.end method
