.class public Ll/lq70;
.super Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder<",
        "Ll/lq70;",
        "Lcom/facebook/imagepipeline/request/ImageRequest;",
        "Ll/fb5<",
        "Ll/db5;",
        ">;",
        "Ll/qim;",
        ">;"
    }
.end annotation


# instance fields
.field public final t:Ll/rjm;

.field public final u:Ll/nq70;

.field public v:Lcom/facebook/common/internal/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;"
        }
    .end annotation
.end field

.field public w:Ll/gjm;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/nq70;Ll/rjm;Ljava/util/Set;Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/nq70;",
            "Ll/rjm;",
            "Ljava/util/Set<",
            "Ll/v36;",
            ">;",
            "Ljava/util/Set<",
            "Ll/u36;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p4, p5}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;-><init>(Landroid/content/Context;Ljava/util/Set;Ljava/util/Set;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/lq70;->t:Ll/rjm;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lq70;->u:Ll/nq70;

    .line 7
    .line 8
    return-void
.end method

.method public static H(Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;)Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;
    .locals 2

    .line 1
    sget-object v0, Ll/lq70$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq v0, v1, :cond_2

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    sget-object p0, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->BITMAP_MEMORY_CACHE:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    const-string v0, "Cache level"

    .line 22
    .line 23
    const-string v1, "is not supported. "

    .line 24
    .line 25
    invoke-static {v0, p0, v1}, Ll/xmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0

    .line 30
    :cond_1
    sget-object p0, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->DISK_CACHE:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    sget-object p0, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->FULL_FETCH:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 34
    .line 35
    return-object p0
.end method


# virtual methods
.method public final I()Ll/by3;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    iget-object v1, p0, Ll/lq70;->t:Ll/rjm;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/rjm;->o()Ll/cy3;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->m()Ll/fm80;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->f()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {v1, v0, p0}, Ll/cy3;->a(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->f()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {v1, v0, p0}, Ll/cy3;->c(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public J(Ll/lde;Ljava/lang/String;Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;)Ll/i6c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/lde;",
            "Ljava/lang/String;",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            "Ljava/lang/Object;",
            "Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;",
            ")",
            "Ll/i6c<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation

    .line 1
    move-object v0, p0

    .line 2
    iget-object p0, v0, Ll/lq70;->t:Ll/rjm;

    .line 3
    .line 4
    invoke-static {p5}, Ll/lq70;->H(Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;)Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 5
    .line 6
    .line 7
    move-result-object p5

    .line 8
    invoke-virtual {v0, p1}, Ll/lq70;->K(Ll/lde;)Ll/j2d0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    move-object v1, p4

    .line 13
    move-object p4, p1

    .line 14
    move-object p1, p3

    .line 15
    move-object p3, p5

    .line 16
    move-object p5, p2

    .line 17
    move-object p2, v1

    .line 18
    invoke-virtual/range {p0 .. p5}, Ll/rjm;->i(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;Ll/j2d0;Ljava/lang/String;)Ll/i6c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public K(Ll/lde;)Ll/j2d0;
    .locals 0

    .line 1
    instance-of p0, p1, Ll/kq70;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/kq70;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/kq70;->o0()Ll/j2d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public L()Ll/kq70;
    .locals 7

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "PipelineDraweeControllerBuilder#obtainController"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->p()Ll/lde;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->e()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    instance-of v1, v0, Ll/kq70;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    check-cast v0, Ll/kq70;

    .line 25
    .line 26
    :goto_0
    move-object v1, v0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object v0, p0, Ll/lq70;->u:Ll/nq70;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/nq70;->c()Ll/kq70;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_0

    .line 35
    :goto_1
    invoke-virtual {p0, v1, v3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->y(Ll/lde;Ljava/lang/String;)Ll/a7h0;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p0}, Ll/lq70;->I()Ll/by3;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->f()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    iget-object v6, p0, Ll/lq70;->v:Lcom/facebook/common/internal/ImmutableList;

    .line 48
    .line 49
    invoke-virtual/range {v1 .. v6}, Ll/kq70;->q0(Ll/a7h0;Ljava/lang/String;Ll/by3;Ljava/lang/Object;Lcom/facebook/common/internal/ImmutableList;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/lq70;->w:Ll/gjm;

    .line 53
    .line 54
    invoke-virtual {v1, v0, p0}, Ll/kq70;->r0(Ll/gjm;Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/i9j;->d()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    invoke-static {}, Ll/i9j;->b()V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-object v1

    .line 67
    :catchall_0
    move-exception v0

    .line 68
    move-object p0, v0

    .line 69
    invoke-static {}, Ll/i9j;->d()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    invoke-static {}, Ll/i9j;->b()V

    .line 76
    .line 77
    .line 78
    :cond_3
    throw p0
.end method

.method public M(Ll/gjm;)Ll/lq70;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lq70;->w:Ll/gjm;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->r()Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/lq70;

    .line 8
    .line 9
    return-object p0
.end method

.method public N(Landroid/net/Uri;)Ll/lq70;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-super {p0, p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ll/lq70;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->y(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Ll/qmd0;->e()Ll/qmd0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->Q(Ll/qmd0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-super {p0, p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ll/lq70;

    .line 32
    .line 33
    return-object p0
.end method

.method public O(Ljava/lang/String;)Ll/lq70;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/lq70;->N(Landroid/net/Uri;)Ll/lq70;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->b(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-super {p0, p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/lq70;

    .line 28
    .line 29
    return-object p0
.end method

.method public bridge synthetic a(Landroid/net/Uri;)Ll/xof0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lq70;->N(Landroid/net/Uri;)Ll/lq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i(Ll/lde;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;)Ll/i6c;
    .locals 0

    .line 1
    check-cast p3, Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/lq70;->J(Ll/lde;Ljava/lang/String;Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder$CacheLevel;)Ll/i6c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic x()Ll/c7;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lq70;->L()Ll/kq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
