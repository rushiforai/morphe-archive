.class public final Ljve;
.super Lcve;
.source "SourceFile"


# instance fields
.field public final h:Luqe;

.field public final i:Lx5f;

.field public j:Lga6;

.field public final k:Lor2;

.field public final l:Landroid/content/Context;

.field public m:Lnb8;

.field public final n:Lvm3;


# direct methods
.method public constructor <init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;Lx5f;)V
    .registers 15

    invoke-direct/range {p0 .. p6}, Lcve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;)V

    iput-object p3, p0, Ljve;->h:Luqe;

    iput-object p7, p0, Ljve;->i:Lx5f;

    const p2, 0x7f0a01cd

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v2, :cond_73

    const p2, 0x7f0a01d4

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v3, p3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v3, :cond_73

    const p2, 0x7f0a0456

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/startpage/common/SnappingRecyclerView;

    if-eqz p3, :cond_73

    const p2, 0x7f0a0621

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v4, p3

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v4, :cond_73

    const p2, 0x7f0a06dc

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v5, p3

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_73

    new-instance v0, Lor2;

    move-object v1, p1

    check-cast v1, Lcom/opera/android/custom_views/CardView;

    const/16 v6, 0xa

    invoke-direct/range {v0 .. v6}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Ljve;->k:Lor2;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ljve;->l:Landroid/content/Context;

    new-instance p1, Lvm3;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lvm3;-><init>(Lcve;B)V

    iput-object p1, p0, Ljve;->n:Lvm3;

    iget-object p2, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    new-instance p1, Llzb;

    const/16 p2, 0x16

    invoke-direct {p1, p0, p2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_6f

    return-void

    :cond_6f
    invoke-static {p0, v1, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_73
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
.method public final J(Lwa2;)V
    .registers 2

    const/4 p0, 0x1

    iput-boolean p0, p1, Lwa2;->d:Z

    const/4 p0, 0x0

    iput-boolean p0, p1, Lwa2;->c:Z

    return-void
.end method

.method public final R()V
    .registers 2

    invoke-super {p0}, Lcve;->R()V

    iget-object p0, p0, Ljve;->n:Lvm3;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lvm3;->b:Z

    return-void
.end method

.method public final T(Landroid/view/View;II)V
    .registers 7

    invoke-super {p0, p1, p2, p3}, Lcve;->T(Landroid/view/View;II)V

    iget-object p1, p0, Ljve;->m:Lnb8;

    if-eqz p1, :cond_3c

    invoke-static {p2, p3}, Lr9i;->K(II)Z

    move-result p2

    if-eqz p2, :cond_3c

    iget-object p1, p1, Lnb8;->i:Ljava/lang/String;

    iget-object p0, p0, Ljve;->h:Luqe;

    iget-object p0, p0, Luqe;->h:Luy8;

    iget-object p2, p0, Luy8;->G:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3c

    iget-object p0, p0, Luy8;->K:Ly0f;

    iget-object p0, p0, Ly0f;->a:Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-eqz p2, :cond_3c

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p3

    new-instance v0, Lck0;

    invoke-direct {v0, p2, p3}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance p2, Lj5f;

    sget-object v1, Lod0;->b:Lod0;

    const/4 v2, 0x1

    invoke-direct {p2, p1, v1, v2}, Lj5f;-><init>(Ljava/lang/String;Lod0;I)V

    invoke-virtual {v0, p2}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, p3}, Lx5f;->U0(Lx56;)V

    :cond_3c
    return-void
.end method

.method public final V(Lja2;Z)V
    .registers 4

    invoke-super {p0, p1, p2}, Lcve;->V(Lja2;Z)V

    invoke-virtual {p0}, Lcve;->g0()Lfve;

    move-result-object p1

    iget-object p1, p1, Lj82;->c:Loqe;

    check-cast p1, Lere;

    iget-object p1, p1, Lere;->i:Lnb8;

    if-nez p1, :cond_10

    return-void

    :cond_10
    iput-object p1, p0, Ljve;->m:Lnb8;

    iget-object p1, p0, Ljve;->k:Lor2;

    iget-object p2, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v0, p1, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {p2, v0}, Lgu8;->i0(Landroid/view/View;Landroid/view/View;)Lga6;

    move-result-object p2

    iput-object p2, p0, Ljve;->j:Lga6;

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-static {v0}, Lu8n;->h(Landroid/view/View;)V

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-static {p1}, Lu8n;->h(Landroid/view/View;)V

    invoke-virtual {p0}, Ljve;->j0()V

    return-void
.end method

.method public final f0()[Landroid/view/View;
    .registers 3

    iget-object p0, p0, Ljve;->k:Lor2;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v0, 0x1

    new-array v0, v0, [Landroid/view/View;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    return-object v0
.end method

.method public final j0()V
    .registers 14

    iget-object v0, p0, Ljve;->m:Lnb8;

    if-eqz v0, :cond_bc

    iget-object v1, p0, Ljve;->l:Landroid/content/Context;

    invoke-static {v1}, Lf03;->H(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_f

    iget-object v2, v0, Lnb8;->f:Ljava/lang/String;

    goto :goto_11

    :cond_f
    iget-object v2, v0, Lnb8;->e:Ljava/lang/String;

    :goto_11
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1}, Lf03;->I(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_1e

    iget-object v3, v0, Lnb8;->d:Ljava/lang/String;

    goto :goto_20

    :cond_1e
    iget-object v3, v0, Lnb8;->c:Ljava/lang/String;

    :goto_20
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-static {v1}, Lf03;->I(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2d

    iget-object v1, v0, Lnb8;->b:Ljava/lang/String;

    goto :goto_2f

    :cond_2d
    iget-object v1, v0, Lnb8;->a:Ljava/lang/String;

    :goto_2f
    iget-object v4, p0, Ljve;->k:Lor2;

    iget-object v5, v4, Lor2;->f:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v6, v4, Lor2;->b:Ljava/lang/Object;

    check-cast v6, Lcom/google/android/material/button/MaterialButton;

    sget-object v7, Lyne;->b:Ldeg;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    const/4 v9, 0x0

    if-eqz v8, :cond_43

    move-object v1, v9

    :cond_43
    invoke-virtual {v7, v1}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object v1

    invoke-virtual {v5}, Lcom/opera/android/custom_views/StylingImageView;->d()Z

    move-result v7

    const/4 v8, 0x0

    if-nez v7, :cond_7a

    invoke-virtual {v5}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-eqz v7, :cond_7a

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v10

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    if-lez v10, :cond_7a

    if-lez v7, :cond_7a

    new-instance v11, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v12, Landroid/graphics/drawable/shapes/RectShape;

    invoke-direct {v12}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    invoke-direct {v11, v12}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    invoke-virtual {v11, v7}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    invoke-virtual {v11, v10}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicWidth(I)V

    invoke-virtual {v11}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v7

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v1, v11}, Ldwh;->k(Landroid/graphics/drawable/ShapeDrawable;)V

    :cond_7a
    iget-object v7, p0, Ljve;->j:Lga6;

    if-nez v7, :cond_7f

    move-object v7, v9

    :cond_7f
    iget-object v7, v7, Lga6;->b:Ljava/lang/Object;

    check-cast v7, Landroid/graphics/Point;

    iget v10, v7, Landroid/graphics/Point;->x:I

    const/4 v11, 0x1

    if-lez v10, :cond_8d

    iget v7, v7, Landroid/graphics/Point;->y:I

    if-lez v7, :cond_8d

    move v8, v11

    :cond_8d
    if-nez v8, :cond_91

    iput-boolean v11, v1, Ldwh;->d:Z

    :cond_91
    invoke-virtual {v1, v5, v9}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    iget-object v1, v4, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v4, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v6, v2}, Lcom/google/android/material/button/MaterialButton;->setBackgroundColor(I)V

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v6, v1}, Lcom/google/android/material/button/MaterialButton;->H(Landroid/content/res/ColorStateList;)V

    iget-object v1, v0, Lnb8;->g:Ljava/lang/String;

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Ljf7;

    const/16 v2, 0x19

    invoke-direct {v1, p0, v0, v2}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v6, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_bc
    return-void
.end method
