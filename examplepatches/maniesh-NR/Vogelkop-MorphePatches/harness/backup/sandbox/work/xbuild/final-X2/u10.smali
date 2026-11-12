.class public final Lu10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lea2;


# instance fields
.field public final a:Lx5f;

.field public final b:Lpde;

.field public final c:Ltsd;


# direct methods
.method public constructor <init>(Lx5f;Lpde;Ltsd;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu10;->a:Lx5f;

    iput-object p2, p0, Lu10;->b:Lpde;

    iput-object p3, p0, Lu10;->c:Ltsd;

    return-void
.end method


# virtual methods
.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const/4 v3, 0x0

    const-string v4, "Missing required view with ID: "

    iget-object v5, v0, Lu10;->c:Ltsd;

    iget-object v0, v0, Lu10;->b:Lpde;

    const v6, 0x7f0a064e

    const v7, 0x7f0a064d

    const v8, 0x7f0a064b

    const v9, 0x7f0a0648

    const v10, 0x7f0a0647

    const v11, 0x7f0a0646

    const/4 v12, 0x0

    const v13, 0x7f0d0042

    if-ne v2, v13, :cond_91

    new-instance v2, Ls10;

    invoke-static {v1, v13, v1, v12}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {v11, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    move-object v15, v12

    check-cast v15, Lcom/opera/android/widget/ClickAwareCardView;

    if-eqz v15, :cond_80

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v16, v11

    check-cast v16, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v16, :cond_7e

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v20, v10

    check-cast v20, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v20, :cond_7c

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object/from16 v19, v9

    check-cast v19, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v19, :cond_7a

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v18, v8

    check-cast v18, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v18, :cond_78

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v17, v7

    check-cast v17, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v17, :cond_81

    move-object v14, v1

    check-cast v14, Landroid/widget/FrameLayout;

    new-instance v13, Lz4n;

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v13 .. v23}, Lz4n;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/widget/ClickAwareCardView;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/widget/RoundedImageView;Lcom/google/android/material/button/MaterialButton;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    invoke-direct {v2, v13, v0, v5}, Ls10;-><init>(Lz4n;Lpde;Ltsd;)V

    return-object v2

    :cond_78
    move v6, v7

    goto :goto_81

    :cond_7a
    move v6, v8

    goto :goto_81

    :cond_7c
    move v6, v9

    goto :goto_81

    :cond_7e
    move v6, v10

    goto :goto_81

    :cond_80
    move v6, v11

    :cond_81
    :goto_81
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3

    :cond_91
    const v13, 0x7f0d0043

    if-ne v2, v13, :cond_122

    new-instance v2, Ls10;

    invoke-static {v1, v13, v1, v12}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {v11, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    move-object v15, v12

    check-cast v15, Lcom/opera/android/widget/ClickAwareCardView;

    if-eqz v15, :cond_112

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v16, v11

    check-cast v16, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v16, :cond_110

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v20, v10

    check-cast v20, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v20, :cond_10e

    const v9, 0x7f0a0649

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v22, v10

    check-cast v22, Lcom/google/android/material/button/MaterialButton;

    if-eqz v22, :cond_10e

    const v9, 0x7f0a064a

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v23, v10

    check-cast v23, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v23, :cond_10e

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object/from16 v19, v9

    check-cast v19, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v19, :cond_10c

    const v8, 0x7f0a064c

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object/from16 v21, v9

    check-cast v21, Lcom/opera/android/widget/RoundedImageView;

    if-eqz v21, :cond_10c

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v18, v8

    check-cast v18, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v18, :cond_10a

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v17, v7

    check-cast v17, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v17, :cond_113

    move-object v14, v1

    check-cast v14, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;

    new-instance v13, Lz4n;

    invoke-direct/range {v13 .. v23}, Lz4n;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/widget/ClickAwareCardView;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/widget/RoundedImageView;Lcom/google/android/material/button/MaterialButton;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    invoke-direct {v2, v13, v0, v5}, Ls10;-><init>(Lz4n;Lpde;Ltsd;)V

    return-object v2

    :cond_10a
    move v6, v7

    goto :goto_113

    :cond_10c
    move v6, v8

    goto :goto_113

    :cond_10e
    move v6, v9

    goto :goto_113

    :cond_110
    move v6, v10

    goto :goto_113

    :cond_112
    move v6, v11

    :cond_113
    :goto_113
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :cond_122
    return-object v3
.end method

.method public final q(Lja2;ILca2;)I
    .registers 14

    instance-of p2, p1, Lx10;

    const/4 p3, 0x0

    if-eqz p2, :cond_5c

    check-cast p1, Lx10;

    iget-object p1, p1, Lmq;->d:Lyz;

    check-cast p1, Lw10;

    iget-object p2, p1, Lw10;->u:Lcie;

    iget-object p2, p2, Lbzo;->d:Lw06;

    if-nez p2, :cond_13

    const/4 p2, -0x1

    goto :goto_1b

    :cond_13
    sget-object v0, Lt10;->a:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    aget p2, v0, p2

    :goto_1b
    packed-switch p2, :pswitch_data_5e

    :pswitch_1e
    invoke-static {}, Lh9o;->p()V

    return p3

    :pswitch_22
    iget-object p0, p1, Lw10;->u:Lcie;

    iget-boolean p0, p0, Lcie;->o0:Z

    if-eqz p0, :cond_2c

    const p0, 0x7f0d0043

    return p0

    :cond_2c
    const p0, 0x7f0d0042

    return p0

    :pswitch_30
    iget-object p2, p1, Lyz;->n:Luz;

    invoke-virtual {p1}, Lyz;->h()Ldl;

    move-result-object p3

    iget-object v1, p1, Lyz;->g:Ljava/lang/String;

    iget-object v0, p1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v2

    iget-object v3, p3, Ldl;->b:Lq50;

    if-eqz p2, :cond_45

    iget-object p2, p2, Luz;->a:Ljava/lang/String;

    goto :goto_46

    :cond_45
    const/4 p2, 0x0

    :goto_46
    if-nez p2, :cond_4a

    const-string p2, ""

    :cond_4a
    move-object v4, p2

    invoke-virtual {p1}, Lw10;->e()Lv50;

    move-result-object v8

    const/4 v9, 0x0

    iget-object v0, p0, Lu10;->a:Lx5f;

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v9}, Lx5f;->p(Ljava/lang/String;Lu50;Lq50;Ljava/lang/String;JZLv50;Ljava/lang/Long;)V

    const p0, 0x7f0d0163

    return p0

    :cond_5c
    return p3

    nop

    :pswitch_data_5e
    .packed-switch -0x1
        :pswitch_30
        :pswitch_1e
        :pswitch_22
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
    .end packed-switch
.end method
