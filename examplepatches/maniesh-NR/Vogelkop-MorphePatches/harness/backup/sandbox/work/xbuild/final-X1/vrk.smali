.class public final Lvrk;
.super Lc63;
.source "SourceFile"


# instance fields
.field public final e:Lua7;


# direct methods
.method public constructor <init>(Lgjm;Lgw3;)V
    .registers 4

    sget-object v0, Lsrk;->b:Lsrk;

    invoke-direct {p0, p1, p2, v0}, Lc63;-><init>(Lgjm;Lqcf;Ljava/lang/Object;)V

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lvrk;->e:Lua7;

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 13

    iget-object p1, p0, Lvrk;->e:Lua7;

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object p1

    check-cast p1, Ltrk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lurk;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lurk;-><init>(Lvrk;B)V

    new-instance v3, Lurk;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lurk;-><init>(Lvrk;B)V

    new-instance p0, Landroid/app/Dialog;

    iget p1, p1, Lb63;->e:I

    invoke-direct {p0, v0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const p1, 0x7f0d0470

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setContentView(I)V

    const p1, 0x7f0a02de

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->requireViewById(I)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a01b6

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-eqz v4, :cond_cd

    move-object v6, p1

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v0, 0x7f0a0562

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/opera/android/custom_views/CheckBox;

    if-eqz v7, :cond_cd

    const v0, 0x7f0a06b5

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_cd

    const v0, 0x7f0a074b

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v9, :cond_cd

    const v0, 0x7f0a084d

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v10, :cond_cd

    const v0, 0x7f0a092c

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v4, :cond_cd

    const v0, 0x7f0a0a9f

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Space;

    if-eqz v4, :cond_cd

    const v0, 0x7f0a06c5

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v4, :cond_cd

    new-instance v5, Ljm9;

    invoke-direct/range {v5 .. v10}, Ljm9;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/CheckBox;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v4, 0x7f1401b7

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v4, 0x7f141421

    invoke-virtual {p1, v4, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v8, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v2}, Landroid/view/View;->setEnabled(Z)V

    new-instance p1, Lh4i;

    const/16 v0, 0x12

    invoke-direct {p1, v1, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v10, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lh4i;

    const/16 v0, 0x13

    invoke-direct {p1, v3, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcrk;

    const/4 v0, 0x2

    invoke-direct {p1, v5, v0}, Lcrk;-><init>(Ljava/lang/Object;B)V

    iput-object p1, v7, Lcom/opera/android/custom_views/CheckBox;->m:Lav4;

    return-object p0

    :cond_cd
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h0()Ljava/lang/Class;
    .registers 1

    iget-object p0, p0, Lvrk;->e:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Ltrk;

    const-class p0, Ltrk;

    return-object p0
.end method
