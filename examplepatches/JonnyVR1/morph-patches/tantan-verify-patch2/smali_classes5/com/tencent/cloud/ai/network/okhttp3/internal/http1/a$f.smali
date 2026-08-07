.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;
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
    name = "f"
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/j;

.field public b:Z

.field public final synthetic c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

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
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->b:Z

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
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->b:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;Lcom/tencent/cloud/ai/network/okio/j;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 20
    .line 21
    return-void
.end method

.method public flush()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v1, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 6
    .line 7
    const-wide/16 v3, 0x0

    .line 8
    .line 9
    move-wide v5, p2

    .line 10
    invoke-static/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(JJJ)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 16
    .line 17
    invoke-interface {p0, p1, v5, v6}, Lcom/tencent/cloud/ai/network/okio/v;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "closed"

    .line 22
    .line 23
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
