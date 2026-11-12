.class public final Ly00;
.super Lg10;
.source "SourceFile"


# instance fields
.field public H:Z


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 13

    iget-object v0, p0, Lxv8;->x:Landroid/widget/TextView;

    if-ne p1, v0, :cond_7e

    invoke-virtual {p0}, Ll00;->k0()Lx10;

    move-result-object v0

    if-eqz v0, :cond_7d

    invoke-virtual {v0}, Lx10;->n()V

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v0

    iget-object v0, v0, Lw10;->u:Lcie;

    iget-boolean v1, p0, Ly00;->H:Z

    const/4 v2, 0x4

    if-nez v1, :cond_6f

    const/4 v1, 0x7

    invoke-static {v0, v1}, Lcs5;->q0(Lcie;I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v1, Li16;

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-direct {v1, v3, p0, v0, v4}, Li16;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget p0, v0, Lcie;->x0:I

    if-nez p0, :cond_2c

    const/4 p0, 0x2

    :cond_2c
    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_47

    const/4 v2, 0x1

    if-ne p0, v2, :cond_7d

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    new-instance p1, Lhy4;

    invoke-direct {p1, v0, v1}, Lhy4;-><init>(Lcie;Li16;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_47
    const-string p0, "com.opera.android.ui.FRAGMENT_CONTROLLER_SERVICE"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lll9;

    new-instance p1, Lf9c;

    invoke-direct {p1, v0, v1}, Lf9c;-><init>(Lcie;Li16;)V

    new-array v0, v4, [Ln6h;

    new-instance v4, Lwzg;

    const-class v1, Lf9c;

    invoke-direct {v4, p1, v1, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v3 .. v10}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {p0, v3}, Lll9;->b(Lzhj;)V

    return-void

    :cond_6f
    invoke-static {v0, v2}, Lcs5;->q0(Lcie;I)V

    iget-object p0, v0, Lcie;->P:Ljsd;

    if-eqz p0, :cond_7d

    iget-object p1, v0, Lcie;->w0:Laoo;

    if-eqz p1, :cond_7d

    invoke-virtual {p1, p0}, Laoo;->j(Landroid/view/View;)V

    :cond_7d
    return-void

    :cond_7e
    invoke-super {p0, p1}, Lxv8;->onClick(Landroid/view/View;)V

    return-void
.end method

.method public final q0(Landroid/os/Bundle;)V
    .registers 8

    const-string v0, "submitted"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Ly00;->H:Z

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p1

    iget-object p1, p1, Lw10;->u:Lcie;

    iget-boolean v0, p0, Ly00;->H:Z

    if-eqz v0, :cond_17

    invoke-virtual {p0, p1}, Ly00;->t0(Lcie;)V

    return-void

    :cond_17
    iget-object v0, p0, Lg10;->E:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v2, p1, Lcie;->o:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_41

    new-instance v3, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_41

    new-instance v0, Lnv6;

    invoke-direct {v0, v3}, Lnv6;-><init>(Ljava/lang/Object;)V

    iget-object v4, p0, Lxv8;->k:Lga6;

    invoke-static {v2, v3, v4, v1, v0}, Lgu8;->h0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;ZLd94;)V

    :cond_41
    iget-object v0, p0, Lxv8;->x:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p1, Lcie;->E:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lxv8;->n:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lxv8;->i0()V

    iget-object v0, p0, Lxv8;->j:Landroid/widget/FrameLayout;

    invoke-static {v0}, Lg10;->n0(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v1

    iget-object v2, p0, Lxv8;->m:Landroid/widget/TextView;

    invoke-static {v1, v2}, Lg10;->p0(ILandroid/view/View;)V

    iget-object p0, p0, Lxv8;->i:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    invoke-static {v0, p0}, Lg10;->p0(ILandroid/view/View;)V

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result p0

    invoke-static {p0, p1}, Lg10;->p0(ILandroid/view/View;)V

    return-void
.end method

.method public final r0(Landroid/os/Bundle;)V
    .registers 3

    const-string v0, "submitted"

    iget-boolean p0, p0, Ly00;->H:Z

    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public final t0(Lcie;)V
    .registers 6

    iget-object v0, p0, Lg10;->E:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, p1, Lbzo;->d:Lw06;

    const/16 v1, 0x8

    sget-object v2, Lw06;->f:Lw06;

    iget-object v3, p0, Lxv8;->x:Landroid/widget/TextView;

    if-ne v0, v2, :cond_13

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_22

    :cond_13
    iget-boolean v0, p1, Lcie;->J:Z

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    goto :goto_1a

    :cond_19
    move v0, v1

    :goto_1a
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p1, Lcie;->K:Ljava/lang/String;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_22
    iget-object v0, p0, Lxv8;->n:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lxv8;->q:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lxv8;->m:Landroid/widget/TextView;

    invoke-static {v1}, Lg10;->n0(Landroid/view/View;)V

    iget-object v2, p0, Lxv8;->i:Landroid/view/ViewGroup;

    invoke-static {v2}, Lg10;->n0(Landroid/view/View;)V

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    iget-object v2, p0, Lxv8;->j:Landroid/widget/FrameLayout;

    invoke-static {v1, v2}, Lg10;->p0(ILandroid/view/View;)V

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v1

    invoke-static {v1, v0}, Lg10;->p0(ILandroid/view/View;)V

    invoke-virtual {p0, p1}, Lg10;->s0(Lcie;)V

    return-void
.end method
