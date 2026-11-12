.class public abstract Ll00;
.super Lxv8;
.source "SourceFile"


# static fields
.field public static final synthetic D:I


# virtual methods
.method public bridge synthetic Z()Lmq;
    .registers 1

    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic e0()Lmq;
    .registers 1

    invoke-virtual {p0}, Ll00;->k0()Lx10;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic f0()Lyz;
    .registers 1

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p0

    return-object p0
.end method

.method public i(Z)V
    .registers 8

    invoke-super {p0, p1}, Lbu8;->i(Z)V

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v0

    iget-object v0, v0, Lw10;->u:Lcie;

    if-eqz p1, :cond_6c

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v2, Lpve;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lpve;-><init>(B)V

    invoke-static {p1, v2}, Lq9n;->I(Landroid/view/View;Lp9n;)V

    iget-object p1, v2, Lpve;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_29
    if-ge v4, v2, :cond_3d

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Landroid/view/View;

    invoke-virtual {v5, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {v5, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v5, v3}, Landroid/view/View;->setClickable(Z)V

    goto :goto_29

    :cond_3d
    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iput-object v2, v0, Lcie;->R:Landroid/view/View;

    new-array v2, v3, [Landroid/view/View;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/view/View;

    new-instance v2, Ljava/util/ArrayList;

    array-length v3, p1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, v0, Lcie;->Q:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lxv8;->x:Landroid/widget/TextView;

    iput-object p1, v0, Lcie;->S:Landroid/widget/TextView;

    iget-object p0, p0, Lxv8;->y:Landroid/view/View;

    instance-of p1, p0, Ljsd;

    if-eqz p1, :cond_68

    check-cast p0, Ljsd;

    invoke-virtual {v0, p0}, Lcie;->h(Ljsd;)V

    return-void

    :cond_68
    invoke-virtual {v0, v1}, Lcie;->h(Ljsd;)V

    return-void

    :cond_6c
    invoke-virtual {v0}, Lcie;->unregister()V

    return-void
.end method

.method public final k0()Lx10;
    .registers 1

    iget-object p0, p0, Lab2;->b:Lja2;

    check-cast p0, Lmq;

    check-cast p0, Lx10;

    return-object p0
.end method

.method public final l0()Lw10;
    .registers 1

    invoke-virtual {p0}, Ll00;->Z()Lmq;

    move-result-object p0

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lw10;

    return-object p0
.end method

.method public final m0()Lx10;
    .registers 1

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lmq;

    check-cast p0, Lx10;

    return-object p0
.end method
