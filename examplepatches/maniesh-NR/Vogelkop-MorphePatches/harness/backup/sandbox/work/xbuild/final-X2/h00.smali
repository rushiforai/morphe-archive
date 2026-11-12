.class public final Lh00;
.super Ll00;
.source "SourceFile"


# virtual methods
.method public final V(Lja2;Z)V
    .registers 5

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v0

    iget-object v0, v0, Lw10;->u:Lcie;

    invoke-super {p0, p1, p2}, Lxv8;->V(Lja2;Z)V

    if-nez p2, :cond_30

    iget-object p1, v0, Lcie;->r0:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_30

    iget-object p1, v0, Lcie;->s0:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_30

    iget p1, v0, Lcie;->t0:I

    if-lez p1, :cond_30

    const/16 p2, 0xa

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget-object p2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v0, Lg00;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lg00;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v0, p2}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    :cond_30
    return-void
.end method

.method public final bridge synthetic Z()Lmq;
    .registers 1

    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic e0()Lmq;
    .registers 1

    invoke-virtual {p0}, Ll00;->k0()Lx10;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic f0()Lyz;
    .registers 1

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p0

    return-object p0
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lxv8;->p:Landroid/widget/TextView;

    if-ne p1, v0, :cond_1b

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p0

    iget-object p0, p0, Lw10;->u:Lcie;

    iget-object p0, p0, Lcie;->s0:Ljava/lang/String;

    invoke-static {p0}, Lwqm;->I(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Llqm;->p:Llqm;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    return-void

    :cond_1b
    invoke-super {p0, p1}, Lxv8;->onClick(Landroid/view/View;)V

    return-void
.end method
