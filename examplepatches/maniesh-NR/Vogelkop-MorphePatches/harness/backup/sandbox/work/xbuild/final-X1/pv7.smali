.class public final Lpv7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfyj;

.field public final b:Lha6;

.field public final c:Lfe5;

.field public final d:Lwt7;

.field public final synthetic e:Lrv7;


# direct methods
.method public constructor <init>(Lrv7;Lfyj;Liv7;Ltsd;Lwzg;)V
    .registers 57

    move-object/from16 v2, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    iget-object v10, v8, Lrv7;->u:Lpde;

    iget-object v11, v8, Lrv7;->k:Ligi;

    iget-object v12, v8, Lrv7;->d:Lhz4;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v8, v2, Lpv7;->e:Lrv7;

    iput-object v9, v2, Lpv7;->a:Lfyj;

    iget-object v0, v8, Lrv7;->c:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iget-object v3, v9, Lfyj;->a:Ldyj;

    iget-object v13, v9, Lfyj;->c:Ljxj;

    iget-boolean v14, v9, Lfyj;->e:Z

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v6, 0x1

    const/16 v16, 0x0

    const-string v5, "Missing required view with ID: "

    const/4 v4, 0x0

    if-eqz v3, :cond_3cb

    const v7, 0x7f0a003f

    if-eq v3, v6, :cond_2bf

    const/4 v15, 0x2

    if-ne v3, v15, :cond_2bb

    const v3, 0x7f0a0064

    const v15, 0x7f0a0040

    if-ne v14, v6, :cond_173

    const v6, 0x7f0d03df

    invoke-virtual {v1, v6, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v48, v0

    check-cast v48, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v48, :cond_163

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v49, v0

    check-cast v49, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v49, :cond_162

    const v0, 0x7f0a004d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v42, v6

    check-cast v42, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v42, :cond_15e

    const v0, 0x7f0a0057

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v36, v6

    check-cast v36, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v36, :cond_15a

    const v0, 0x7f0a005c

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v40, v6

    check-cast v40, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v40, :cond_156

    const v0, 0x7f0a0062

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v39, v6

    check-cast v39, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v39, :cond_152

    const v0, 0x7f0a0063

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v37, v6

    check-cast v37, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v37, :cond_14e

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v38, v0

    check-cast v38, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v38, :cond_14c

    const v0, 0x7f0a006d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v41, v3

    check-cast v41, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v41, :cond_148

    const v0, 0x7f0a0116

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v46, v3

    check-cast v46, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v46, :cond_144

    const v0, 0x7f0a01c9

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v3, :cond_140

    const v0, 0x7f0a0365

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz v6, :cond_13c

    const v0, 0x7f0a038f

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v7, :cond_138

    const v0, 0x7f0a06d2

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v50, v7

    check-cast v50, Lcom/google/android/material/chip/ChipGroup;

    if-eqz v50, :cond_134

    const v0, 0x7f0a06d3

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/HorizontalScrollView;

    if-eqz v7, :cond_130

    move-object/from16 v32, v1

    check-cast v32, Landroid/widget/FrameLayout;

    const v0, 0x7f0a0c66

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_12c

    invoke-virtual {v6, v4}, Lcom/opera/android/widget/UrlFieldEditText;->setHorizontallyScrolling(Z)V

    new-instance v0, Lh5k;

    invoke-direct {v0, v6, v7}, Lh5k;-><init>(Landroid/widget/TextView;Landroid/view/View;)V

    new-instance v0, Lwtm;

    invoke-direct {v0, v3, v6}, Lwtm;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/widget/UrlFieldEditText;)V

    new-instance v31, Lha6;

    const/16 v45, 0x0

    const/16 v47, 0x0

    const/16 v34, 0x0

    const/16 v43, 0x0

    const/16 v44, 0x0

    move-object/from16 v33, v3

    move-object/from16 v35, v6

    invoke-direct/range {v31 .. v50}, Lha6;-><init>(Landroid/widget/FrameLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Lcom/opera/android/widget/UrlFieldEditText;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/widget/ThemeableLottieAnimationView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageCheckableWithText;Lcom/opera/android/custom_views/StylingImageButton;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/google/android/material/chip/ChipGroup;)V

    :goto_128
    move-object/from16 v15, v31

    goto/16 :goto_5d2

    :cond_12c
    const v7, 0x7f0a0c66

    goto :goto_163

    :cond_130
    const v7, 0x7f0a06d3

    goto :goto_163

    :cond_134
    const v7, 0x7f0a06d2

    goto :goto_163

    :cond_138
    const v7, 0x7f0a038f

    goto :goto_163

    :cond_13c
    const v7, 0x7f0a0365

    goto :goto_163

    :cond_140
    const v7, 0x7f0a01c9

    goto :goto_163

    :cond_144
    const v7, 0x7f0a0116

    goto :goto_163

    :cond_148
    const v7, 0x7f0a006d

    goto :goto_163

    :cond_14c
    move v7, v3

    goto :goto_163

    :cond_14e
    const v7, 0x7f0a0063

    goto :goto_163

    :cond_152
    const v7, 0x7f0a0062

    goto :goto_163

    :cond_156
    const v7, 0x7f0a005c

    goto :goto_163

    :cond_15a
    const v7, 0x7f0a0057

    goto :goto_163

    :cond_15e
    const v7, 0x7f0a004d

    goto :goto_163

    :cond_162
    move v7, v15

    :cond_163
    :goto_163
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v16

    :cond_173
    const v6, 0x7f0d03e0

    invoke-virtual {v1, v6, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v48, v0

    check-cast v48, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v48, :cond_2aa

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v49, v0

    check-cast v49, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v49, :cond_2a8

    const v0, 0x7f0a004d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v42, v6

    check-cast v42, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v42, :cond_2a4

    const v0, 0x7f0a0057

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v36, v6

    check-cast v36, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v36, :cond_2a0

    const v0, 0x7f0a005c

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v40, v6

    check-cast v40, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v40, :cond_29c

    const v0, 0x7f0a0062

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v39, v6

    check-cast v39, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v39, :cond_298

    const v0, 0x7f0a0063

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v37, v6

    check-cast v37, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v37, :cond_294

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v38, v0

    check-cast v38, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v38, :cond_292

    const v0, 0x7f0a006d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v41, v3

    check-cast v41, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v41, :cond_28e

    const v0, 0x7f0a0116

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v46, v3

    check-cast v46, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v46, :cond_28a

    const v0, 0x7f0a01b9

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v3, :cond_286

    const v0, 0x7f0a01c9

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v3, :cond_282

    const v0, 0x7f0a02f4

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v47

    if-eqz v47, :cond_27e

    const v0, 0x7f0a0365

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz v6, :cond_27a

    const v0, 0x7f0a038f

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v7, :cond_276

    const v0, 0x7f0a06d2

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v50, v7

    check-cast v50, Lcom/google/android/material/chip/ChipGroup;

    if-eqz v50, :cond_274

    const v7, 0x7f0a06d3

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/HorizontalScrollView;

    if-eqz v0, :cond_2aa

    move-object/from16 v32, v1

    check-cast v32, Landroid/widget/FrameLayout;

    const v0, 0x7f0a0c66

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_270

    invoke-virtual {v6, v4}, Lcom/opera/android/widget/UrlFieldEditText;->setHorizontallyScrolling(Z)V

    new-instance v0, Lh5k;

    invoke-direct {v0, v6, v7}, Lh5k;-><init>(Landroid/widget/TextView;Landroid/view/View;)V

    new-instance v0, Lwtm;

    invoke-direct {v0, v3, v6}, Lwtm;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/widget/UrlFieldEditText;)V

    new-instance v31, Lha6;

    const/16 v44, 0x0

    const/16 v45, 0x0

    const/16 v34, 0x0

    const/16 v43, 0x0

    move-object/from16 v33, v3

    move-object/from16 v35, v6

    invoke-direct/range {v31 .. v50}, Lha6;-><init>(Landroid/widget/FrameLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Lcom/opera/android/widget/UrlFieldEditText;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/widget/ThemeableLottieAnimationView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageCheckableWithText;Lcom/opera/android/custom_views/StylingImageButton;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/google/android/material/chip/ChipGroup;)V

    goto/16 :goto_128

    :cond_270
    const v4, 0x7f0a0c66

    goto :goto_2ab

    :cond_274
    move v4, v0

    goto :goto_2ab

    :cond_276
    const v4, 0x7f0a038f

    goto :goto_2ab

    :cond_27a
    const v4, 0x7f0a0365

    goto :goto_2ab

    :cond_27e
    const v4, 0x7f0a02f4

    goto :goto_2ab

    :cond_282
    const v4, 0x7f0a01c9

    goto :goto_2ab

    :cond_286
    const v4, 0x7f0a01b9

    goto :goto_2ab

    :cond_28a
    const v4, 0x7f0a0116

    goto :goto_2ab

    :cond_28e
    const v4, 0x7f0a006d

    goto :goto_2ab

    :cond_292
    move v4, v3

    goto :goto_2ab

    :cond_294
    const v4, 0x7f0a0063

    goto :goto_2ab

    :cond_298
    const v4, 0x7f0a0062

    goto :goto_2ab

    :cond_29c
    const v4, 0x7f0a005c

    goto :goto_2ab

    :cond_2a0
    const v4, 0x7f0a0057

    goto :goto_2ab

    :cond_2a4
    const v4, 0x7f0a004d

    goto :goto_2ab

    :cond_2a8
    move v4, v15

    goto :goto_2ab

    :cond_2aa
    move v4, v7

    :goto_2ab
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v16

    :cond_2bb
    invoke-static {}, Lh9o;->p()V

    throw v16

    :cond_2bf
    const v3, 0x7f0d03e1

    invoke-virtual {v1, v3, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v48, v0

    check-cast v48, Landroid/widget/ImageView;

    if-eqz v48, :cond_3bb

    const v0, 0x7f0a004d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v42, v3

    check-cast v42, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v42, :cond_3b8

    const v0, 0x7f0a0050

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v45, v3

    check-cast v45, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v45, :cond_3b6

    const v3, 0x7f0a0057

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v36, v0

    check-cast v36, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v36, :cond_3b2

    const v0, 0x7f0a005c

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v40, v3

    check-cast v40, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v40, :cond_3ae

    const v0, 0x7f0a0062

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v39, v3

    check-cast v39, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v39, :cond_3aa

    const v0, 0x7f0a0063

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v37, v3

    check-cast v37, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v37, :cond_3a6

    const v0, 0x7f0a01c9

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v33, v3

    check-cast v33, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v33, :cond_3a2

    const v0, 0x7f0a0365

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v35, v3

    check-cast v35, Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz v35, :cond_39e

    const v0, 0x7f0a038f

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v3, :cond_39a

    const v7, 0x7f0a0393

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v0, :cond_3bb

    const v7, 0x7f0a093b

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v34, v0

    check-cast v34, Landroid/widget/ImageView;

    if-eqz v34, :cond_3bb

    move-object/from16 v32, v1

    check-cast v32, Landroid/widget/FrameLayout;

    const v7, 0x7f0a0ac8

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v0, :cond_3bb

    const v7, 0x7f0a0acb

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v0, :cond_3bb

    const v7, 0x7f0a0acf

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Space;

    if-eqz v0, :cond_3bb

    new-instance v31, Lha6;

    const/16 v49, 0x0

    const/16 v50, 0x0

    const/16 v38, 0x0

    const/16 v41, 0x0

    const/16 v43, 0x0

    const/16 v44, 0x0

    const/16 v46, 0x0

    const/16 v47, 0x0

    invoke-direct/range {v31 .. v50}, Lha6;-><init>(Landroid/widget/FrameLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Lcom/opera/android/widget/UrlFieldEditText;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/widget/ThemeableLottieAnimationView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageCheckableWithText;Lcom/opera/android/custom_views/StylingImageButton;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/google/android/material/chip/ChipGroup;)V

    goto/16 :goto_128

    :cond_39a
    const v7, 0x7f0a038f

    goto :goto_3bb

    :cond_39e
    const v7, 0x7f0a0365

    goto :goto_3bb

    :cond_3a2
    const v7, 0x7f0a01c9

    goto :goto_3bb

    :cond_3a6
    const v7, 0x7f0a0063

    goto :goto_3bb

    :cond_3aa
    const v7, 0x7f0a0062

    goto :goto_3bb

    :cond_3ae
    const v7, 0x7f0a005c

    goto :goto_3bb

    :cond_3b2
    const v7, 0x7f0a0057

    goto :goto_3bb

    :cond_3b6
    move v7, v0

    goto :goto_3bb

    :cond_3b8
    const v7, 0x7f0a004d

    :cond_3bb
    :goto_3bb
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v16

    :cond_3cb
    const v3, 0x7f0a0052

    const v6, 0x7f0a0051

    const v7, 0x7f0a003e

    const/4 v15, 0x1

    if-ne v14, v15, :cond_4eb

    const v15, 0x7f0d03de

    invoke-virtual {v1, v15, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v43, v0

    check-cast v43, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v43, :cond_4db

    const v0, 0x7f0a004d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v42, v7

    check-cast v42, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v42, :cond_4d8

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v44, v0

    check-cast v44, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v44, :cond_4d6

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_4d4

    const v0, 0x7f0a0057

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v36, v3

    check-cast v36, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v36, :cond_4d0

    const v0, 0x7f0a005c

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v40, v3

    check-cast v40, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v40, :cond_4cc

    const v0, 0x7f0a0062

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v39, v3

    check-cast v39, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v39, :cond_4c8

    const v0, 0x7f0a0063

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v37, v3

    check-cast v37, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v37, :cond_4c4

    const v0, 0x7f0a006d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v41, v3

    check-cast v41, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v41, :cond_4c0

    const v0, 0x7f0a0116

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v46, v3

    check-cast v46, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v46, :cond_4bc

    const v0, 0x7f0a01c9

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v3, :cond_4b8

    const v0, 0x7f0a0365

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz v6, :cond_4b4

    const v0, 0x7f0a038f

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v7, :cond_4b0

    move-object/from16 v32, v1

    check-cast v32, Landroid/widget/FrameLayout;

    const v0, 0x7f0a0c66

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_4ac

    invoke-virtual {v6, v4}, Lcom/opera/android/widget/UrlFieldEditText;->setHorizontallyScrolling(Z)V

    new-instance v0, Lh5k;

    invoke-direct {v0, v6, v7}, Lh5k;-><init>(Landroid/widget/TextView;Landroid/view/View;)V

    new-instance v0, Lwtm;

    invoke-direct {v0, v3, v6}, Lwtm;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/widget/UrlFieldEditText;)V

    new-instance v31, Lha6;

    const/16 v49, 0x0

    const/16 v50, 0x0

    const/16 v34, 0x0

    const/16 v38, 0x0

    const/16 v45, 0x0

    const/16 v47, 0x0

    const/16 v48, 0x0

    move-object/from16 v33, v3

    move-object/from16 v35, v6

    invoke-direct/range {v31 .. v50}, Lha6;-><init>(Landroid/widget/FrameLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Lcom/opera/android/widget/UrlFieldEditText;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/widget/ThemeableLottieAnimationView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageCheckableWithText;Lcom/opera/android/custom_views/StylingImageButton;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/google/android/material/chip/ChipGroup;)V

    goto/16 :goto_128

    :cond_4ac
    const v7, 0x7f0a0c66

    goto :goto_4db

    :cond_4b0
    const v7, 0x7f0a038f

    goto :goto_4db

    :cond_4b4
    const v7, 0x7f0a0365

    goto :goto_4db

    :cond_4b8
    const v7, 0x7f0a01c9

    goto :goto_4db

    :cond_4bc
    const v7, 0x7f0a0116

    goto :goto_4db

    :cond_4c0
    const v7, 0x7f0a006d

    goto :goto_4db

    :cond_4c4
    const v7, 0x7f0a0063

    goto :goto_4db

    :cond_4c8
    const v7, 0x7f0a0062

    goto :goto_4db

    :cond_4cc
    const v7, 0x7f0a005c

    goto :goto_4db

    :cond_4d0
    const v7, 0x7f0a0057

    goto :goto_4db

    :cond_4d4
    move v7, v3

    goto :goto_4db

    :cond_4d6
    move v7, v6

    goto :goto_4db

    :cond_4d8
    const v7, 0x7f0a004d

    :cond_4db
    :goto_4db
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v16

    :cond_4eb
    const v15, 0x7f0d03e2

    invoke-virtual {v1, v15, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v43, v0

    check-cast v43, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v43, :cond_866

    const v0, 0x7f0a004d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v42, v7

    check-cast v42, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v42, :cond_862

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v44, v0

    check-cast v44, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v44, :cond_85e

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_85a

    const v0, 0x7f0a0057

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v36, v3

    check-cast v36, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v36, :cond_862

    const v3, 0x7f0a005c

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v40, v0

    check-cast v40, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v40, :cond_85a

    const v0, 0x7f0a0062

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v39, v3

    check-cast v39, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v39, :cond_862

    const v3, 0x7f0a0063

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v37, v0

    check-cast v37, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v37, :cond_85a

    const v0, 0x7f0a006d

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v41, v3

    check-cast v41, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v41, :cond_862

    const v3, 0x7f0a0116

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object/from16 v46, v0

    check-cast v46, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v46, :cond_85a

    const v0, 0x7f0a01b9

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v3, :cond_862

    const v3, 0x7f0a01c9

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :cond_85a

    const v6, 0x7f0a02f4

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v47

    if-eqz v47, :cond_85e

    const v3, 0x7f0a0365

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz v6, :cond_85a

    const v7, 0x7f0a038f

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v3, :cond_866

    move-object/from16 v32, v1

    check-cast v32, Landroid/widget/FrameLayout;

    const v3, 0x7f0a0c66

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_85a

    invoke-virtual {v6, v4}, Lcom/opera/android/widget/UrlFieldEditText;->setHorizontallyScrolling(Z)V

    new-instance v1, Lh5k;

    invoke-direct {v1, v6, v7}, Lh5k;-><init>(Landroid/widget/TextView;Landroid/view/View;)V

    new-instance v1, Lwtm;

    invoke-direct {v1, v0, v6}, Lwtm;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/widget/UrlFieldEditText;)V

    new-instance v31, Lha6;

    const/16 v49, 0x0

    const/16 v50, 0x0

    const/16 v34, 0x0

    const/16 v38, 0x0

    const/16 v45, 0x0

    const/16 v48, 0x0

    move-object/from16 v33, v0

    move-object/from16 v35, v6

    invoke-direct/range {v31 .. v50}, Lha6;-><init>(Landroid/widget/FrameLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Lcom/opera/android/widget/UrlFieldEditText;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/widget/ThemeableLottieAnimationView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageCheckableWithText;Lcom/opera/android/custom_views/StylingImageButton;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/google/android/material/chip/ChipGroup;)V

    goto/16 :goto_128

    :goto_5d2
    iget-object v0, v15, Lha6;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/UrlFieldEditText;

    iput-object v15, v2, Lpv7;->b:Lha6;

    new-instance v1, Lfe5;

    iget-object v3, v8, Lrv7;->a:Lfe5;

    iget-object v3, v3, Lfe5;->b:Lqdc;

    invoke-static {v3}, Loup;->i0(Ltcc;)Lpde;

    move-result-object v3

    invoke-direct {v1, v3}, Lfe5;-><init>(Lpde;)V

    iput-object v1, v2, Lpv7;->c:Lfe5;

    iget-object v5, v12, Lhz4;->e:Ljava/lang/Object;

    move-object/from16 v17, v5

    check-cast v17, Ldbf;

    iget-object v5, v8, Lrv7;->n:Lyv7;

    iget-object v5, v5, Lyv7;->i:Lpde;

    iget-object v6, v12, Lhz4;->c:Ljava/lang/Object;

    check-cast v6, Ld8e;

    invoke-virtual {v6}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v18, v6

    check-cast v18, Lm0a;

    iget-object v6, v8, Lrv7;->m:Lhd;

    new-instance v23, Lq2;

    move-object/from16 v19, v6

    const/4 v6, 0x0

    const/16 v7, 0x1d

    move-object/from16 v20, v1

    const/4 v1, 0x0

    move-object/from16 v21, v3

    const-class v3, Lpv7;

    const-string v4, "onOpenAttachmentMenu"

    move-object/from16 v24, v5

    const-string v5, "onOpenAttachmentMenu()V"

    move-object/from16 v25, v0

    move-object/from16 v26, v10

    move-object/from16 v27, v21

    move-object/from16 v0, v23

    invoke-direct/range {v0 .. v7}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v7, v2

    move-object/from16 v28, v3

    iget-object v1, v8, Lrv7;->f:Lp8f;

    iget-object v2, v8, Lrv7;->g:Lpde;

    iget-object v3, v12, Lhz4;->t:Ljava/lang/Object;

    check-cast v3, Ld8e;

    iget-object v3, v3, Ld8e;->b:Ljava/lang/Object;

    move-object/from16 v22, v3

    check-cast v22, Lu0a;

    move-object/from16 v5, v17

    move-object/from16 v17, v11

    new-instance v11, Lwt7;

    new-instance v3, Llv7;

    const/4 v4, 0x3

    invoke-direct {v3, v8, v4}, Llv7;-><init>(Lrv7;B)V

    move-object/from16 v21, v2

    move-object v0, v12

    move v2, v14

    move-object/from16 v12, v20

    move-object/from16 v20, v1

    move-object v14, v5

    move-object v1, v13

    move-object v13, v15

    move-object/from16 v15, v24

    move-object/from16 v24, v3

    move-object/from16 v16, p3

    invoke-direct/range {v11 .. v24}, Lwt7;-><init>(Lfe5;Lha6;Ldbf;Lpde;Liv7;Ligi;Lm0a;Lhd;Lp8f;Lpde;Lu0a;Lq2;Llv7;)V

    move-object v4, v11

    move-object/from16 v11, v17

    iput-object v4, v7, Lpv7;->d:Lwt7;

    invoke-static/range {v25 .. v25}, Lphj;->Z(Landroid/widget/TextView;)V

    iget-byte v4, v9, Lfyj;->b:B

    move-object/from16 v5, v25

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    new-instance v4, Lov7;

    invoke-direct {v4}, Lov7;-><init>()V

    invoke-virtual {v5, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    if-eqz v1, :cond_676

    new-instance v4, Lql2;

    new-instance v6, Lpl2;

    iget v14, v1, Ljxj;->a:I

    iget v1, v1, Ljxj;->b:I

    invoke-direct {v6, v14, v1}, Lpl2;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lql2;-><init>(Lcom/opera/android/widget/UrlFieldEditText;Lpl2;)V

    :cond_676
    iget-object v1, v13, Lha6;->o:Ljava/lang/Object;

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_74a

    iget-object v4, v9, Lfyj;->a:Ldyj;

    sget-object v5, Ldyj;->c:Ldyj;

    iget-object v6, v13, Lha6;->p:Ljava/lang/Object;

    check-cast v6, Landroid/view/View;

    if-ne v4, v5, :cond_720

    new-instance v4, Li3j;

    iget-object v5, v0, Lhz4;->c:Ljava/lang/Object;

    check-cast v5, Ld8e;

    invoke-virtual {v5}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lm0a;

    new-instance v14, Llv7;

    const/4 v15, 0x4

    invoke-direct {v14, v8, v15}, Llv7;-><init>(Lrv7;B)V

    new-instance v3, Llv7;

    const/4 v10, 0x5

    invoke-direct {v3, v8, v10}, Llv7;-><init>(Lrv7;B)V

    iget-object v15, v8, Lrv7;->h:Ljv3;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v1, v4, Li3j;->a:Ljava/lang/Object;

    iput-object v6, v4, Li3j;->b:Ljava/lang/Object;

    iget-object v6, v5, Lm0a;->a:Ltah;

    iput-object v6, v4, Li3j;->c:Ljava/lang/Object;

    new-instance v6, Lwf;

    move-object/from16 v29, v0

    new-instance v0, Lua7;

    invoke-direct {v0, v14, v4, v3, v10}, Lua7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v3, 0x4

    invoke-direct {v6, v3}, Lwf;-><init>(B)V

    const/4 v14, 0x0

    invoke-virtual {v6, v14}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance v14, Lyt7;

    invoke-direct {v14, v3}, Lyt7;-><init>(B)V

    new-instance v10, Luk6;

    const/16 v3, 0x12

    invoke-direct {v10, v0, v3}, Luk6;-><init>(Ljava/lang/Object;B)V

    new-instance v3, La3j;

    move/from16 v30, v2

    const/4 v2, 0x4

    invoke-direct {v3, v2}, La3j;-><init>(B)V

    const-class v2, Lmu7;

    invoke-virtual {v6, v2, v14, v10, v3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v2, Lge5;

    const/16 v3, 0x10

    invoke-direct {v2, v0, v15, v3}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lyt7;

    const/4 v10, 0x5

    invoke-direct {v0, v10}, Lyt7;-><init>(B)V

    new-instance v10, La3j;

    const/4 v14, 0x4

    invoke-direct {v10, v14}, La3j;-><init>(B)V

    const-class v14, Llu7;

    invoke-virtual {v6, v14, v2, v0, v10}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    iput-object v6, v4, Li3j;->d:Ljava/lang/Object;

    invoke-virtual {v1, v6}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, v5, Lm0a;->e:Lpde;

    new-instance v1, Lku7;

    const/4 v10, 0x0

    invoke-direct {v1, v4, v10}, Lku7;-><init>(Li3j;B)V

    new-instance v2, Lug;

    invoke-direct {v2, v1, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v12, v2}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v1, Lm57;

    const/16 v2, 0x1b

    invoke-direct {v1, v2}, Lm57;-><init>(B)V

    invoke-static {v0, v1}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v0

    invoke-static {v0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v0

    new-instance v1, Lku7;

    const/4 v15, 0x1

    invoke-direct {v1, v4, v15}, Lku7;-><init>(Li3j;B)V

    new-instance v2, Lug;

    invoke-direct {v2, v1, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v12, v2}, Lekc;->j(Lndc;Lf7f;)V

    goto :goto_74e

    :cond_720
    move-object/from16 v29, v0

    move/from16 v30, v2

    new-instance v17, Lwjh;

    iget-object v0, v8, Lrv7;->m:Lhd;

    new-instance v2, Llv7;

    const/4 v3, 0x6

    invoke-direct {v2, v8, v3}, Llv7;-><init>(Lrv7;B)V

    new-instance v3, Llv7;

    const/4 v4, 0x7

    invoke-direct {v3, v8, v4}, Llv7;-><init>(Lrv7;B)V

    iget-object v4, v8, Lrv7;->h:Ljv3;

    move-object/from16 v21, p3

    move-object/from16 v22, v0

    move-object/from16 v19, v1

    move-object/from16 v23, v2

    move-object/from16 v24, v3

    move-object/from16 v25, v4

    move-object/from16 v20, v6

    move-object/from16 v18, v12

    invoke-direct/range {v17 .. v25}, Lwjh;-><init>(Lfe5;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Liv7;Lhd;Llv7;Llv7;Ljv3;)V

    goto :goto_74e

    :cond_74a
    move-object/from16 v29, v0

    move/from16 v30, v2

    :goto_74e
    iget-object v0, v13, Lha6;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_76b

    new-instance v0, Ligi;

    move-object/from16 v3, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object v1, v12

    move-object/from16 v4, v26

    move-object/from16 v10, v29

    move/from16 v12, v30

    const/4 v14, 0x0

    invoke-direct/range {v0 .. v6}, Ligi;-><init>(Lfe5;Landroid/widget/ImageView;Liv7;Lpde;Ltsd;Lwzg;)V

    move-object/from16 v20, v1

    goto :goto_772

    :cond_76b
    move-object/from16 v20, v12

    move-object/from16 v10, v29

    move/from16 v12, v30

    const/4 v14, 0x0

    :goto_772
    iget-object v0, v13, Lha6;->m:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v0, :cond_781

    new-instance v1, Luk6;

    const/16 v2, 0x13

    invoke-direct {v1, v8, v2}, Luk6;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->w:Lpjk;

    :cond_781
    iget-object v0, v13, Lha6;->q:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Landroid/widget/ImageView;

    if-eqz v8, :cond_7bb

    iget-object v0, v13, Lha6;->r:Ljava/lang/Object;

    move-object v15, v0

    check-cast v15, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v0, v10, Lhz4;->c:Ljava/lang/Object;

    check-cast v0, Ld8e;

    invoke-virtual {v0}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v16, v0

    check-cast v16, Lm0a;

    new-instance v0, Lq2;

    const/4 v6, 0x0

    const/16 v7, 0x1c

    const/4 v1, 0x0

    const-string v4, "onOpenAttachmentMenu"

    const-string v5, "onOpenAttachmentMenu()V"

    move-object/from16 v2, p0

    move-object/from16 v3, v28

    invoke-direct/range {v0 .. v7}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lwjh;

    move-object v7, v0

    move-object v0, v1

    move-object v3, v8

    move-object v2, v9

    move-object v4, v15

    move-object/from16 v5, v16

    move-object/from16 v1, v20

    move-object/from16 v6, v26

    invoke-direct/range {v0 .. v7}, Lwjh;-><init>(Lfe5;Lfyj;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingImageButton;Lm0a;Lpde;Lq2;)V

    goto :goto_7bd

    :cond_7bb
    move-object/from16 v1, v20

    :goto_7bd
    iget-object v0, v13, Lha6;->s:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/chip/ChipGroup;

    if-eqz v0, :cond_7fa

    new-instance v2, Lg77;

    iget-object v3, v10, Lhz4;->c:Ljava/lang/Object;

    check-cast v3, Ld8e;

    invoke-virtual {v3}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lm0a;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v3, v2, Lg77;->a:Ljava/lang/Object;

    iput-object v0, v2, Lg77;->b:Ljava/lang/Object;

    iget-object v0, v3, Lm0a;->e:Lpde;

    new-instance v3, Lm57;

    const/16 v4, 0x1c

    invoke-direct {v3, v4}, Lm57;-><init>(B)V

    invoke-static {v0, v3}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v0

    invoke-static {v0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v0

    iput-object v0, v2, Lg77;->c:Ljava/lang/Object;

    new-instance v3, Lwg5;

    const/16 v4, 0x1d

    invoke-direct {v3, v2, v4}, Lwg5;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lcl4;

    const/16 v4, 0xc

    invoke-direct {v2, v3, v4}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2}, Lekc;->j(Lndc;Lf7f;)V

    :cond_7fa
    iget-object v0, v13, Lha6;->j:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v0, :cond_837

    new-instance v2, Lxbf;

    invoke-direct {v2, v0}, Lxbf;-><init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;)V

    iget-object v3, v11, Ligi;->f:Ljava/lang/Object;

    check-cast v3, Lode;

    iget-object v4, v2, Lxbf;->f:Ljava/lang/Object;

    check-cast v4, Lvbn;

    invoke-interface {v4, v1, v3}, Lvbn;->i(Lndc;Lode;)Z

    move-result v4

    if-nez v4, :cond_837

    iget-object v4, v2, Lxbf;->f:Ljava/lang/Object;

    check-cast v4, Lvbn;

    invoke-interface {v4}, Lvbn;->destroy()V

    new-instance v4, Lplk;

    invoke-direct {v4, v2, v1, v3}, Lplk;-><init>(Lxbf;Lndc;Lode;)V

    iput-object v4, v2, Lxbf;->f:Ljava/lang/Object;

    invoke-virtual {v4}, Lplk;->j()Lo2g;

    move-result-object v3

    iget-object v4, v2, Lxbf;->c:Ljava/lang/Object;

    check-cast v4, Lo2g;

    if-eq v3, v4, :cond_837

    iput-object v3, v2, Lxbf;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Ln2d;->invalidate()V

    iget-object v0, v3, Lo2g;->c:Ljava/lang/Object;

    check-cast v0, Ls75;

    invoke-virtual {v2, v0, v14}, Lxbf;->E(Ls75;Ljava/lang/Runnable;)V

    :cond_837
    const/4 v15, 0x1

    if-ne v12, v15, :cond_84f

    iget-object v0, v13, Lha6;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v2, Lz61;

    invoke-direct {v2}, Lz61;-><init>()V

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_84c

    invoke-virtual {v2, v0}, Lz61;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_84c
    invoke-virtual {v0, v2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_84f
    iget-object v0, v1, Lfe5;->c:Lk9;

    move-object/from16 v2, v27

    invoke-virtual {v2, v0}, Lekc;->k(Lf7f;)V

    invoke-virtual {v1}, Lfe5;->b()V

    return-void

    :cond_85a
    move-object/from16 v14, v16

    move v4, v3

    goto :goto_869

    :cond_85e
    move-object/from16 v14, v16

    move v4, v6

    goto :goto_869

    :cond_862
    move-object/from16 v14, v16

    move v4, v0

    goto :goto_869

    :cond_866
    move-object/from16 v14, v16

    move v4, v7

    :goto_869
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v14
.end method
