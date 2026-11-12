.class public final Lljh;
.super Luim;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lljh;->d:B

    invoke-direct {p0}, Luim;-><init>()V

    iput-object p1, p0, Lljh;->e:Ljava/lang/Object;

    iput-object p2, p0, Lljh;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Lljh;->d:B

    iget-object v2, v0, Lljh;->e:Ljava/lang/Object;

    const v3, 0x7f0a02de

    const v4, 0x7f0d0319

    const v5, 0x7f150291

    iget-object v6, v0, Lljh;->f:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_14c

    new-instance v1, Lce5;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v1, v7, v5}, Lce5;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v4}, Lce5;->setContentView(I)V

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->requireViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Ly83;->c(Landroid/view/View;)Ly83;

    move-result-object v3

    iget-object v4, v3, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Landroid/view/ViewStub;

    const v5, 0x7f0d035e

    invoke-virtual {v4, v5}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v4}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v4

    invoke-static {v4}, Lq5g;->a(Landroid/view/View;)Lq5g;

    move-result-object v4

    move-object v7, v2

    check-cast v7, Lxbf;

    iget-object v2, v3, Ly83;->h:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Lcom/opera/android/custom_views/DialogTitle;

    iget-object v2, v3, Ly83;->e:Ljava/lang/Object;

    move-object v9, v2

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, v3, Ly83;->g:Ljava/lang/Object;

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-object v2, v3, Ly83;->f:Ljava/lang/Object;

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-object v2, v4, Lq5g;->c:Ljava/lang/Object;

    check-cast v2, Lhi4;

    iget-object v12, v2, Lhi4;->c:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v13, Lldh;

    move-object v15, v6

    check-cast v15, Lojh;

    const/16 v19, 0x0

    const/16 v20, 0x3

    const/4 v14, 0x1

    const-class v16, Lojh;

    const-string v17, "onFeedbackOptionSelected"

    const-string v18, "onFeedbackOptionSelected(Lcom/opera/android/rateus/FeedbackOption;)V"

    invoke-direct/range {v13 .. v20}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual/range {v7 .. v13}, Lxbf;->l(Lcom/opera/android/custom_views/DialogTitle;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/Button;Landroid/widget/Button;Lcom/google/android/material/textfield/TextInputLayout;Lkotlin/jvm/functions/Function1;)V

    new-instance v2, Lj5g;

    const/4 v5, 0x3

    invoke-direct {v2, v0, v4, v5}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v10, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Lzvd;

    const/16 v4, 0x19

    invoke-direct {v2, v0, v4}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v11, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    check-cast v6, Lojh;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenHeightDp:I

    invoke-virtual {v6, v0}, Lojh;->a(I)V

    iget-object v0, v6, Lojh;->b:Lpde;

    new-instance v2, Ljjh;

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljjh;-><init>(Ly83;B)V

    new-instance v3, Liwa;

    const/16 v4, 0x15

    invoke-direct {v3, v2, v4}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    return-object v1

    :pswitch_a2
    new-instance v1, Lce5;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v1, v7, v5}, Lce5;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v4}, Lce5;->setContentView(I)V

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->requireViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Ly83;->c(Landroid/view/View;)Ly83;

    move-result-object v3

    iget-object v4, v3, Ly83;->g:Ljava/lang/Object;

    move-object v9, v4

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-object v4, v3, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Landroid/view/ViewStub;

    const v5, 0x7f0d035d

    invoke-virtual {v4, v5}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v4}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_145

    check-cast v4, Lcom/opera/android/custom_views/OperaRateBar;

    check-cast v6, Lwjh;

    new-instance v5, Lkjh;

    const/4 v15, 0x0

    invoke-direct {v5, v6, v15}, Lkjh;-><init>(Lwjh;B)V

    iget-object v7, v4, Lcom/opera/android/custom_views/OperaRateBar;->t:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    check-cast v2, Ls9i;

    iget-object v5, v3, Ly83;->h:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/DialogTitle;

    iget-object v7, v3, Ly83;->e:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v8, v3, Ly83;->f:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v2, v5, v7, v9, v8}, Ls9i;->a(Lcom/opera/android/custom_views/DialogTitle;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/Button;Landroid/widget/Button;)V

    iget-object v2, v6, Lwjh;->c:Ljava/lang/Object;

    check-cast v2, Lpde;

    iget-object v5, v6, Lwjh;->d:Ljava/lang/Object;

    check-cast v5, Lpde;

    new-instance v7, Lldh;

    const/4 v13, 0x0

    const/4 v14, 0x2

    move-object v6, v8

    const/4 v8, 0x1

    const-class v10, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const-string v11, "setEnabled"

    const-string v12, "setEnabled(Z)V"

    invoke-direct/range {v7 .. v14}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v8, Lt7d;

    const/4 v10, 0x6

    invoke-direct {v8, v7, v10}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v1, v8}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v2, Lj5g;

    const/4 v7, 0x2

    invoke-direct {v2, v0, v4, v7}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v9, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Lzvd;

    const/16 v4, 0x18

    invoke-direct {v2, v0, v4}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v2, 0x1f4

    if-lt v0, v2, :cond_12e

    move v0, v15

    goto :goto_130

    :cond_12e
    const/16 v0, 0x8

    :goto_130
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v5, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    new-instance v0, Ljjh;

    invoke-direct {v0, v3, v15}, Ljjh;-><init>(Ly83;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v0, v10}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v5, v1, v2}, Lekc;->j(Lndc;Lf7f;)V

    goto :goto_14b

    :cond_145
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_14b
    return-object v1

    :pswitch_data_14c
    .packed-switch 0x0
        :pswitch_a2
    .end packed-switch
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    iget-byte v0, p0, Lljh;->d:B

    iget-object v1, p0, Lljh;->f:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    check-cast v1, Lojh;

    iget p0, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    invoke-virtual {v1, p0}, Lojh;->a(I)V

    return-void

    :pswitch_12
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    check-cast v1, Lwjh;

    iget p0, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    iget-object p1, v1, Lwjh;->d:Ljava/lang/Object;

    check-cast p1, Lpde;

    const/16 v0, 0x1f4

    if-lt p0, v0, :cond_23

    const/4 p0, 0x0

    goto :goto_25

    :cond_23
    const/16 p0, 0x8

    :goto_25
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
