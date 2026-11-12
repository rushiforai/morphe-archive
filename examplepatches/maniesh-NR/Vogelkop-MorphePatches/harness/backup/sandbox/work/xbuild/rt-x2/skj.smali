.class public final Lskj;
.super Lc63;
.source "SourceFile"


# instance fields
.field public final e:Lua7;


# direct methods
.method public constructor <init>(Lgjm;Lqcf;)V
    .registers 4

    sget-object v0, Lpkj;->c:Lpkj;

    invoke-direct {p0, p1, p2, v0}, Lc63;-><init>(Lgjm;Lqcf;Ljava/lang/Object;)V

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lskj;->e:Lua7;

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lskj;->e:Lua7;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lqkj;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lrkj;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lrkj;-><init>(Lskj;B)V

    new-instance v5, Lrkj;

    const/4 v6, 0x1

    invoke-direct {v5, v0, v6}, Lrkj;-><init>(Lskj;B)V

    iget-object v0, v1, Lb63;->b:Lwwd;

    iget-object v6, v1, Lb63;->a:Lvql;

    new-instance v7, Landroid/app/Dialog;

    iget v8, v1, Lb63;->e:I

    invoke-direct {v7, v2, v8}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v7}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v8, 0x7f0d030c

    invoke-virtual {v7, v8}, Landroid/app/Dialog;->setContentView(I)V

    const v8, 0x7f0a02de

    invoke-virtual {v7, v8}, Landroid/app/Dialog;->requireViewById(I)Landroid/view/View;

    move-result-object v8

    const v9, 0x7f0a014d

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/FrameLayout;

    const/4 v11, 0x0

    if-eqz v10, :cond_153

    const v9, 0x7f0a014e

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ImageView;

    if-eqz v10, :cond_153

    const v9, 0x7f0a01b6

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-eqz v10, :cond_153

    move-object v13, v8

    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v9, 0x7f0a06b5

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object v15, v10

    check-cast v15, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v15, :cond_153

    const v9, 0x7f0a074b

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v16, v10

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v16, :cond_153

    const v9, 0x7f0a074d

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v10, :cond_153

    const v9, 0x7f0a084d

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v17, v10

    check-cast v17, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v17, :cond_153

    const v9, 0x7f0a092c

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v10, :cond_153

    const v9, 0x7f0a0a9f

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Space;

    if-eqz v10, :cond_153

    const v9, 0x7f0a06c5

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v18, v10

    check-cast v18, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v18, :cond_153

    new-instance v12, Lpt1;

    move-object v14, v13

    invoke-direct/range {v12 .. v18}, Lpt1;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/custom_views/DialogTitle;)V

    iput-object v12, v1, Lb63;->f:Lpt1;

    invoke-virtual {v1}, Lb63;->a()V

    iget-object v8, v1, Lb63;->f:Lpt1;

    if-nez v8, :cond_c3

    move-object v8, v11

    :cond_c3
    iget-object v8, v8, Lpt1;->b:Landroid/view/View;

    check-cast v8, Lcom/opera/android/custom_views/DialogTitle;

    iget-object v9, v6, Lvql;->a:Lpxh;

    invoke-virtual {v9, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v9

    const/16 v10, 0x8

    if-lez v9, :cond_da

    move v9, v4

    goto :goto_db

    :cond_da
    move v9, v10

    :goto_db
    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v6, v6, Lvql;->b:Z

    if-eqz v6, :cond_e6

    const/4 v6, 0x4

    invoke-virtual {v8, v6}, Landroid/view/View;->setTextAlignment(I)V

    :cond_e6
    iget-object v6, v1, Lb63;->f:Lpt1;

    if-nez v6, :cond_eb

    move-object v6, v11

    :cond_eb
    iget-object v6, v6, Lpt1;->c:Landroid/view/View;

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v0, v0, Lwwd;->a:Lpxh;

    invoke-virtual {v0, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_100

    move v0, v4

    goto :goto_101

    :cond_100
    move v0, v10

    :goto_101
    invoke-virtual {v6, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v1, Lb63;->f:Lpt1;

    if-nez v0, :cond_109

    move-object v0, v11

    :cond_109
    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-object v6, v1, Lb63;->c:Lpxh;

    invoke-virtual {v6, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-lez v6, :cond_11e

    move v6, v4

    goto :goto_11f

    :cond_11e
    move v6, v10

    :goto_11f
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    new-instance v6, Lnf;

    const/16 v8, 0xa

    invoke-direct {v6, v3, v7, v8}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v1, Lb63;->f:Lpt1;

    if-eqz v0, :cond_131

    move-object v11, v0

    :cond_131
    iget-object v0, v11, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-object v1, v1, Lb63;->d:Lpxh;

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-gtz v1, :cond_145

    move v4, v10

    :cond_145
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Lnf;

    const/16 v2, 0xb

    invoke-direct {v1, v5, v7, v2}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v7

    :cond_153
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v11
.end method

.method public final h0()Ljava/lang/Class;
    .registers 1

    iget-object p0, p0, Lskj;->e:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lqkj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public final i0(Z)V
    .registers 2

    iget-object p0, p0, Lskj;->e:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lqkj;

    invoke-virtual {p0, p1}, Lb63;->b(Z)V

    return-void
.end method
