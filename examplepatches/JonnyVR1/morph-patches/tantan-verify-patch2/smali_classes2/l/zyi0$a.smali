.class public Ll/zyi0$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zyi0;
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
.field public final c:Ll/yk90;

.field public final d:I

.field public final e:Ll/q3d0;

.field public final synthetic f:Ll/zyi0;


# direct methods
.method public constructor <init>(Ll/zyi0;Ll/z06;Ll/yk90;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            "I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/zyi0$a;->f:Ll/zyi0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/pud;-><init>(Ll/z06;)V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Ll/zyi0$a;->c:Ll/yk90;

    .line 7
    .line 8
    iput p4, p0, Ll/zyi0$a;->d:I

    .line 9
    .line 10
    invoke-interface {p3}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->s()Ll/q3d0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/zyi0$a;->e:Ll/q3d0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public g(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zyi0$a;->f:Ll/zyi0;

    .line 2
    .line 3
    iget v1, p0, Ll/zyi0$a;->d:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v3, p0, Ll/zyi0$a;->c:Ll/yk90;

    .line 12
    .line 13
    invoke-static {v0, v1, v2, v3}, Ll/zyi0;->c(Ll/zyi0;ILl/z06;Ll/yk90;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0, p1}, Ll/z06;->onFailure(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/n0f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zyi0$a;->p(Ll/n0f;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/n0f;I)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/zyi0$a;->e:Ll/q3d0;

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/czi0;->c(Ll/n0f;Ll/q3d0;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-static {p2}, Ll/ji2;->d(I)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_2

    .line 30
    .line 31
    invoke-static {p1}, Ll/n0f;->n(Ll/n0f;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/zyi0$a;->f:Ll/zyi0;

    .line 35
    .line 36
    iget p2, p0, Ll/zyi0$a;->d:I

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    add-int/2addr p2, v0

    .line 40
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Ll/zyi0$a;->c:Ll/yk90;

    .line 45
    .line 46
    invoke-static {p1, p2, v1, v2}, Ll/zyi0;->c(Ll/zyi0;ILl/z06;Ll/yk90;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 p1, 0x0

    .line 57
    invoke-interface {p0, p1, v0}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method
