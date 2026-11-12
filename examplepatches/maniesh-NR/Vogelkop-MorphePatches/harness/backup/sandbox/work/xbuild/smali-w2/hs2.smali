.class public final Lhs2;
.super Lrr2;
.source "SourceFile"


# instance fields
.field public y:Lcom/opera/android/autofill/Address;


# virtual methods
.method public final G0()V
    .registers 2

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0}, Lryl;->g0()V

    return-void
.end method

.method public final H0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lhs2;->y:Lcom/opera/android/autofill/Address;

    if-eqz v1, :cond_e

    iget-boolean v2, v1, Lcom/opera/android/autofill/Address;->o:Z

    if-eqz v2, :cond_e

    iget-object v1, v1, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    :goto_c
    move-object v3, v1

    goto :goto_11

    :cond_e
    const-string v1, ""

    goto :goto_c

    :goto_11
    new-instance v2, Lcom/opera/android/autofill/Address;

    const-string v16, ""

    const/16 v17, 0x1

    const-string v5, ""

    const-string v6, ""

    const-string v7, ""

    const-string v8, ""

    const-string v9, ""

    const-string v10, ""

    const-string v11, ""

    const-string v12, ""

    const-string v15, ""

    move-object/from16 v4, p1

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    invoke-direct/range {v2 .. v17}, Lcom/opera/android/autofill/Address;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    iget-object v0, v0, Lrr2;->w:Lcom/opera/android/autofill/AutofillManager;

    if-eqz v1, :cond_3f

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/opera/android/autofill/AutofillManager;->a(Lcom/opera/android/autofill/Address;Lcom/opera/android/autofill/AutofillManager$AutofillCallback;)V

    return-void

    :cond_3f
    invoke-virtual {v0, v2}, Lcom/opera/android/autofill/AutofillManager;->g(Lcom/opera/android/autofill/Address;)V

    return-void
.end method

.method public final J0()V
    .registers 3

    invoke-super {p0}, Lrr2;->J0()V

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lhs2;->y:Lcom/opera/android/autofill/Address;

    iget-object v1, v1, Lcom/opera/android/autofill/Address;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lhs2;->y:Lcom/opera/android/autofill/Address;

    iget-object v1, v1, Lcom/opera/android/autofill/Address;->k:Ljava/lang/String;

    invoke-static {v0, v1}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p0, p0, Lhs2;->y:Lcom/opera/android/autofill/Address;

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->l:Ljava/lang/String;

    invoke-static {v0, p0}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a08cf

    if-ne p1, v0, :cond_1b

    iget-object p1, p0, Lrr2;->x:Ltr2;

    if-eqz p1, :cond_16

    iget-object v0, p0, Lhs2;->y:Lcom/opera/android/autofill/Address;

    if-eqz v0, :cond_16

    iget-object v0, v0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ltr2;->a(Ljava/lang/String;)V

    :cond_16
    invoke-virtual {p0}, Lryl;->g0()V

    const/4 p0, 0x1

    return p0

    :cond_1b
    const/4 p0, 0x0

    return p0
.end method
