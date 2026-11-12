.class public final Lq4g;
.super Lh53;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lh4g;


# instance fields
.field public final A:Lyu2;

.field public final B:Lw4g;

.field public C:Lp4g;

.field public D:Lo4g;

.field public E:I

.field public F:Landroid/graphics/drawable/Drawable;

.field public final G:Lz77;

.field public final t:Li4d;

.field public final u:La4g;

.field public final v:Lw3g;

.field public final w:I

.field public final x:I

.field public final y:Z

.field public final z:Lyt7;


# direct methods
.method public constructor <init>(La4g;Lw3g;ZILp4g;IILyu2;Lw4g;Lz77;)V
    .registers 12

    const/4 v0, 0x2

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    invoke-virtual {v0, p4}, Lu7k;->s(I)V

    iget-object p4, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast p4, Litl;

    const/4 v0, 0x1

    invoke-direct {p0, p4, v0}, Li93;-><init>(Litl;Z)V

    new-instance p4, Li4d;

    const/16 v0, 0xe

    invoke-direct {p4, p0, v0}, Li4d;-><init>(Ljava/lang/Object;B)V

    iput-object p4, p0, Lq4g;->t:Li4d;

    iput-object p1, p0, Lq4g;->u:La4g;

    iput-object p2, p0, Lq4g;->v:Lw3g;

    iput-boolean p3, p0, Lq4g;->y:Z

    iput-object p5, p0, Lq4g;->C:Lp4g;

    iput p6, p0, Lq4g;->w:I

    iput p7, p0, Lq4g;->x:I

    new-instance p1, Lyt7;

    const/4 p2, 0x6

    invoke-direct {p1, p2}, Lyt7;-><init>(B)V

    iput-object p1, p0, Lq4g;->z:Lyt7;

    iput-object p8, p0, Lq4g;->A:Lyu2;

    iput-object p9, p0, Lq4g;->B:Lw4g;

    iput-object p10, p0, Lq4g;->G:Lz77;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lq4g;->z:Lyt7;

    return-object p0
.end method

.method public final H0()Z
    .registers 2

    iget-object p0, p0, Lq4g;->D:Lo4g;

    iget-object p0, p0, Lo4g;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getInputType()I

    move-result p0

    const/16 v0, 0x90

    and-int/2addr p0, v0

    if-ne p0, v0, :cond_11

    const/4 p0, 0x1

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method

.method public final P(ILjava/lang/String;)Z
    .registers 4

    iget-object p0, p0, Lq4g;->v:Lw3g;

    iget v0, p0, Lw3g;->a:I

    if-ne p1, v0, :cond_12

    iget-object p0, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object p0, p0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 8

    iget-object v0, p0, Lq4g;->D:Lo4g;

    iget-object v0, v0, Lo4g;->l:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v1, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    const/4 v2, 0x0

    if-ne p1, v1, :cond_23

    iget-object p1, v0, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_14d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void

    :cond_23
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0812

    iget-object v3, p0, Lq4g;->u:La4g;

    iget-object v4, p0, Lq4g;->v:Lw3g;

    const/4 v5, 0x1

    if-ne v0, v1, :cond_5d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_14d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lwi2;->i:Lwi2;

    iget v0, v0, Llj2;->e:I

    if-ne v0, v5, :cond_14d

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_14d

    invoke-virtual {v3, v4}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5c

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v5}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    :cond_5c
    return-void

    :cond_5d
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0a55

    if-ne v0, v1, :cond_d4

    invoke-virtual {p0}, Lq4g;->H0()Z

    move-result p1

    if-eqz p1, :cond_8d

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->j:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    const v0, 0x7f080625

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p1, v2}, Lc5g;->a(Landroid/widget/TextView;Z)V

    iget-object p0, p0, Lq4g;->D:Lo4g;

    iget-object p0, p0, Lo4g;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    const-string p1, "fakepass"

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_8d
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_14d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lwi2;->i:Lwi2;

    iget v0, v0, Llj2;->e:I

    if-ne v0, v5, :cond_14d

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_14d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_d3

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, v4}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->j:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    const v0, 0x7f080624

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object p0, p0, Lq4g;->D:Lo4g;

    iget-object p0, p0, Lo4g;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p0, v5}, Lc5g;->a(Landroid/widget/TextView;Z)V

    :cond_d3
    return-void

    :cond_d4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a035f

    if-ne v0, v1, :cond_110

    new-instance p1, Law7;

    invoke-virtual {p0}, Lq4g;->H0()Z

    move-result v0

    iget-object v1, p0, Lq4g;->A:Lyu2;

    invoke-direct {p1, v0, v1}, Law7;-><init>(ZLyu2;)V

    iget-object v0, p0, Lq4g;->t:Li4d;

    iput-object v0, p1, Law7;->y:Li4d;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_102

    sget-object v1, Lwi2;->i:Lwi2;

    iget v1, v1, Llj2;->e:I

    if-ne v1, v5, :cond_ff

    invoke-static {v0}, Lsj2;->g(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_ff

    move v2, v5

    :cond_ff
    invoke-virtual {p1, v2}, Law7;->I0(Z)V

    :cond_102
    const/16 v0, 0x1003

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :cond_110
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0a02cc

    if-ne p1, v0, :cond_14d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    if-eqz p1, :cond_14d

    iget-object v0, v4, Lw3g;->c:Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lq4g;->w:I

    invoke-virtual {p0, v1, v0}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lq4g;->x:I

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lkqd;

    const/16 v3, 0x1d

    invoke-direct {v2, p0, v3}, Lkqd;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lhy4;

    invoke-direct {p0, v0, v1, v2}, Lhy4;-><init>(Ljava/lang/String;Ljava/lang/String;Lb27;)V

    const-string v0, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lz77;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_14d
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Lh53;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0708f0

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lq4g;->E:I

    new-instance v0, Li4g;

    iget-object v1, p0, Lq4g;->B:Lw4g;

    iget-object v2, p0, Lq4g;->v:Lw3g;

    invoke-direct {v0, v1, v2, p1, p0}, Li4g;-><init>(Lw4g;Lw3g;ILh4g;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lq4g;->D:Lo4g;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_30

    new-instance p1, Lzvd;

    const/16 p2, 0xb

    invoke-direct {p1, p0, p2}, Lzvd;-><init>(Ljava/lang/Object;B)V

    iget-object p2, p0, Lq4g;->D:Lo4g;

    iget-object p2, p2, Lo4g;->j:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lq4g;->D:Lo4g;

    iget-object p2, p2, Lo4g;->e:Landroid/view/View;

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lq4g;->D:Lo4g;

    iget-object p2, p2, Lo4g;->i:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_4b

    :cond_30
    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->j:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->e:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->i:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_4b
    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->l:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->l:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->d:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object p1, Lwi2;->i:Lwi2;

    iget-object p1, p1, Llj2;->d:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    new-instance v1, Ld8d;

    const/16 v2, 0x14

    invoke-direct {v1, p0, v2}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0, v1}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    if-eqz p1, :cond_159

    iget-object p1, p1, Lo4g;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->k:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->c:Landroid/view/View;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    const/16 p1, 0x8

    iget-boolean v0, p0, Lq4g;->y:Z

    if-eqz v0, :cond_a1

    move v1, p1

    goto :goto_a2

    :cond_a1
    move v1, p2

    :goto_a2
    iget-object v2, p0, Lq4g;->D:Lo4g;

    iget-object v2, v2, Lo4g;->l:Ljava/lang/Object;

    check-cast v2, Lor2;

    iget-object v2, v2, Lor2;->c:Landroid/view/View;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lq4g;->D:Lo4g;

    iget-object v2, v2, Lo4g;->f:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lq4g;->D:Lo4g;

    iget-object v2, v2, Lo4g;->g:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    if-eqz v0, :cond_c4

    move p2, p1

    :cond_c4
    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->j:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->i:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->e:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->d:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_eb

    const p2, 0x7f140e9f

    goto :goto_ee

    :cond_eb
    const p2, 0x7f140567

    :goto_ee
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p2, p0, Lq4g;->v:Lw3g;

    iget-object v2, p2, Lw3g;->c:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->k:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p2}, Lcqp;->W(Lw3g;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez v0, :cond_12b

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->l:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p2, p2, Lw3g;->f:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const-string p2, "fakepass"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_12b
    if-nez v1, :cond_14c

    iget-object p1, p0, Lq4g;->D:Lo4g;

    iget-object p1, p1, Lo4g;->l:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p2, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p2, p1}, Landroid/view/View;->setEnabled(Z)V

    :cond_14c
    iget-object p1, p0, Lq4g;->F:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_159

    iget-object p0, p0, Lq4g;->D:Lo4g;

    iget-object p0, p0, Lo4g;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_159
    return-void
.end method

.method public final s()V
    .registers 7

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_23

    iget-object v1, p0, Lq4g;->v:Lw3g;

    iget-object v1, v1, Lw3g;->c:Ljava/lang/String;

    iget v2, p0, Lq4g;->E:I

    sget v3, Lvmj;->g:I

    const/4 v4, 0x0

    const/16 v5, 0x30

    move v3, v2

    invoke-static/range {v0 .. v5}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object v0

    iput-object v0, p0, Lq4g;->F:Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lq4g;->D:Lo4g;

    if-eqz p0, :cond_23

    iget-object p0, p0, Lo4g;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_23
    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-super/range {p0 .. p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v2, 0x7f0d0326

    const/4 v3, 0x0

    move-object/from16 v4, p1

    invoke-virtual {v4, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a02cc

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/google/android/material/button/MaterialButton;

    if-eqz v7, :cond_d6

    const v1, 0x7f0a035f

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_d6

    const v1, 0x7f0a0322

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v9, :cond_d6

    const v1, 0x7f0a0810

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v10, :cond_d6

    const v1, 0x7f0a0812

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v11, :cond_d6

    const v1, 0x7f0a0814

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v12, :cond_d6

    const v1, 0x7f0a0a55

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v13, :cond_d6

    const v1, 0x7f0a0a6a

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_d6

    invoke-static {v4}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v14

    const v1, 0x7f0a06c5

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v15, :cond_d6

    const v1, 0x7f0a0a94

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_d6

    invoke-static {v4}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v16

    new-instance v5, Lo4g;

    move-object v6, v2

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v5 .. v16}, Lo4g;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageButton;Lor2;Lcom/opera/android/custom_views/StylingTextView;Lor2;)V

    iput-object v5, v0, Lq4g;->D:Lo4g;

    iget-object v1, v0, Lq4g;->A:Lyu2;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_a4

    const/4 v3, 0x1

    :cond_a4
    iget-object v1, v0, Lq4g;->D:Lo4g;

    if-eqz v3, :cond_b7

    iget-object v1, v1, Lo4g;->k:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    const v2, 0x7f140637

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_c5

    :cond_b7
    iget-object v1, v1, Lo4g;->k:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    const v2, 0x7f140639

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    :goto_c5
    iget-object v0, v0, Lq4g;->D:Lo4g;

    iget-object v0, v0, Lo4g;->l:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f14063b

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_d6
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final w(Landroid/graphics/Bitmap;)V
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_2b

    iget v1, p0, Lq4g;->E:I

    div-int/lit8 v2, v1, 0x2

    sget-object v3, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v3, Lp8i;

    invoke-direct {v3, v1, v2, v0, p1}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    const p1, 0x7f04021b

    const v1, 0x7f06063b

    invoke-static {p1, v0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {v3, p1}, Lp8i;->a(I)V

    iput-object v3, p0, Lq4g;->F:Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lq4g;->D:Lo4g;

    if-eqz p0, :cond_2b

    iget-object p0, p0, Lo4g;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v3}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2b
    return-void
.end method
