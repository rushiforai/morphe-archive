.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i$a;
    }
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/a;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/Call;

.field public final d:Lcom/tencent/cloud/ai/network/okhttp3/m;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field

.field public f:I

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/InetSocketAddress;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/s;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/a;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;Lcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->e:Ljava/util/List;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->g:Ljava/util/List;

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->h:Ljava/util/List;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

    .line 20
    .line 21
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->c:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 22
    .line 23
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/a;->b()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/a;->a()Ljava/net/Proxy;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p2, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Ljava/net/Proxy;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final a(Lcom/tencent/cloud/ai/network/okhttp3/p;Ljava/net/Proxy;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->e:Ljava/util/List;

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/a;->g:Ljava/net/ProxySelector;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->g()Ljava/net/URI;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p2, p1}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/util/List;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 36
    .line 37
    filled-new-array {p1}, [Ljava/net/Proxy;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, [Ljava/lang/Object;

    .line 46
    .line 47
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    :goto_0
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->e:Ljava/util/List;

    .line 56
    .line 57
    :goto_1
    const/4 p1, 0x0

    .line 58
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->f:I

    .line 59
    .line 60
    return-void
.end method

.method public final a()Z
    .locals 1

    .line 61
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->f:I

    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/i;->e:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-ge v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
