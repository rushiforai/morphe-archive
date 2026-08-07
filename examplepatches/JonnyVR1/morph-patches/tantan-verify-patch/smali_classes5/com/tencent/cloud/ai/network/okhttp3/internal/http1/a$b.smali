.class public abstract Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/w;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "b"
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/j;

.field public b:Z

.field public final synthetic c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/j;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)Lcom/tencent/cloud/ai/network/okio/g;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {v0, p1}, Lcom/tencent/cloud/ai/network/okio/j;-><init>(Lcom/tencent/cloud/ai/network/okio/x;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 20
    .line 21
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$a;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->c:Lcom/tencent/cloud/ai/network/okio/g;

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-wide p0

    .line 10
    :catch_0
    move-exception p1

    .line 11
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->k()V

    .line 19
    .line 20
    .line 21
    throw p1
.end method

.method public final k()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 2
    .line 3
    iget v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 4
    .line 5
    const/4 v2, 0x6

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v3, 0x5

    .line 10
    if-ne v1, v3, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;Lcom/tencent/cloud/ai/network/okio/j;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 18
    .line 19
    iput v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 23
    .line 24
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 25
    .line 26
    const-string v0, "state: "

    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->a:Lcom/tencent/cloud/ai/network/okio/j;

    .line 2
    .line 3
    return-object p0
.end method
