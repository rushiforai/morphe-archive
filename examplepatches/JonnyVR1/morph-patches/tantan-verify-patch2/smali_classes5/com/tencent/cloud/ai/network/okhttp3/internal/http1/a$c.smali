.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/v;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/j;

.field public b:Z

.field public final synthetic c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/j;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/tencent/cloud/ai/network/okio/v;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {v0, p1}, Lcom/tencent/cloud/ai/network/okio/j;-><init>(Lcom/tencent/cloud/ai/network/okio/x;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    :try_start_1
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->b:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 14
    .line 15
    const-string v1, "0\r\n\r\n"

    .line 16
    .line 17
    invoke-interface {v0, v1}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;Lcom/tencent/cloud/ai/network/okio/j;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    iput v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    throw v0
.end method

.method public declared-synchronized flush()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 11
    .line 12
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 19
    throw v0
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long v0, p2, v0

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 15
    .line 16
    invoke-interface {v0, p2, p3}, Lcom/tencent/cloud/ai/network/okio/f;->e(J)Lcom/tencent/cloud/ai/network/okio/f;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 22
    .line 23
    const-string v1, "\r\n"

    .line 24
    .line 25
    invoke-interface {v0, v1}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 31
    .line 32
    invoke-interface {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/v;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 38
    .line 39
    invoke-interface {p0, v1}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const-string p0, "closed"

    .line 44
    .line 45
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
