.class public abstract Lo1e;
.super Luim;
.source "SourceFile"


# instance fields
.field public d:Landroid/app/ProgressDialog;

.field public e:Z


# virtual methods
.method public i0()V
    .registers 2

    const v0, 0x7f1411e8

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lo1e;->l0(Ljava/lang/String;)V

    return-void
.end method

.method public j0()V
    .registers 2

    iget-boolean v0, p0, Lo1e;->e:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lo1e;->n0()V

    const v0, 0x7f14120f

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lo1e;->l0(Ljava/lang/String;)V

    return-void
.end method

.method public k0()V
    .registers 2

    iget-boolean v0, p0, Lo1e;->e:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Luim;->h0()V

    return-void
.end method

.method public abstract l0(Ljava/lang/String;)V
.end method

.method public final m0(Ljava/lang/CharSequence;)V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->U:Ldxk;

    if-nez v0, :cond_b

    const/4 v0, 0x0

    :cond_b
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, LJ/N;->MBL1GxRh(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_34

    iget-object p1, v0, Ldxk;->e:Ldb;

    iget-object p1, p1, Ldb;->b:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "account_type"

    const/4 v1, 0x2

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lo1e;->k0()V

    return-void

    :cond_34
    iget-boolean p1, p0, Lo1e;->e:Z

    if-eqz p1, :cond_39

    return-void

    :cond_39
    invoke-virtual {p0}, Lo1e;->n0()V

    invoke-virtual {p0}, Lo1e;->i0()V

    return-void
.end method

.method public final n0()V
    .registers 2

    iget-object v0, p0, Lo1e;->d:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lo1e;->d:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_f
    const/4 v0, 0x0

    iput-object v0, p0, Lo1e;->d:Landroid/app/ProgressDialog;

    return-void
.end method

.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onDismiss(Landroid/content/DialogInterface;)V

    invoke-virtual {p0}, Lo1e;->n0()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lo1e;->e:Z

    return-void
.end method
