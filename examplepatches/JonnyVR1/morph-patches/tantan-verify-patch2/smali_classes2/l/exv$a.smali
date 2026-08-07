.class public Ll/exv$a;
.super Ll/z3g0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/exv;->b(Ll/z06;Ll/yk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/z3g0<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic f:Ll/cl90;

.field public final synthetic g:Ll/yk90;

.field public final synthetic h:Lcom/facebook/imagepipeline/request/ImageRequest;

.field public final synthetic i:Ll/exv;


# direct methods
.method public constructor <init>(Ll/exv;Ll/z06;Ll/cl90;Ll/yk90;Ljava/lang/String;Ll/cl90;Ll/yk90;Lcom/facebook/imagepipeline/request/ImageRequest;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/exv$a;->i:Ll/exv;

    .line 2
    .line 3
    iput-object p6, p0, Ll/exv$a;->f:Ll/cl90;

    .line 4
    .line 5
    iput-object p7, p0, Ll/exv$a;->g:Ll/yk90;

    .line 6
    .line 7
    iput-object p8, p0, Ll/exv$a;->h:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 8
    .line 9
    invoke-direct {p0, p2, p3, p4, p5}, Ll/z3g0;-><init>(Ll/z06;Ll/cl90;Ll/yk90;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/exv$a;->j(Ll/fb5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/exv$a;->l()Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Ljava/lang/Exception;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/z3g0;->e(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/exv$a;->f:Ll/cl90;

    .line 5
    .line 6
    iget-object v0, p0, Ll/exv$a;->g:Ll/yk90;

    .line 7
    .line 8
    const-string v1, "VideoThumbnailProducer"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-interface {p1, v0, v1, v2}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/exv$a;->g:Ll/yk90;

    .line 15
    .line 16
    const-string p1, "local"

    .line 17
    .line 18
    const-string v0, "video"

    .line 19
    .line 20
    invoke-interface {p0, p1, v0}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic f(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/exv$a;->m(Ll/fb5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/exv$a;->k(Ll/fb5;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j(Ll/fb5;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Ll/fb5;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "createdThumbnail"

    .line 11
    .line 12
    invoke-static {p1, p0}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public l()Ll/fb5;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/exv$a;->i:Ll/exv;

    .line 3
    .line 4
    iget-object v2, p0, Ll/exv$a;->h:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 5
    .line 6
    invoke-static {v1, v2}, Ll/exv;->d(Ll/exv;Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    move-object v1, v0

    .line 12
    :goto_0
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Ll/exv$a;->h:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 15
    .line 16
    invoke-static {v2}, Ll/exv;->e(Lcom/facebook/imagepipeline/request/ImageRequest;)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-static {v1, v2}, Landroid/media/ThumbnailUtils;->createVideoThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    move-object v1, v0

    .line 26
    :goto_1
    if-nez v1, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Ll/exv$a;->i:Ll/exv;

    .line 29
    .line 30
    invoke-static {v1}, Ll/exv;->c(Ll/exv;)Landroid/content/ContentResolver;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Ll/exv$a;->h:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v1, v2}, Ll/exv;->f(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :cond_1
    if-nez v1, :cond_2

    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_2
    invoke-static {}, Ll/qof0;->a()Ll/qof0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget-object v2, Ll/anm;->d:Ll/qvb0;

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    invoke-static {v1, v0, v2, v3}, Ll/ib5;->w(Landroid/graphics/Bitmap;Ll/w4d0;Ll/qvb0;I)Ll/ib5;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Ll/exv$a;->g:Ll/yk90;

    .line 59
    .line 60
    const-string v2, "image_format"

    .line 61
    .line 62
    const-string v3, "thumbnail"

    .line 63
    .line 64
    invoke-interface {v1, v2, v3}, Ll/lyk;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Ll/exv$a;->g:Ll/yk90;

    .line 68
    .line 69
    invoke-interface {p0}, Ll/lyk;->getExtras()Ljava/util/Map;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {v0, p0}, Ll/lyk;->d(Ljava/util/Map;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0}, Ll/fb5;->S(Ljava/io/Closeable;)Ll/fb5;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method public m(Ll/fb5;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/z3g0;->f(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/exv$a;->f:Ll/cl90;

    .line 5
    .line 6
    iget-object v1, p0, Ll/exv$a;->g:Ll/yk90;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    const-string v2, "VideoThumbnailProducer"

    .line 14
    .line 15
    invoke-interface {v0, v1, v2, p1}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/exv$a;->g:Ll/yk90;

    .line 19
    .line 20
    const-string p1, "local"

    .line 21
    .line 22
    const-string v0, "video"

    .line 23
    .line 24
    invoke-interface {p0, p1, v0}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
