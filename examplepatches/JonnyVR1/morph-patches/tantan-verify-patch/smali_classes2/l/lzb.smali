.class public Ll/lzb;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/xl90;)Ll/wk90;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            "Ll/xl90;",
            ")",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/xl90;Ll/bl90;Ll/oxi0;ZZ)Ll/wk90;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            "Ll/xl90;",
            "Ll/bl90;",
            "Ll/oxi0;",
            "ZZ)",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lzb;->a(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/xl90;)Ll/wk90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/xl90;Ll/bl90;Ll/oxi0;)Ll/wk90;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            "Ll/xl90;",
            "Ll/bl90;",
            "Ll/oxi0;",
            ")",
            "Ll/wk90<",
            "Ll/fb5<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
