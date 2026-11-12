.class public Lcd9;
.super Ls63;
.source "SourceFile"

# interfaces
.implements Ljbl;
.implements Lgi2;


# instance fields
.field public final l:Lumi;

.field public final m:Ljava/util/ArrayList;

.field public n:I

.field public o:Lne5;

.field public p:Lrma;

.field public q:Loml;

.field public r:Landroid/graphics/Bitmap;

.field public s:Ljava/lang/String;

.field public t:Ljava/lang/String;

.field public u:Lod9;

.field public v:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ls63;-><init>()V

    sget-object v0, Lvml;->d:Lumi;

    iput-object v0, p0, Lcd9;->l:Lumi;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcd9;->m:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput v0, p0, Lcd9;->n:I

    return-void
.end method


# virtual methods
.method public final A0(I)V
    .registers 4

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v0, 0x3

    if-eqz p1, :cond_1d

    const/4 v1, 0x1

    if-eq p1, v1, :cond_e

    const/4 v1, 0x2

    if-eq p1, v1, :cond_e

    return-void

    :cond_e
    const p1, 0x7f14079e

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput v0, p0, Lcd9;->n:I

    iput-object p1, p0, Lcd9;->t:Ljava/lang/String;

    invoke-virtual {p0}, Lcd9;->y0()V

    return-void

    :cond_1d
    const p1, 0x7f14079f

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput v0, p0, Lcd9;->n:I

    iput-object p1, p0, Lcd9;->t:Ljava/lang/String;

    invoke-virtual {p0}, Lcd9;->y0()V

    return-void
.end method

.method public final B0(I)V
    .registers 4

    iget-object v0, p0, Lcd9;->u:Lod9;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lryl;->g0()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcd9;->u:Lod9;

    :cond_a
    new-instance v0, Lbn7;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Lbn7;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Ln99;

    invoke-direct {v1}, Ln99;-><init>()V

    iput-object v0, v1, Ln99;->l:Lbn7;

    iput p1, v1, Ln99;->m:I

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v1, p0}, Ls63;->w0(Landroid/content/Context;)V

    return-void
.end method

.method public final C0(Ljava/lang/String;)V
    .registers 12

    const/4 v0, 0x1

    iput v0, p0, Lcd9;->n:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcd9;->t:Ljava/lang/String;

    invoke-virtual {p0}, Lcd9;->y0()V

    iget-object v1, p0, Lcd9;->q:Loml;

    if-eqz v1, :cond_10

    invoke-virtual {v1, v0}, Loml;->cancel(Z)Z

    :cond_10
    iput-object p1, p0, Lcd9;->s:Ljava/lang/String;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ls49;

    const/4 v3, 0x6

    invoke-direct {v2, v3}, Ls49;-><init>(B)V

    iget-object v3, p0, Lcd9;->l:Lumi;

    invoke-virtual {v3, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v2

    new-instance v4, Lbm8;

    const/16 v5, 0xd

    invoke-direct {v4, p0, v5}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnml;->b(Lnml;)V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const v3, 0x7f070233

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    const v3, 0x7f04076e

    const v4, 0x7f06063b

    invoke-static {v3, v1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v7

    const v3, 0x7f0806f1

    invoke-static {v3, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const v4, 0x7f070232

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    new-instance v4, Lfr;

    const/16 v5, 0x13

    invoke-direct {v4, v0, v0, v5}, Lfr;-><init>(IIB)V

    new-instance v0, Lseh;

    invoke-direct {v0, v3, v4}, Lseh;-><init>(Landroid/graphics/drawable/Drawable;Lfr;)V

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v0, 0x7f0806f0

    invoke-static {v0, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    if-eqz p1, :cond_7f

    if-lez v6, :cond_7f

    new-instance v4, Lteh;

    move-object v5, p1

    invoke-direct/range {v4 .. v9}, Lteh;-><init>(Ljava/lang/String;IILjava/util/ArrayList;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v4}, Lnml;->a(Ljava/lang/Object;)Loml;

    move-result-object p1

    iput-object p1, p0, Lcd9;->q:Loml;

    return-void

    :cond_7f
    invoke-static {}, Lhai;->d()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Lryl;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lrma;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v0

    iget-object v1, p0, Lcd9;->l:Lumi;

    invoke-direct {p1, v0, v1, p0}, Lrma;-><init>(Lbf9;Lumi;Lcd9;)V

    iput-object p1, p0, Lcd9;->p:Lrma;

    return-void
.end method

.method public final onDestroy()V
    .registers 4

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lcd9;->q:Loml;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Loml;->cancel(Z)Z

    iput-object v1, p0, Lcd9;->q:Loml;

    :cond_e
    iget-object v0, p0, Lcd9;->p:Lrma;

    if-eqz v0, :cond_22

    invoke-virtual {v0}, Lrma;->f()V

    iget-object v2, v0, Lrma;->d:Ljava/lang/Object;

    check-cast v2, Lbf9;

    iget-object v0, v0, Lrma;->c:Ljava/lang/Object;

    check-cast v0, Lj99;

    invoke-virtual {v2, v0}, Lbf9;->D(Lhxl;)V

    iput-object v1, p0, Lcd9;->p:Lrma;

    :cond_22
    return-void
.end method

.method public final p(Ljava/lang/String;Ls14;)V
    .registers 5

    new-instance v0, Lgl6;

    const/16 v1, 0x16

    invoke-direct {v0, p0, p1, p2, v1}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lcd9;->z0(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lepj;)Ldgh;
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x2

    const/4 v6, 0x1

    const-string v8, "parent"

    const-string v9, "Missing required view with ID: "

    const v10, 0x7f0a0bd6

    const v11, 0x7f0a0aad

    const v12, 0x7f0a08f0

    const v13, 0x7f0a088a

    const v14, 0x7f0a07c5

    const v15, 0x7f0a04bb

    const/16 p3, 0x0

    const v7, 0x7f0a03ad

    const/16 v16, 0x0

    const v5, 0x7f0a02a3

    if-eqz v3, :cond_bc

    if-eq v3, v6, :cond_3c

    if-eq v3, v4, :cond_3c

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3c

    const/4 v4, 0x4

    if-eq v3, v4, :cond_3c

    invoke-static {}, Lh9o;->p()V

    return-object p3

    :cond_3c
    if-eqz v2, :cond_b8

    const v3, 0x7f0d01c8

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_a7

    invoke-static {v7, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v22, v1

    check-cast v22, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v22, :cond_a5

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_a3

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lcom/google/android/material/button/MaterialButton;

    if-eqz v20, :cond_a1

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v21, :cond_9f

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v19, :cond_9d

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lcom/opera/android/custom_views/Spinner;

    if-eqz v18, :cond_9b

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v23, v1

    check-cast v23, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v23, :cond_a8

    new-instance v17, Lne5;

    sget-object v24, Lick;->a:Lick;

    invoke-direct/range {v17 .. v24}, Lne5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_97
    move-object/from16 v1, v17

    goto/16 :goto_13e

    :cond_9b
    move v10, v11

    goto :goto_a8

    :cond_9d
    move v10, v12

    goto :goto_a8

    :cond_9f
    move v10, v13

    goto :goto_a8

    :cond_a1
    move v10, v14

    goto :goto_a8

    :cond_a3
    move v10, v15

    goto :goto_a8

    :cond_a5
    move v10, v7

    goto :goto_a8

    :cond_a7
    move v10, v5

    :cond_a8
    :goto_a8
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3

    :cond_b8
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3

    :cond_bc
    if-eqz v2, :cond_1ea

    const v3, 0x7f0d01c9

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_1d9

    const v1, 0x7f0a0390

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_1d7

    invoke-static {v7, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v22, v1

    check-cast v22, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v22, :cond_1d5

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_1d3

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lcom/google/android/material/button/MaterialButton;

    if-eqz v20, :cond_1d1

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v21, :cond_1cf

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v19, :cond_1cd

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lcom/opera/android/custom_views/Spinner;

    if-eqz v18, :cond_1cb

    const v1, 0x7f0a0aca

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout;

    if-eqz v5, :cond_1d7

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v23, v1

    check-cast v23, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v23, :cond_1da

    new-instance v17, Lne5;

    new-instance v1, Lkck;

    new-array v2, v4, [Landroid/view/ViewGroup;

    aput-object v5, v2, v16

    aput-object v3, v2, v6

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Lkck;-><init>(Ljava/util/List;)V

    move-object/from16 v24, v1

    invoke-direct/range {v17 .. v24}, Lne5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_97

    :goto_13e
    iput-object v1, v0, Lcd9;->o:Lne5;

    iget-object v1, v1, Lne5;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/Spinner;

    invoke-virtual {v1}, Lcom/opera/android/custom_views/Spinner;->a()V

    iget-object v1, v0, Lcd9;->o:Lne5;

    iget-object v1, v1, Lne5;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v2, Lbd9;

    move/from16 v3, v16

    invoke-direct {v2, v0, v3}, Lbd9;-><init>(Lcd9;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lcd9;->o:Lne5;

    iget-object v1, v1, Lne5;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v2, Lpc5;

    const/16 v3, 0x16

    invoke-direct {v2, v0, v3}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_16d

    invoke-static {v3, v1, v2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_16d
    iget-object v1, v0, Lcd9;->o:Lne5;

    iget-object v1, v1, Lne5;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v2, Lkd9;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lagc;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f14120e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f14120d

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v5, "%1$s"

    invoke-static {v1, v4, v5, v3, v2}, Lphj;->c0(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lagc;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v1

    invoke-virtual {v1}, Ldb;->f()Z

    move-result v1

    if-nez v1, :cond_1c1

    iget-object v1, v0, Lcd9;->o:Lne5;

    iget-object v1, v1, Lne5;->c:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lcd9;->o:Lne5;

    iget-object v1, v1, Lne5;->c:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lbd9;

    invoke-direct {v2, v0, v6}, Lbd9;-><init>(Lcd9;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1c1
    invoke-virtual {v0}, Lcd9;->y0()V

    iget-object v0, v0, Lcd9;->o:Lne5;

    iget-object v0, v0, Lne5;->g:Ljava/lang/Object;

    check-cast v0, Ldgh;

    return-object v0

    :cond_1cb
    move v10, v11

    goto :goto_1da

    :cond_1cd
    move v10, v12

    goto :goto_1da

    :cond_1cf
    move v10, v13

    goto :goto_1da

    :cond_1d1
    move v10, v14

    goto :goto_1da

    :cond_1d3
    move v10, v15

    goto :goto_1da

    :cond_1d5
    move v10, v7

    goto :goto_1da

    :cond_1d7
    move v10, v1

    goto :goto_1da

    :cond_1d9
    move v10, v5

    :cond_1da
    :goto_1da
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3

    :cond_1ea
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3
.end method

.method public final t0()V
    .registers 3

    iget-object v0, p0, Lcd9;->u:Lod9;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lryl;->g0()V

    iput-object v1, p0, Lcd9;->u:Lod9;

    :cond_a
    iput-object v1, p0, Lcd9;->s:Ljava/lang/String;

    iput-object v1, p0, Lcd9;->o:Lne5;

    return-void
.end method

.method public final v0()V
    .registers 5

    iget-boolean v0, p0, Lcd9;->v:Z

    if-nez v0, :cond_1e

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v1

    if-nez v1, :cond_16

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcd9;->v:Z

    goto :goto_1e

    :cond_16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Lcom/google/android/gms/common/GoogleApiAvailability;->showErrorDialogFragment(Landroid/app/Activity;II)Z

    :cond_1e
    :goto_1e
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcd9;->m:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    new-instance v1, Lcn7;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v0, v2}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "flow-generate"

    return-object p0
.end method

.method public final y0()V
    .registers 5

    iget-object v0, p0, Lcd9;->o:Lne5;

    if-eqz v0, :cond_29

    iget-object v0, v0, Lne5;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v1, p0, Lcd9;->r:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcd9;->o:Lne5;

    iget-object v0, v0, Lne5;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p0, Lcd9;->t:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v0, p0, Lcd9;->n:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    if-eqz v0, :cond_7a

    const/4 v3, 0x1

    if-eq v0, v3, :cond_52

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2a

    :cond_29
    return-void

    :cond_2a
    iget-object v0, p0, Lcd9;->o:Lne5;

    iget-object v0, v0, Lne5;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/Spinner;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lcd9;->o:Lne5;

    iget-object v0, v0, Lne5;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lcd9;->o:Lne5;

    iget-object p0, p0, Lne5;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void

    :cond_52
    iget-object v0, p0, Lcd9;->o:Lne5;

    iget-object v0, v0, Lne5;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/Spinner;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lcd9;->o:Lne5;

    iget-object v0, v0, Lne5;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lcd9;->o:Lne5;

    iget-object p0, p0, Lne5;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void

    :cond_7a
    iget-object v0, p0, Lcd9;->o:Lne5;

    iget-object v0, v0, Lne5;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/Spinner;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lcd9;->o:Lne5;

    iget-object v0, v0, Lne5;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lcd9;->o:Lne5;

    iget-object p0, p0, Lne5;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final z0(Ljava/lang/Runnable;)V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_a
    iget-object p0, p0, Lcd9;->m:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
