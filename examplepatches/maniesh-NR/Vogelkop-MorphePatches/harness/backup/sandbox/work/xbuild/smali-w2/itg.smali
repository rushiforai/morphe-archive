.class public final Litg;
.super Lh83;
.source "SourceFile"


# virtual methods
.method public final H0(Lei;)V
    .registers 5

    iget-object p0, p1, Lei;->h:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070053

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v2, 0x7f070052

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-static {p0, v1, v0}, Lq9n;->E(Landroid/view/View;II)V

    iget-object p0, p1, Lei;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070051

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-static {p1, p0}, Lq9n;->C(ILandroid/view/View;)V

    return-void
.end method

.method public final I0()V
    .registers 5

    iget-object v0, p0, Lh83;->z:Lnvg;

    iget-object v0, v0, Lnvg;->c:Lp8f;

    new-instance v1, Llvg;

    const/4 v2, 0x2

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Llvg;-><init>(II)V

    invoke-virtual {v0}, Lp8f;->t()Lmvg;

    move-result-object v2

    if-eqz v2, :cond_19

    iget-object v3, v2, Lmvg;->f:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v2}, Lp8f;->G(Lmvg;)V

    :cond_19
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "base-account-onboarding-fragment"

    return-object p0
.end method
