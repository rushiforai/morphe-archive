.class public Le/e/a/h1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 10

    iget-object p1, p0, Le/e/a/h1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 1
    iget-boolean v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->w0:Z

    const/4 v1, 0x0

    if-nez v0, :cond_e

    iget-object v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c1

    goto/16 :goto_f7

    :cond_e
    iget-object v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_f2

    iget-object v2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    if-eqz v2, :cond_f2

    iget-object v2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    if-eqz v2, :cond_f2

    iget-object v2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->i1:Le/e/a/b1;

    if-nez v2, :cond_20

    goto/16 :goto_f2

    :cond_20
    iget-boolean v2, v2, Le/e/a/b1;->e:Z

    if-eqz v2, :cond_2b

    iget-object v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00b9

    goto/16 :goto_f7

    :cond_2b
    const/4 v2, 0x1

    iput-boolean v2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->H0:Z

    new-array v3, v2, [Z

    aput-boolean v1, v3, v1

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_47

    iget-object v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->pause()V

    iget-object v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v4, 0x7f070196

    invoke-static {v0, v4}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    aput-boolean v2, v3, v1

    :cond_47
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v4, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v0, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v4, Landroid/widget/EditText;

    iget-object v5, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v4, v5}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iget-object v5, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v6, 0x7f0f0038

    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setInputType(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v2, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4}, Landroid/widget/EditText;->requestFocus()Z

    new-instance v2, Landroid/widget/EditText;

    iget-object v6, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v2, v6}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iget-object v6, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v7, 0x7f0f0037

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v6}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const-string v5, ""

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    iget-object v5, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->b(Landroid/content/Context;)Landroid/view/View$OnTouchListener;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/app/AlertDialog$Builder;

    iget-object v6, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v6, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v7, 0x7f0f00cb

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Le/e/a/o1;

    invoke-direct {v7, p1, v4, v2}, Le/e/a/o1;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v4, 0x7f0f0036

    invoke-virtual {v2, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Le/e/a/p1;

    invoke-direct {v4, p1}, Le/e/a/p1;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v5, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const v2, 0x7f050088

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    invoke-virtual {v5, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v4, 0x2

    invoke-virtual {v2, v1, v4}, Landroid/view/Window;->setFlags(II)V

    new-instance v1, Le/e/a/q1;

    invoke-direct {v1, p1, v3}, Le/e/a/q1;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;[Z)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    goto :goto_100

    :cond_f2
    :goto_f2
    iget-object v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c7

    :goto_f7
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 2
    invoke-static {v0, v1, p1}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    :goto_100
    return-void
.end method
