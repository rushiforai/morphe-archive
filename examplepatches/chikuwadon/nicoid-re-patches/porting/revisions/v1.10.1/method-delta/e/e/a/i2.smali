.class public Le/e/a/i2;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public a:Landroid/os/Handler;

.field public b:Landroid/app/Activity;

.field public c:Le/e/a/b0;

.field public d:Le/e/a/l3/k;

.field public e:Z


# virtual methods
.method public a()V
    .registers 7

    const-string v0, ""

    :try_start_2
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/EditText;

    iget-object v3, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    const v4, 0x7f0f01af

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/widget/EditText;

    iget-object v4, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    invoke-direct {v3, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    const v4, 0x7f0f0225

    invoke-virtual {v0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/widget/CheckBox;

    iget-object v4, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    invoke-direct {v0, v4}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    const v5, 0x7f0f0229

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v4, Landroid/widget/LinearLayout;

    iget-object v5, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    const v5, 0x7f0f0226

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Le/e/a/i2$d;

    invoke-direct {v5, p0, v2, v3, v0}, Le/e/a/i2$d;-><init>(Le/e/a/i2;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;)V

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    const v2, 0x7f0f002d

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Le/e/a/i2$e;

    invoke-direct {v2, p0}, Le/e/a/i2$e;-><init>(Le/e/a/i2;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V
    :try_end_8c
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_8c} :catch_8d

    goto :goto_91

    :catch_8d
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_91
    return-void
.end method
