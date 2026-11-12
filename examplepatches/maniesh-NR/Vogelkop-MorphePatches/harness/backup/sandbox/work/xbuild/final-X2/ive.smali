.class public final Live;
.super Lgu8;
.source "SourceFile"


# instance fields
.field public final m:Lhve;

.field public final n:Lor2;

.field public final o:I

.field public p:Loqe;


# direct methods
.method public constructor <init>(Landroid/view/View;Lhve;Lp0c;)V
    .registers 11

    invoke-direct {p0, p1, p2, p3}, Lgu8;-><init>(Landroid/view/View;Lr9i;Lp0c;)V

    iput-object p2, p0, Live;->m:Lhve;

    const p2, 0x7f0a0102

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    if-eqz v2, :cond_63

    const p2, 0x7f0a026e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v3, p3

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_63

    const p2, 0x7f0a056f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v4, p3

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v4, :cond_63

    const p2, 0x7f0a06c5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v5, p3

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_63

    new-instance v0, Lor2;

    move-object v1, p1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v6, 0x9

    invoke-direct/range {v0 .. v6}, Lor2;-><init>(Landroid/view/View;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;B)V

    iput-object v0, p0, Live;->n:Lor2;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 p2, 0x43100000    # 144.0f

    invoke-static {p2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Live;->o:I

    new-instance p1, Llzb;

    const/16 p2, 0x15

    invoke-direct {p1, p0, p2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_5f

    return-void

    :cond_5f
    invoke-static {p0, v1, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_63
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 7

    iget-object p1, p0, Live;->p:Loqe;

    if-eqz p1, :cond_45

    invoke-static {p2, p3}, Lr9i;->K(II)Z

    move-result p2

    iget-object p0, p0, Live;->m:Lhve;

    if-eqz p2, :cond_42

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Luqe;

    check-cast p1, Lfre;

    iget-object p1, p1, Lfre;->D:Ljb8;

    iget-object p1, p1, Ljb8;->k:Ljava/lang/String;

    iget-object p0, p0, Luqe;->h:Luy8;

    iget-object p2, p0, Luy8;->G:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_45

    iget-object p0, p0, Luy8;->K:Ly0f;

    iget-object p0, p0, Ly0f;->a:Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-eqz p2, :cond_45

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p3

    new-instance v0, Lck0;

    invoke-direct {v0, p2, p3}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance p2, Lj5f;

    sget-object v1, Lod0;->c:Lod0;

    const/4 v2, 0x1

    invoke-direct {p2, p1, v1, v2}, Lj5f;-><init>(Ljava/lang/String;Lod0;I)V

    invoke-virtual {v0, p2}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, p3}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_42
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_45
    return-void
.end method

.method public final V(Lja2;Z)V
    .registers 6

    invoke-super {p0, p1, p2}, Lgu8;->V(Lja2;Z)V

    invoke-virtual {p0}, Lgu8;->e0()Loqe;

    move-result-object p1

    iput-object p1, p0, Live;->p:Loqe;

    if-eqz p2, :cond_c

    return-void

    :cond_c
    iget-object p1, p0, Live;->n:Lor2;

    iget-object p2, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v0, p1, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Lgu8;->e0()Loqe;

    move-result-object v1

    iget-object v2, p0, Live;->m:Lhve;

    invoke-virtual {v2, v1}, Lhve;->J(Loqe;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0}, Lgu8;->e0()Loqe;

    move-result-object p2

    check-cast p2, Lfre;

    iget-object p2, p2, Lfre;->D:Ljb8;

    iget-object p2, p2, Ljb8;->d:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-static {v0}, Lu8n;->h(Landroid/view/View;)V

    invoke-virtual {p0}, Lgu8;->e0()Loqe;

    move-result-object p1

    check-cast p1, Lfre;

    iget-object p1, p1, Lfre;->D:Ljb8;

    iget-object p1, p1, Ljb8;->i:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p1, Lzvd;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Live;->m0()V

    return-void
.end method

.method public final Y()V
    .registers 2

    invoke-super {p0}, Lgu8;->Y()V

    const/4 v0, 0x0

    iput-object v0, p0, Live;->p:Loqe;

    return-void
.end method

.method public final m0()V
    .registers 9

    iget-object v0, p0, Live;->p:Loqe;

    if-eqz v0, :cond_a8

    iget-object v1, p0, Live;->n:Lor2;

    iget-object v2, v1, Lor2;->c:Landroid/view/View;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v3, v1, Lor2;->d:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Live;->m:Lhve;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Lf03;->H(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_25

    move-object v5, v0

    check-cast v5, Lfre;

    iget-object v5, v5, Lfre;->D:Ljb8;

    iget-object v5, v5, Ljb8;->f:Ljava/lang/String;

    goto :goto_2c

    :cond_25
    move-object v5, v0

    check-cast v5, Lfre;

    iget-object v5, v5, Lfre;->D:Ljb8;

    iget-object v5, v5, Ljb8;->e:Ljava/lang/String;

    :goto_2c
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-static {v2}, Lf03;->I(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_3e

    move-object v6, v0

    check-cast v6, Lfre;

    iget-object v6, v6, Lfre;->D:Ljb8;

    iget-object v6, v6, Ljb8;->h:Ljava/lang/String;

    goto :goto_45

    :cond_3e
    move-object v6, v0

    check-cast v6, Lfre;

    iget-object v6, v6, Lfre;->D:Ljb8;

    iget-object v6, v6, Ljb8;->g:Ljava/lang/String;

    :goto_45
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    iget-object v7, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v7, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/google/android/material/button/MaterialButton;->H(Landroid/content/res/ColorStateList;)V

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/android/material/button/MaterialButton;->I(Landroid/content/res/ColorStateList;)V

    iget-object v3, v1, Lor2;->c:Landroid/view/View;

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-static {v2}, Lf03;->I(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_81

    check-cast v0, Lfre;

    iget-object v0, v0, Lfre;->D:Ljb8;

    iget-object v0, v0, Ljb8;->c:Ljava/lang/String;

    goto :goto_87

    :cond_81
    check-cast v0, Lfre;

    iget-object v0, v0, Lfre;->D:Ljb8;

    iget-object v0, v0, Ljb8;->b:Ljava/lang/String;

    :goto_87
    iget-object v2, v4, Lr9i;->b:Ljava/lang/Object;

    check-cast v2, Luqe;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget p0, p0, Live;->o:I

    invoke-virtual {v2, v0, p0, p0}, Luqe;->m(Landroid/net/Uri;II)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v2, Lga6;

    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, p0, p0}, Landroid/graphics/Point;-><init>(II)V

    const/16 p0, 0xb

    invoke-direct {v2, v3, p0}, Lga6;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1, v2}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    :cond_a8
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 7

    invoke-super {p0, p1}, Lgu8;->onClick(Landroid/view/View;)V

    invoke-virtual {p0}, Lgu8;->e0()Loqe;

    move-result-object p1

    iget-object p0, p0, Live;->m:Lhve;

    iget-object p0, p0, Lhve;->h:Luqe;

    check-cast p1, Lfre;

    iget-object p1, p1, Lfre;->D:Ljb8;

    iget-object p1, p1, Ljb8;->k:Ljava/lang/String;

    iget-object p0, p0, Luqe;->h:Luy8;

    iget-object v0, p0, Luy8;->F:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object p0, p0, Luy8;->K:Ly0f;

    iget-object p0, p0, Ly0f;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v0, Lj5f;

    sget-object v3, Lod0;->c:Lod0;

    const/4 v4, 0x2

    invoke-direct {v0, p1, v3, v4}, Lj5f;-><init>(Ljava/lang/String;Lod0;I)V

    invoke-virtual {v2, v0}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    :cond_3c
    return-void
.end method
