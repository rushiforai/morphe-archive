.class public abstract Ltq8;
.super Lhq8;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lw6f;


# instance fields
.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/util/HashSet;

.field public final g:Lj1d;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lhq8;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ltq8;->e:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Ltq8;->f:Ljava/util/HashSet;

    new-instance v0, Lj1d;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lj1d;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ltq8;->g:Lj1d;

    return-void
.end method


# virtual methods
.method public final A(Lhq8;)V
    .registers 7

    iget-object v0, p1, Lhq8;->b:Ltq8;

    const/4 v1, -0x1

    if-eq v0, p0, :cond_7

    move v0, v1

    goto :goto_9

    :cond_7
    iget v0, p1, Lhq8;->c:I

    :goto_9
    const/4 v2, 0x0

    iput-object v2, p1, Lhq8;->b:Ltq8;

    iget-object v2, p0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v2, p0, Ltq8;->g:Lj1d;

    invoke-virtual {p1}, Lhq8;->e()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lj1d;->i(J)V

    iget v2, p1, Lhq8;->c:I

    invoke-virtual {p0, v2}, Ltq8;->C(I)V

    iput v1, p1, Lhq8;->c:I

    iget-object v1, p0, Ltq8;->f:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_27
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_37

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsq8;

    invoke-interface {v2, v0, p1}, Lsq8;->B(ILhq8;)V

    goto :goto_27

    :cond_37
    iget-object p1, p0, Lhq8;->b:Ltq8;

    if-eqz p1, :cond_3f

    const/4 v0, 0x2

    invoke-virtual {p1, v0, p0}, Lhq8;->n(ILhq8;)V

    :cond_3f
    return-void
.end method

.method public final B(Lsq8;)V
    .registers 2

    iget-object p0, p0, Ltq8;->f:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final C(I)V
    .registers 4

    :goto_0
    iget-object v0, p0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_13

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhq8;

    iput p1, v0, Lhq8;->c:I

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_13
    return-void
.end method

.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lsq8;

    invoke-virtual {p0, p1}, Ltq8;->t(Lsq8;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lsq8;

    invoke-virtual {p0, p1}, Ltq8;->B(Lsq8;)V

    return-void
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 1

    iget-object p0, p0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public final j()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final r()V
    .registers 3

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p0}, Lhq8;->n(ILhq8;)V

    iget-object v1, p0, Lhq8;->b:Ltq8;

    if-eqz v1, :cond_b

    invoke-virtual {v1, v0, p0}, Lhq8;->n(ILhq8;)V

    :cond_b
    return-void
.end method

.method public final s(ILhq8;)V
    .registers 4

    invoke-virtual {p0, p1, p2}, Ltq8;->x(ILhq8;)V

    iget-object p1, p0, Ltq8;->f:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsq8;

    invoke-interface {v0, p2}, Lsq8;->w(Lhq8;)V

    goto :goto_9

    :cond_19
    iget-object p1, p0, Lhq8;->b:Ltq8;

    if-eqz p1, :cond_21

    const/4 p2, 0x1

    invoke-virtual {p1, p2, p0}, Lhq8;->n(ILhq8;)V

    :cond_21
    return-void
.end method

.method public final t(Lsq8;)V
    .registers 2

    iget-object p0, p0, Ltq8;->f:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final u(I)Lhq8;
    .registers 2

    iget-object p0, p0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhq8;

    return-object p0
.end method

.method public final v(J)Lhq8;
    .registers 3

    iget-object p0, p0, Ltq8;->g:Lj1d;

    invoke-virtual {p0, p1, p2}, Lj1d;->c(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhq8;

    return-object p0
.end method

.method public final x(ILhq8;)V
    .registers 5

    iget-object v0, p0, Ltq8;->e:Ljava/util/ArrayList;

    if-ltz p1, :cond_b

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {p0, p1}, Ltq8;->C(I)V

    goto :goto_17

    :cond_b
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, p1}, Ltq8;->C(I)V

    :goto_17
    iget-object p1, p0, Ltq8;->g:Lj1d;

    invoke-virtual {p2}, Lhq8;->e()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1, p2}, Lj1d;->g(JLjava/lang/Object;)V

    iput-object p0, p2, Lhq8;->b:Ltq8;

    return-void
.end method

.method public y()Z
    .registers 1

    instance-of p0, p0, Lcom/opera/android/favorites/f;

    return p0
.end method

.method public z()Ljava/util/Date;
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method
