.class public final Lbm3;
.super Lyz7;
.source "SourceFile"


# virtual methods
.method public final e(Z)V
    .registers 3

    iget-object p0, p0, Lyz7;->b:Lwz7;

    instance-of v0, p0, Lam3;

    if-eqz v0, :cond_9

    check-cast p0, Lam3;

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    if-eqz p0, :cond_1a

    iget-boolean v0, p0, Lam3;->h:Z

    if-eq v0, p1, :cond_1a

    iput-boolean p1, p0, Lam3;->h:Z

    iget-boolean p1, p0, Lwz7;->e:Z

    if-eqz p1, :cond_1a

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_1a
    return-void
.end method

.method public final f(Z)V
    .registers 3

    iget-object p0, p0, Lyz7;->b:Lwz7;

    instance-of v0, p0, Lam3;

    if-eqz v0, :cond_9

    check-cast p0, Lam3;

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    if-eqz p0, :cond_1a

    iget-boolean v0, p0, Lam3;->i:Z

    if-eq v0, p1, :cond_1a

    iput-boolean p1, p0, Lam3;->i:Z

    iget-boolean p1, p0, Lwz7;->e:Z

    if-eqz p1, :cond_1a

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_1a
    return-void
.end method

.method public final g(Lcm3;)V
    .registers 3

    iget-object p0, p0, Lyz7;->b:Lwz7;

    instance-of v0, p0, Lam3;

    if-eqz v0, :cond_9

    check-cast p0, Lam3;

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    if-eqz p0, :cond_1a

    iget-object v0, p0, Lam3;->g:Lcm3;

    if-eq v0, p1, :cond_1a

    iput-object p1, p0, Lam3;->g:Lcm3;

    iget-boolean p1, p0, Lwz7;->e:Z

    if-eqz p1, :cond_1a

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_1a
    return-void
.end method

.method public final h(Z)V
    .registers 3

    iget-object p0, p0, Lyz7;->b:Lwz7;

    instance-of v0, p0, Lam3;

    if-eqz v0, :cond_9

    check-cast p0, Lam3;

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    if-eqz p0, :cond_1a

    iget-boolean v0, p0, Lam3;->j:Z

    if-eq v0, p1, :cond_1a

    iput-boolean p1, p0, Lam3;->j:Z

    iget-boolean p1, p0, Lwz7;->e:Z

    if-eqz p1, :cond_1a

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_1a
    return-void
.end method
