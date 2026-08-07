.class public abstract Ll/nvv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ll/fj80;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ll/fj80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nvv;->a:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nvv;->b:Ll/fj80;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    move-result-object v6

    .line 9
    const-string v0, "local"

    .line 10
    .line 11
    const-string v1, "fetch"

    .line 12
    .line 13
    invoke-interface {p2, v0, v1}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/nvv$a;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/nvv;->f()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    move-object v7, v3

    .line 23
    move-object v8, p2

    .line 24
    move-object v1, p0

    .line 25
    move-object v2, p1

    .line 26
    move-object v4, p2

    .line 27
    invoke-direct/range {v0 .. v8}, Ll/nvv$a;-><init>(Ll/nvv;Ll/z06;Ll/cl90;Ll/yk90;Ljava/lang/String;Lcom/facebook/imagepipeline/request/ImageRequest;Ll/cl90;Ll/yk90;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/nvv$b;

    .line 31
    .line 32
    invoke-direct {p0, v1, v0}, Ll/nvv$b;-><init>(Ll/nvv;Ll/z3g0;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v4, p0}, Ll/yk90;->q(Ll/zk90;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, v1, Ll/nvv;->a:Ljava/util/concurrent/Executor;

    .line 39
    .line 40
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public c(Ljava/io/InputStream;I)Ll/n0f;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nvv;->b:Ll/fj80;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-gtz p2, :cond_0

    .line 5
    .line 6
    :try_start_0
    invoke-interface {p0, p1}, Ll/fj80;->a(Ljava/io/InputStream;)Lcom/facebook/common/memory/PooledByteBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/fb5;->S(Ljava/io/Closeable;)Ll/fb5;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    move-object v0, p0

    .line 15
    goto :goto_1

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_2

    .line 18
    :cond_0
    invoke-interface {p0, p1, p2}, Ll/fj80;->e(Ljava/io/InputStream;I)Lcom/facebook/common/memory/PooledByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/fb5;->S(Ljava/io/Closeable;)Ll/fb5;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    goto :goto_0

    .line 27
    :goto_1
    new-instance p0, Ll/n0f;

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ll/n0f;-><init>(Ll/fb5;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ll/lb5;->b(Ljava/io/InputStream;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :goto_2
    invoke-static {p1}, Ll/lb5;->b(Ljava/io/InputStream;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 43
    .line 44
    .line 45
    throw p0
.end method

.method public abstract d(Lcom/facebook/imagepipeline/request/ImageRequest;)Ll/n0f;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public e(Ljava/io/InputStream;I)Ll/n0f;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nvv;->c(Ljava/io/InputStream;I)Ll/n0f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract f()Ljava/lang/String;
.end method
