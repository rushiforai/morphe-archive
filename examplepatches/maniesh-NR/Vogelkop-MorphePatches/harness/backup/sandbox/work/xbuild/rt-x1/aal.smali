.class public final Laal;
.super Lr22;
.source "SourceFile"


# instance fields
.field public e:Lb2l;


# virtual methods
.method public final Q(Lb87;Lb2l;)V
    .registers 6

    new-instance v0, Lz9l;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, p2, v1, p1, v2}, Lz9l;-><init>(Lb2l;ILjjm;Z)V

    invoke-interface {p1}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final R(Lcej;Lb2l;)V
    .registers 6

    new-instance v0, Lz9l;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-direct {v0, p2, v1, p1, v2}, Lz9l;-><init>(Lb2l;ILjjm;Z)V

    invoke-interface {p1}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final S(Lo93;Lb2l;Z)V
    .registers 6

    new-instance v0, Lz9l;

    const/4 v1, 0x3

    invoke-direct {v0, p2, v1, p1, p3}, Lz9l;-><init>(Lb2l;ILjjm;Z)V

    invoke-virtual {v0}, Lz9l;->getDefaultPriority()Lijm;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final T(Lb2l;)V
    .registers 6

    iget-object v0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    sget-object v2, Lhjm;->b:Lhjm;

    if-eqz v1, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz9l;

    iget-object v3, v1, Lz9l;->a:Lb2l;

    if-ne v3, p1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    invoke-virtual {v1, v2}, Lz9l;->finish(Lhjm;)V

    goto :goto_8

    :cond_21
    iget-object v0, p0, Lr22;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_29
    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz9l;

    iget-object v3, v1, Lz9l;->a:Lb2l;

    if-ne v3, p1, :cond_29

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    invoke-virtual {v1, v2}, Lz9l;->finish(Lhjm;)V

    goto :goto_29

    :cond_40
    iget-object v0, p0, Laal;->e:Lb2l;

    if-ne p1, v0, :cond_57

    iget-object p0, p0, Lr22;->c:Ljava/lang/Object;

    check-cast p0, Lqim;

    :goto_48
    iget-object p1, p0, Lqim;->n:Lu7k;

    if-eqz p1, :cond_57

    iget-object p1, p1, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Lz9l;

    invoke-virtual {p1, v2}, Lz9l;->finish(Lhjm;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lqim;->n:Lu7k;

    goto :goto_48

    :cond_57
    return-void
.end method
