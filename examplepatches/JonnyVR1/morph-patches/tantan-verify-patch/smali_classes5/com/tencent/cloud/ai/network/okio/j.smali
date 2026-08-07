.class public Lcom/tencent/cloud/ai/network/okio/j;
.super Lcom/tencent/cloud/ai/network/okio/x;
.source "SourceFile"


# instance fields
.field public e:Lcom/tencent/cloud/ai/network/okio/x;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okio/x;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "delegate == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    throw p0
.end method


# virtual methods
.method public a()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->a()Lcom/tencent/cloud/ai/network/okio/x;

    move-result-object p0

    return-object p0
.end method

.method public a(J)Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/x;->a(J)Lcom/tencent/cloud/ai/network/okio/x;

    move-result-object p0

    return-object p0
.end method

.method public a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->b()Lcom/tencent/cloud/ai/network/okio/x;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->c()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->f()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method
