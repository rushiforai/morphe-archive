.class public final Lcom/google/android/exoplayer2/source/l$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u9f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/u9f;

.field public final b:Ll/dfj0;


# direct methods
.method public constructor <init>(Ll/u9f;Ll/dfj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/l$a;->b:Ll/dfj0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(IJ)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/u9f;->a(IJ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/vfj0;->c(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(IJ)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/u9f;->d(IJ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public disable()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->disable()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public enable()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->enable()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/google/android/exoplayer2/source/l$a;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/google/android/exoplayer2/source/l$a;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->b:Ll/dfj0;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/l$a;->b:Ll/dfj0;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/dfj0;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    return v0

    .line 34
    :cond_2
    return v2
.end method

.method public f(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/vfj0;->f(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g(JJJLjava/util/List;[Ll/drx;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJ",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;[",
            "Ll/drx;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p8}, Ll/u9f;->g(JJJLjava/util/List;[Ll/drx;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()Ll/dfj0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->b:Ll/dfj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/l$a;->b:Ll/dfj0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dfj0;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x20f

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    mul-int/lit8 v1, v1, 0x1f

    .line 11
    .line 12
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-int/2addr v1, p0

    .line 19
    return v1
.end method

.method public i(JLjava/util/List;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/u9f;->i(JLjava/util/List;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->j()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k()Lcom/google/android/exoplayer2/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->k()Lcom/google/android/exoplayer2/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public length()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/vfj0;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m(I)Lcom/google/android/exoplayer2/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/vfj0;->m(I)Lcom/google/android/exoplayer2/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/u9f;->n(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->o()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p(JLl/o45;Ljava/util/List;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ll/o45;",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Ll/u9f;->p(JLl/o45;Ljava/util/List;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/u9f;->q(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r(Lcom/google/android/exoplayer2/k;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/vfj0;->r(Lcom/google/android/exoplayer2/k;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/l$a;->a:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u9f;->s()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
