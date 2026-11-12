.class public Ln99;
.super Ls63;
.source "SourceFile"


# instance fields
.field public l:Lbn7;

.field public m:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ls63;-><init>()V

    return-void
.end method


# virtual methods
.method public final s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lepj;)Ldgh;
    .registers 26

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

    if-eqz v3, :cond_a9

    if-eq v3, v6, :cond_34

    if-eq v3, v5, :cond_34

    const/4 v5, 0x3

    if-eq v3, v5, :cond_34

    const/4 v5, 0x4

    if-eq v3, v5, :cond_34

    invoke-static {}, Lh9o;->p()V

    return-object v7

    :cond_34
    if-eqz v2, :cond_a5

    const v3, 0x7f0d01b8

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroid/view/ViewStub;

    if-eqz v18, :cond_94

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    if-eqz v1, :cond_92

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_90

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v1, :cond_8e

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v17, :cond_8c

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_95

    new-instance v16, Lr9i;

    new-instance v1, Lhck;

    new-instance v2, Ldxh;

    const v3, 0x7f040220

    invoke-direct {v2, v3}, Ldxh;-><init>(I)V

    invoke-direct {v1, v2}, Lhck;-><init>(Lcxh;)V

    const/16 v21, 0x10

    move-object/from16 v20, v1

    invoke-direct/range {v16 .. v21}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    :goto_88
    move-object/from16 v1, v16

    goto/16 :goto_117

    :cond_8c
    move v10, v11

    goto :goto_95

    :cond_8e
    move v10, v12

    goto :goto_95

    :cond_90
    move v10, v13

    goto :goto_95

    :cond_92
    move v10, v14

    goto :goto_95

    :cond_94
    move v10, v15

    :cond_95
    :goto_95
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_a5
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_a9
    if-eqz v2, :cond_16d

    const v3, 0x7f0d01b9

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroid/view/ViewStub;

    if-eqz v18, :cond_15c

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    if-eqz v1, :cond_15a

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_158

    const v1, 0x7f0a0390

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_156

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v1, :cond_154

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v17, :cond_152

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_15d

    const v10, 0x7f0a0aca

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_15d

    new-instance v16, Lr9i;

    new-instance v2, Lkck;

    new-array v5, v5, [Landroid/view/ViewGroup;

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v2, v1}, Lkck;-><init>(Ljava/util/List;)V

    const/16 v21, 0x10

    move-object/from16 v20, v2

    invoke-direct/range {v16 .. v21}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    goto/16 :goto_88

    :goto_117
    iget-object v2, v1, Lr9i;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v3, Lm99;

    invoke-direct {v3, v0, v4}, Lm99;-><init>(Ln99;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v2, Landroid/view/ViewStub;

    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a01af

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    const v3, 0x7f1412e1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    new-instance v3, Lm99;

    invoke-direct {v3, v0, v6}, Lm99;-><init>(Ln99;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget v0, v0, Ln99;->m:I

    if-eqz v0, :cond_14d

    iget-object v2, v1, Lr9i;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    :cond_14d
    iget-object v0, v1, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Ldgh;

    return-object v0

    :cond_152
    move v10, v11

    goto :goto_15d

    :cond_154
    move v10, v12

    goto :goto_15d

    :cond_156
    move v10, v1

    goto :goto_15d

    :cond_158
    move v10, v13

    goto :goto_15d

    :cond_15a
    move v10, v14

    goto :goto_15d

    :cond_15c
    move v10, v15

    :cond_15d
    :goto_15d
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_16d
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7
.end method
