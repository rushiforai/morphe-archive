.class public Lp99;
.super Ls63;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ls63;-><init>()V

    return-void
.end method


# virtual methods
.method public final l0(Z)V
    .registers 2

    invoke-virtual {p0}, Lp99;->y0()V

    return-void
.end method

.method public final s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lepj;)Ldgh;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    const-string v8, "parent"

    const-string v9, "Missing required view with ID: "

    const v10, 0x7f0a06b5

    const v11, 0x7f0a0322

    const v12, 0x7f0a0549

    const v13, 0x7f0a02a3

    const v14, 0x7f0a01b1

    const v15, 0x7f0a01b0

    if-eqz v3, :cond_ab

    if-eq v3, v6, :cond_34

    if-eq v3, v5, :cond_34

    const/4 v5, 0x3

    if-eq v3, v5, :cond_34

    const/4 v5, 0x4

    if-eq v3, v5, :cond_34

    invoke-static {}, Lh9o;->p()V

    return-object v7

    :cond_34
    if-eqz v2, :cond_a7

    const v3, 0x7f0d01cd

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroid/view/ViewStub;

    if-eqz v18, :cond_96

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    if-eqz v1, :cond_94

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_92

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v1, :cond_90

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v17, :cond_8e

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_97

    new-instance v16, Ls9i;

    new-instance v1, Lhck;

    new-instance v2, Ldxh;

    const v3, 0x7f0402ec

    invoke-direct {v2, v3}, Ldxh;-><init>(I)V

    invoke-direct {v1, v2}, Lhck;-><init>(Lcxh;)V

    const/16 v21, 0x10

    const/16 v22, 0x0

    move-object/from16 v20, v1

    invoke-direct/range {v16 .. v22}, Ls9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V

    :goto_8a
    move-object/from16 v1, v16

    goto/16 :goto_11b

    :cond_8e
    move v10, v11

    goto :goto_97

    :cond_90
    move v10, v12

    goto :goto_97

    :cond_92
    move v10, v13

    goto :goto_97

    :cond_94
    move v10, v14

    goto :goto_97

    :cond_96
    move v10, v15

    :cond_97
    :goto_97
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_a7
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_ab
    if-eqz v2, :cond_17b

    const v3, 0x7f0d01ce

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroid/view/ViewStub;

    if-eqz v18, :cond_16a

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    if-eqz v1, :cond_168

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_166

    const v1, 0x7f0a0390

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_164

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v1, :cond_162

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v17, :cond_160

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_16b

    const v10, 0x7f0a0aca

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_16b

    new-instance v16, Ls9i;

    new-instance v2, Lkck;

    new-array v5, v5, [Landroid/view/ViewGroup;

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v2, v1}, Lkck;-><init>(Ljava/util/List;)V

    const/16 v21, 0x10

    const/16 v22, 0x0

    move-object/from16 v20, v2

    invoke-direct/range {v16 .. v22}, Ls9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V

    goto/16 :goto_8a

    :goto_11b
    iget-object v2, v1, Ls9i;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v3, Lo99;

    invoke-direct {v3, v0, v4}, Lo99;-><init>(Lp99;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v1, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/view/ViewStub;

    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a01af

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    const v3, 0x7f14059a

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    new-instance v3, Lo99;

    invoke-direct {v3, v0, v6}, Lo99;-><init>(Lp99;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v1, Ls9i;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    const v3, 0x7f14079b

    invoke-virtual {v0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ldg7;

    const/16 v5, 0x14

    invoke-direct {v4, v0, v5}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v3, v4}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    iget-object v0, v1, Ls9i;->e:Ljava/lang/Object;

    check-cast v0, Ldgh;

    return-object v0

    :cond_160
    move v10, v11

    goto :goto_16b

    :cond_162
    move v10, v12

    goto :goto_16b

    :cond_164
    move v10, v1

    goto :goto_16b

    :cond_166
    move v10, v13

    goto :goto_16b

    :cond_168
    move v10, v14

    goto :goto_16b

    :cond_16a
    move v10, v15

    :cond_16b
    :goto_16b
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_17b
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7
.end method

.method public final y0()V
    .registers 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-static {v0}, Lgge;->G0(Landroidx/fragment/app/w;)Z

    move-result v0

    if-eqz v0, :cond_11

    :cond_10
    return-void

    :cond_11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-static {p0}, Ls63;->p0(Landroidx/fragment/app/w;)V

    return-void
.end method
