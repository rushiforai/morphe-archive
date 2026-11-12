.class public Lod9;
.super Ls63;
.source "SourceFile"

# interfaces
.implements Ljbl;


# instance fields
.field public l:I

.field public m:Lode;

.field public n:Ljava/lang/String;

.field public o:Lode;

.field public p:Lcom/opera/api/Callback;

.field public q:Lks3;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ls63;-><init>()V

    return-void
.end method


# virtual methods
.method public final A0()V
    .registers 3

    iget-object v0, p0, Lod9;->q:Lks3;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, v0, Lks3;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lod9;->q:Lks3;

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lod9;->q:Lks3;

    iget-object p0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lod9;->p:Lcom/opera/api/Callback;

    if-nez v0, :cond_8

    return-void

    :cond_8
    const/4 v1, 0x0

    iput-object v1, p0, Lod9;->p:Lcom/opera/api/Callback;

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lepj;)Ldgh;
    .registers 31

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x2

    const/4 v7, 0x1

    const-string v8, "parent"

    const-string v9, "Missing required view with ID: "

    const v11, 0x7f0a0c82

    const v12, 0x7f0a0c81

    const v13, 0x7f0a06c5

    const v14, 0x7f0a0aea

    const v15, 0x7f0a06c9

    const/16 p3, 0x0

    const v6, 0x7f0a064f

    const/16 v16, 0x0

    const v5, 0x7f0a02a3

    const v10, 0x7f0a0108

    if-eqz v3, :cond_cf

    if-eq v3, v7, :cond_3c

    if-eq v3, v4, :cond_3c

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3c

    const/4 v4, 0x4

    if-eq v3, v4, :cond_3c

    invoke-static {}, Lh9o;->p()V

    return-object p3

    :cond_3c
    if-eqz v2, :cond_cb

    const v3, 0x7f0d01d0

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v22, v1

    check-cast v22, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-eqz v22, :cond_bb

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_ba

    invoke-static {v6, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lcom/google/android/material/button/MaterialButton;

    if-eqz v21, :cond_b8

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lcom/google/android/material/button/MaterialButton;

    if-eqz v20, :cond_b6

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_b4

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v18, :cond_b2

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v23, v1

    check-cast v23, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v23, :cond_b0

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v24, v1

    check-cast v24, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v24, :cond_ae

    const v1, 0x7f0a0c83

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v25, v3

    check-cast v25, Landroid/widget/FrameLayout;

    if-eqz v25, :cond_aa

    new-instance v17, Lks3;

    sget-object v26, Lick;->a:Lick;

    invoke-direct/range {v17 .. v26}, Lks3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_a6
    move-object/from16 v1, v17

    goto/16 :goto_160

    :cond_aa
    const v10, 0x7f0a0c83

    goto :goto_bb

    :cond_ae
    move v10, v11

    goto :goto_bb

    :cond_b0
    move v10, v12

    goto :goto_bb

    :cond_b2
    move v10, v13

    goto :goto_bb

    :cond_b4
    move v10, v14

    goto :goto_bb

    :cond_b6
    move v10, v15

    goto :goto_bb

    :cond_b8
    move v10, v6

    goto :goto_bb

    :cond_ba
    move v10, v5

    :cond_bb
    :goto_bb
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3

    :cond_cb
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3

    :cond_cf
    if-eqz v2, :cond_23c

    const v3, 0x7f0d01d1

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v22, v1

    check-cast v22, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-eqz v22, :cond_22b

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_22a

    const v1, 0x7f0a0390

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_228

    invoke-static {v6, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lcom/google/android/material/button/MaterialButton;

    if-eqz v21, :cond_226

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lcom/google/android/material/button/MaterialButton;

    if-eqz v20, :cond_224

    const v1, 0x7f0a0aca

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout;

    if-eqz v5, :cond_228

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_222

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v18, :cond_220

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v23, v1

    check-cast v23, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v23, :cond_21e

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v24, v1

    check-cast v24, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v24, :cond_21c

    const v1, 0x7f0a0c83

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v25, v6

    check-cast v25, Landroid/widget/FrameLayout;

    if-eqz v25, :cond_228

    new-instance v17, Lks3;

    new-instance v1, Lkck;

    new-array v2, v4, [Landroid/view/ViewGroup;

    aput-object v5, v2, v16

    aput-object v3, v2, v7

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Lkck;-><init>(Ljava/util/List;)V

    move-object/from16 v26, v1

    invoke-direct/range {v17 .. v26}, Lks3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_a6

    :goto_160
    iput-object v1, v0, Lod9;->q:Lks3;

    iget v1, v0, Lod9;->l:I

    if-nez v1, :cond_177

    new-instance v1, Lld9;

    move/from16 v2, v16

    invoke-direct {v1, v0, v2}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    iget-object v0, v0, Lod9;->q:Lks3;

    iget-object v0, v0, Lks3;->i:Ljava/lang/Object;

    check-cast v0, Ldgh;

    return-object v0

    :cond_177
    move/from16 v2, v16

    iget-object v1, v0, Lod9;->m:Lode;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    new-instance v4, Lmd9;

    invoke-direct {v4, v0, v2}, Lmd9;-><init>(Lod9;B)V

    invoke-virtual {v1, v3, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v0, Lod9;->m:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lod9;->z0(Ljava/lang/String;)V

    iget v1, v0, Lod9;->l:I

    iget-object v2, v0, Lod9;->q:Lks3;

    if-ne v1, v7, :cond_1f7

    iget-object v1, v2, Lks3;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    const v2, 0x7f1407a3

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object v1, v0, Lod9;->q:Lks3;

    iget-object v1, v1, Lks3;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, v0, Lod9;->n:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f1407a2

    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lod9;->q:Lks3;

    iget-object v1, v1, Lks3;->c:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lnd9;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Lnd9;-><init>(Lod9;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lod9;->q:Lks3;

    iget-object v1, v1, Lks3;->d:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lnd9;

    invoke-direct {v2, v0, v7}, Lnd9;-><init>(Lod9;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lod9;->o:Lode;

    if-eqz v1, :cond_1f1

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    new-instance v3, Lmd9;

    invoke-direct {v3, v0, v7}, Lmd9;-><init>(Lod9;B)V

    invoke-virtual {v1, v2, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v0, Lod9;->o:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lod9;->y0(Ljava/lang/Boolean;)V

    goto :goto_215

    :cond_1f1
    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lod9;->y0(Ljava/lang/Boolean;)V

    goto :goto_215

    :cond_1f7
    iget-object v1, v2, Lks3;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    const v2, 0x7f1407a1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object v1, v0, Lod9;->q:Lks3;

    iget-object v1, v1, Lks3;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lod9;->q:Lks3;

    iget-object v1, v1, Lks3;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_215
    iget-object v0, v0, Lod9;->q:Lks3;

    iget-object v0, v0, Lks3;->i:Ljava/lang/Object;

    check-cast v0, Ldgh;

    return-object v0

    :cond_21c
    move v10, v11

    goto :goto_22b

    :cond_21e
    move v10, v12

    goto :goto_22b

    :cond_220
    move v10, v13

    goto :goto_22b

    :cond_222
    move v10, v14

    goto :goto_22b

    :cond_224
    move v10, v15

    goto :goto_22b

    :cond_226
    move v10, v6

    goto :goto_22b

    :cond_228
    move v10, v1

    goto :goto_22b

    :cond_22a
    move v10, v5

    :cond_22b
    :goto_22b
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v1, 0x0

    return-object v1

    :cond_23c
    move-object/from16 v1, p3

    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method

.method public final t0()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lod9;->q:Lks3;

    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "flow-code-verification"

    return-object p0
.end method

.method public final y0(Ljava/lang/Boolean;)V
    .registers 5

    iget-object v0, p0, Lod9;->q:Lks3;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_11

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_11

    move p1, v1

    goto :goto_12

    :cond_11
    move p1, v0

    :goto_12
    iget-object v2, p0, Lod9;->q:Lks3;

    if-eqz p1, :cond_27

    iget-object p1, v2, Lks3;->d:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lod9;->q:Lks3;

    iget-object p0, p0, Lks3;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :cond_27
    iget-object p1, v2, Lks3;->d:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lod9;->q:Lks3;

    iget-object p0, p0, Lks3;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final z0(Ljava/lang/String;)V
    .registers 8

    iget-object v0, p0, Lod9;->q:Lks3;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz p1, :cond_50

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x6

    if-ne v0, v3, :cond_2c

    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    const/4 v5, 0x3

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "\u00a0"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2c
    iget-object v0, p0, Lod9;->q:Lks3;

    iget-object v0, v0, Lks3;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lod9;->q:Lks3;

    iget-object p1, p1, Lks3;->g:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lod9;->q:Lks3;

    iget-object p0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void

    :cond_50
    iget-object p1, v0, Lks3;->g:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lod9;->q:Lks3;

    iget-object p0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method
