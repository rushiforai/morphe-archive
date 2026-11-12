.class public final Lb7n;
.super Ld7n;
.source "SourceFile"


# virtual methods
.method public final a(Landroidx/recyclerview/widget/i;)V
    .registers 3

    check-cast p1, Le7n;

    iget-object p1, p1, Le7n;->i:Lqhc;

    iget-object p1, p1, Lqhc;->a:Lal3;

    iget-object v0, p0, Le7n;->i:Lqhc;

    iget-object v0, v0, Lqhc;->a:Lal3;

    check-cast v0, Lml3;

    iget-object p0, p0, Ld7n;->o:Li53;

    invoke-virtual {p0, p1, v0}, Li53;->g(Lal3;Lml3;)V

    return-void
.end method

.method public final a0()V
    .registers 2

    invoke-super {p0}, Lak7;->a0()V

    iget-boolean v0, p0, Lyzi;->e:Z

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lb7n;->m0()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    :cond_e
    return-void
.end method

.method public final j0()Z
    .registers 2

    iget-object p0, p0, Le7n;->i:Lqhc;

    iget p0, p0, Lqhc;->b:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_9

    const/4 p0, 0x1

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final k0(Lqhc;)V
    .registers 6

    invoke-super {p0, p1}, Ld7n;->k0(Lqhc;)V

    invoke-virtual {p0}, Lb7n;->m0()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Le7n;->i:Lqhc;

    iget p1, p1, Lqhc;->b:I

    const/4 v0, 0x2

    iget-object v1, p0, Ld7n;->l:Landroid/widget/TextView;

    if-ne p1, v0, :cond_19

    const/16 p0, 0x8

    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_19
    const/4 p1, 0x0

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Le7n;->i:Lqhc;

    iget-object v0, v0, Lqhc;->a:Lal3;

    new-instance v2, Lsa2;

    const/4 v3, 0x4

    invoke-direct {v2, v3, p1}, Lsa2;-><init>(BZ)V

    invoke-interface {v0, v2}, Lal3;->c(Lzk3;)Z

    iget p1, v2, Lsa2;->b:I

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f12000e

    invoke-virtual {p0, v2, p1, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final m0()Landroid/graphics/drawable/Drawable;
    .registers 4

    iget-object v0, p0, Le7n;->i:Lqhc;

    iget v0, v0, Lqhc;->b:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    const v1, 0x7f08055a

    if-eqz v0, :cond_23

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1f

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1b

    const/4 v2, 0x3

    if-eq v0, v2, :cond_44

    const/4 v2, 0x4

    if-eq v0, v2, :cond_44

    const/4 v1, 0x0

    goto :goto_44

    :cond_1b
    const v1, 0x7f080541

    goto :goto_44

    :cond_1f
    const v1, 0x7f0805ab

    goto :goto_44

    :cond_23
    iget-object v0, p0, Le7n;->i:Lqhc;

    iget-object v0, v0, Lqhc;->a:Lal3;

    check-cast v0, Lml3;

    invoke-interface {v0}, Lol3;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_44

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Le7n;->i:Lqhc;

    iget-object p0, p0, Lqhc;->a:Lal3;

    check-cast p0, Lml3;

    invoke-interface {p0}, Lol3;->b()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lalo;->z(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_44
    :goto_44
    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v1, p0}, Lalo;->A(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method
