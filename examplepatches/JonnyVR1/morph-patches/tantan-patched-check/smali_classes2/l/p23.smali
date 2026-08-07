.class public Ll/p23;
.super Ll/dv10;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dv10<",
        "Landroid/util/Pair<",
        "Ll/by3;",
        "Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;",
        ">;",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final f:Ll/cy3;


# direct methods
.method public constructor <init>(Ll/cy3;Ll/wk90;)V
    .locals 2

    .line 1
    const-string v0, "BitmapMemoryCacheKeyMultiplexProducer"

    .line 2
    .line 3
    const-string v1, "multiplex_bmp_cnt"

    .line 4
    .line 5
    invoke-direct {p0, p2, v0, v1}, Ll/dv10;-><init>(Ll/wk90;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/p23;->f:Ll/cy3;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic g(Ljava/io/Closeable;)Ljava/io/Closeable;
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p23;->l(Ll/fb5;)Ll/fb5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic j(Ll/yk90;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p23;->m(Ll/yk90;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/fb5;)Ll/fb5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)",
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Ll/yk90;)Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/yk90;",
            ")",
            "Landroid/util/Pair<",
            "Ll/by3;",
            "Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p23;->f:Ll/cy3;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p1}, Ll/yk90;->k()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {p0, v0, v1}, Ll/cy3;->c(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p1}, Ll/yk90;->I()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
