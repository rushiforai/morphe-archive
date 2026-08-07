.class public Ll/nvv$a;
.super Ll/z3g0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nvv;->b(Ll/z06;Ll/yk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/z3g0<",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic f:Lcom/facebook/imagepipeline/request/ImageRequest;

.field public final synthetic g:Ll/cl90;

.field public final synthetic h:Ll/yk90;

.field public final synthetic i:Ll/nvv;


# direct methods
.method public constructor <init>(Ll/nvv;Ll/z06;Ll/cl90;Ll/yk90;Ljava/lang/String;Lcom/facebook/imagepipeline/request/ImageRequest;Ll/cl90;Ll/yk90;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nvv$a;->i:Ll/nvv;

    .line 2
    .line 3
    iput-object p6, p0, Ll/nvv$a;->f:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 4
    .line 5
    iput-object p7, p0, Ll/nvv$a;->g:Ll/cl90;

    .line 6
    .line 7
    iput-object p8, p0, Ll/nvv$a;->h:Ll/yk90;

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
    check-cast p1, Ll/n0f;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nvv$a;->j(Ll/n0f;)V

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
    invoke-virtual {p0}, Ll/nvv$a;->k()Ll/n0f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/n0f;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/n0f;->n(Ll/n0f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()Ll/n0f;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nvv$a;->i:Ll/nvv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nvv$a;->f:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/nvv;->d(Lcom/facebook/imagepipeline/request/ImageRequest;)Ll/n0f;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "fetch"

    .line 10
    .line 11
    const-string v2, "local"

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/nvv$a;->g:Ll/cl90;

    .line 16
    .line 17
    iget-object v3, p0, Ll/nvv$a;->h:Ll/yk90;

    .line 18
    .line 19
    iget-object v4, p0, Ll/nvv$a;->i:Ll/nvv;

    .line 20
    .line 21
    invoke-virtual {v4}, Ll/nvv;->f()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const/4 v5, 0x0

    .line 26
    invoke-interface {v0, v3, v4, v5}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/nvv$a;->h:Ll/yk90;

    .line 30
    .line 31
    invoke-interface {p0, v2, v1}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0

    .line 36
    :cond_0
    invoke-virtual {v0}, Ll/n0f;->e0()V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Ll/nvv$a;->g:Ll/cl90;

    .line 40
    .line 41
    iget-object v4, p0, Ll/nvv$a;->h:Ll/yk90;

    .line 42
    .line 43
    iget-object v5, p0, Ll/nvv$a;->i:Ll/nvv;

    .line 44
    .line 45
    invoke-virtual {v5}, Ll/nvv;->f()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    const/4 v6, 0x1

    .line 50
    invoke-interface {v3, v4, v5, v6}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Ll/nvv$a;->h:Ll/yk90;

    .line 54
    .line 55
    invoke-interface {v3, v2, v1}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/nvv$a;->h:Ll/yk90;

    .line 59
    .line 60
    const-string v1, "image_color_space"

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/n0f;->v()Landroid/graphics/ColorSpace;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-interface {p0, v1, v2}, Ll/lyk;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return-object v0
.end method
