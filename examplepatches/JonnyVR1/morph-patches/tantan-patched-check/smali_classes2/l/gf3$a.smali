.class public Ll/gf3$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gf3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/n0f;",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/yk90;

.field public final synthetic d:Ll/gf3;


# direct methods
.method public constructor <init>(Ll/gf3;Ll/z06;Ll/yk90;)V
    .locals 0
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
    iput-object p1, p0, Ll/gf3$a;->d:Ll/gf3;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/pud;-><init>(Ll/z06;)V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Ll/gf3$a;->c:Ll/yk90;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/gf3;Ll/z06;Ll/yk90;Ll/hf3;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Ll/gf3$a;-><init>(Ll/gf3;Ll/z06;Ll/yk90;)V

    return-void
.end method


# virtual methods
.method public g(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/gf3$a;->d:Ll/gf3;

    .line 2
    .line 3
    invoke-static {p1}, Ll/gf3;->c(Ll/gf3;)Ll/wk90;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/gf3$a;->c:Ll/yk90;

    .line 12
    .line 13
    invoke-interface {p1, v0, p0}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/n0f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/gf3$a;->p(Ll/n0f;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/n0f;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gf3$a;->c:Ll/yk90;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2}, Ll/ji2;->d(I)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->s()Ll/q3d0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {p1, v2}, Ll/czi0;->c(Ll/n0f;Ll/q3d0;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->k()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    :cond_0
    if-eqz v1, :cond_1

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v3, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v3, 0x1

    .line 42
    invoke-static {p2, v3}, Ll/ji2;->n(II)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-interface {v3, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 51
    .line 52
    .line 53
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    .line 54
    .line 55
    if-nez v2, :cond_3

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->j()Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-nez p2, :cond_3

    .line 62
    .line 63
    invoke-static {p1}, Ll/n0f;->n(Ll/n0f;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/gf3$a;->d:Ll/gf3;

    .line 67
    .line 68
    invoke-static {p1}, Ll/gf3;->c(Ll/gf3;)Ll/wk90;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iget-object p0, p0, Ll/gf3$a;->c:Ll/yk90;

    .line 77
    .line 78
    invoke-interface {p1, p2, p0}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    return-void
.end method
