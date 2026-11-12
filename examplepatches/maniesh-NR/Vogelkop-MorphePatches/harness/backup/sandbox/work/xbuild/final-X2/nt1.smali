.class public final Lnt1;
.super Lc63;
.source "SourceFile"


# instance fields
.field public final e:Lua7;

.field public f:Lpt1;


# direct methods
.method public constructor <init>(Lgjm;Lqcf;)V
    .registers 4

    sget-object v0, Lkt1;->c:Lkt1;

    invoke-direct {p0, p1, p2, v0}, Lc63;-><init>(Lgjm;Lqcf;Ljava/lang/Object;)V

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lnt1;->e:Lua7;

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 13

    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f150295

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const v0, 0x7f0d00f5

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setContentView(I)V

    const v0, 0x7f0a02de

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->requireViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a014c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_100

    invoke-static {v2}, Lzt5;->a(Landroid/view/View;)Lzt5;

    move-result-object v6

    const v1, 0x7f0a014d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/widget/FrameLayout;

    if-eqz v7, :cond_100

    const v1, 0x7f0a01b6

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-eqz v2, :cond_100

    move-object v5, v0

    check-cast v5, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v1, 0x7f0a06b5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_100

    const v1, 0x7f0a074b

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v9, :cond_100

    const v1, 0x7f0a084d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v10, :cond_100

    const v1, 0x7f0a092c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v2, :cond_100

    const v1, 0x7f0a0a9f

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Space;

    if-eqz v2, :cond_100

    const v1, 0x7f0a06c5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v2, :cond_100

    new-instance v4, Lpt1;

    invoke-direct/range {v4 .. v10}, Lpt1;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lzt5;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V

    iput-object v4, p0, Lnt1;->f:Lpt1;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_9d

    move v0, v2

    goto :goto_9e

    :cond_9d
    move v0, v1

    :goto_9e
    iget-object v4, p0, Lnt1;->f:Lpt1;

    if-nez v4, :cond_a3

    move-object v4, v3

    :cond_a3
    iget-object v4, v4, Lpt1;->b:Landroid/view/View;

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v0, :cond_ab

    move v0, v1

    goto :goto_ad

    :cond_ab
    const/16 v0, 0x8

    :goto_ad
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lnt1;->f:Lpt1;

    if-nez v0, :cond_b5

    move-object v0, v3

    :cond_b5
    const v4, 0x7f1401b7

    invoke-virtual {p0, v4}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v5, Lzt5;

    iget-object v5, v5, Lzt5;->c:Landroid/widget/TextView;

    const v6, 0x7f140554

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v5, 0x7f1401af

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v5, v4}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lnt1;->f:Lpt1;

    if-eqz v0, :cond_e7

    move-object v3, v0

    :cond_e7
    iget-object v0, v3, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v4, Lmt1;

    invoke-direct {v4, p0, p1, v1}, Lmt1;-><init>(Lnt1;Landroid/app/Dialog;B)V

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v3, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v1, Lmt1;

    invoke-direct {v1, p0, p1, v2}, Lmt1;-><init>(Lnt1;Landroid/app/Dialog;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1

    :cond_100
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3
.end method

.method public final h0()Ljava/lang/Class;
    .registers 1

    iget-object p0, p0, Lnt1;->e:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Llt1;

    const-class p0, Llt1;

    return-object p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Lc63;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_a

    move v1, v0

    :cond_a
    iget-object p0, p0, Lnt1;->f:Lpt1;

    if-nez p0, :cond_f

    const/4 p0, 0x0

    :cond_f
    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Landroid/widget/FrameLayout;

    if-nez v1, :cond_17

    const/16 v0, 0x8

    :cond_17
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
