.class public Ll/rg60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rg60$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/cy3;

.field public final c:Ll/fj80;

.field public final d:Ll/wq3;

.field public final e:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/a7h0;Ll/cy3;Ll/fj80;Ll/wq3;Ll/wk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;",
            "Ll/cy3;",
            "Ll/fj80;",
            "Ll/wq3;",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rg60;->a:Ll/a7h0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rg60;->b:Ll/cy3;

    .line 7
    .line 8
    iput-object p3, p0, Ll/rg60;->c:Ll/fj80;

    .line 9
    .line 10
    iput-object p4, p0, Ll/rg60;->d:Ll/wq3;

    .line 11
    .line 12
    iput-object p5, p0, Ll/rg60;->e:Ll/wk90;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic c(Ll/rg60;Ll/z06;Ll/yk90;Ll/by3;Ll/n0f;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rg60;->i(Ll/z06;Ll/yk90;Ll/by3;Ll/n0f;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/ini0;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/rg60;->g(Ll/ini0;)Z

    move-result p0

    return p0
.end method

.method public static e(Lcom/facebook/imagepipeline/request/ImageRequest;)Landroid/net/Uri;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "fresco_partial"

    .line 10
    .line 11
    const-string v1, "true"

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static f(Ll/cl90;Ll/yk90;ZI)Ljava/util/Map;
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cl90;",
            "Ll/yk90;",
            "ZI)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "PartialDiskCacheProducer"

    .line 2
    .line 3
    invoke-interface {p0, p1, v0}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "cached_value_found"

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string p2, "encodedImageSize"

    .line 20
    .line 21
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    invoke-static {p0, p1, p2, p3}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p0, p1}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method private static g(Ll/ini0;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ini0<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ini0;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ini0;->n()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ini0;->i()Ljava/lang/Exception;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of p0, p0, Ljava/util/concurrent/CancellationException;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method private j(Ljava/util/concurrent/atomic/AtomicBoolean;Ll/yk90;)V
    .locals 1

    .line 1
    new-instance v0, Ll/rg60$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/rg60$b;-><init>(Ll/rg60;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2, v0}, Ll/yk90;->q(Ll/zk90;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 7
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
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/16 v2, 0x10

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/16 v3, 0x20

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/rg60;->e:Ll/wk90;

    .line 30
    .line 31
    invoke-interface {p0, p1, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "PartialDiskCacheProducer"

    .line 40
    .line 41
    invoke-interface {v2, p2, v3}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Ll/rg60;->e(Lcom/facebook/imagepipeline/request/ImageRequest;)Landroid/net/Uri;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object v5, p0, Ll/rg60;->b:Ll/cy3;

    .line 49
    .line 50
    invoke-interface {p2}, Ll/yk90;->k()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-interface {v5, v0, v4, v6}, Ll/cy3;->d(Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/net/Uri;Ljava/lang/Object;)Ll/by3;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/4 v4, 0x0

    .line 59
    if-nez v1, :cond_1

    .line 60
    .line 61
    invoke-static {v2, p2, v4, v4}, Ll/rg60;->f(Ll/cl90;Ll/yk90;ZI)Ljava/util/Map;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v2, p2, v3, v1}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 66
    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/rg60;->i(Ll/z06;Ll/yk90;Ll/by3;Ll/n0f;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 74
    .line 75
    invoke-direct {v1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 76
    .line 77
    .line 78
    iget-object v2, p0, Ll/rg60;->a:Ll/a7h0;

    .line 79
    .line 80
    invoke-interface {v2}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ll/g4e;

    .line 85
    .line 86
    invoke-interface {v2}, Ll/g4e;->c()Ll/mh3;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v2, v0, v1}, Ll/mh3;->g(Ll/by3;Ljava/util/concurrent/atomic/AtomicBoolean;)Ll/ini0;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {p0, p1, p2, v0}, Ll/rg60;->h(Ll/z06;Ll/yk90;Ll/by3;)Ll/u26;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {v2, p1}, Ll/ini0;->e(Ll/u26;)Ll/ini0;

    .line 99
    .line 100
    .line 101
    invoke-direct {p0, v1, p2}, Ll/rg60;->j(Ljava/util/concurrent/atomic/AtomicBoolean;Ll/yk90;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final h(Ll/z06;Ll/yk90;Ll/by3;)Ll/u26;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            "Ll/by3;",
            ")",
            "Ll/u26<",
            "Ll/n0f;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    new-instance v0, Ll/rg60$a;

    .line 6
    .line 7
    move-object v1, p0

    .line 8
    move-object v4, p1

    .line 9
    move-object v3, p2

    .line 10
    move-object v5, p3

    .line 11
    invoke-direct/range {v0 .. v5}, Ll/rg60$a;-><init>(Ll/rg60;Ll/cl90;Ll/yk90;Ll/z06;Ll/by3;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final i(Ll/z06;Ll/yk90;Ll/by3;Ll/n0f;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            "Ll/by3;",
            "Ll/n0f;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rg60$c;

    .line 2
    .line 3
    iget-object v2, p0, Ll/rg60;->a:Ll/a7h0;

    .line 4
    .line 5
    iget-object v4, p0, Ll/rg60;->c:Ll/fj80;

    .line 6
    .line 7
    iget-object v5, p0, Ll/rg60;->d:Ll/wq3;

    .line 8
    .line 9
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/16 v3, 0x20

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    const/4 v8, 0x0

    .line 20
    move-object v1, p1

    .line 21
    move-object v3, p3

    .line 22
    move-object v6, p4

    .line 23
    invoke-direct/range {v0 .. v8}, Ll/rg60$c;-><init>(Ll/z06;Ll/a7h0;Ll/by3;Ll/fj80;Ll/wq3;Ll/n0f;ZLl/sg60;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/rg60;->e:Ll/wk90;

    .line 27
    .line 28
    invoke-interface {p0, v0, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
