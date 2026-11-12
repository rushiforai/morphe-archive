.class public final Lgs2;
.super Lmr2;
.source "SourceFile"


# instance fields
.field public final B:Lwh2;

.field public final C:Lcom/opera/android/autofill/CreditCard;


# direct methods
.method public constructor <init>(Lorm;Lwh2;Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/CreditCard;)V
    .registers 7

    const v0, 0x7f140291

    invoke-direct {p0, p1, p3, p4, v0}, Lmr2;-><init>(Lorm;Lcom/opera/android/autofill/AutofillManager;Lgw;I)V

    iput-object p2, p0, Lgs2;->B:Lwh2;

    iput-object p5, p0, Lgs2;->C:Lcom/opera/android/autofill/CreditCard;

    return-void
.end method


# virtual methods
.method public final I0()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgs2;->C:Lcom/opera/android/autofill/CreditCard;

    iget-object p0, p0, Lcom/opera/android/autofill/CreditCard;->g:Ljava/lang/String;

    return-object p0
.end method

.method public final K0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 18

    new-instance v0, Lcom/opera/android/autofill/CreditCard;

    iget-object v1, p0, Lgs2;->C:Lcom/opera/android/autofill/CreditCard;

    iget-object v1, v1, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    const-string v4, ""

    const/4 v3, 0x0

    move-object v2, p1

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    invoke-direct/range {v0 .. v9}, Lcom/opera/android/autofill/CreditCard;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean p1, p0, Lnrl;->a:Z

    if-eqz p1, :cond_20

    invoke-static {v0, p2}, LJ/N;->MFIUe29u(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_20
    new-instance p1, Lbi2;

    const/4 p3, 0x5

    invoke-direct {p1, v0, p2, p3}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lgs2;->B:Lwh2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p0

    iget-object p1, p1, Llj2;->b:Lob;

    invoke-virtual {p0, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lmr2;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    iget-object p1, p1, Lcr2;->m:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p2, p0, Lgs2;->C:Lcom/opera/android/autofill/CreditCard;

    iget-object v0, p2, Lcom/opera/android/autofill/CreditCard;->h:Ljava/lang/String;

    invoke-static {p1, v0}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    iget-object p1, p1, Lcr2;->l:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, p2, Lcom/opera/android/autofill/CreditCard;->b:Ljava/lang/String;

    invoke-static {p1, v0}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    iget-object p1, p1, Lcr2;->n:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    iget-object v0, v0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v0, v0, Lnrl;->a:Z

    if-nez v0, :cond_2c

    const-string v0, ""

    goto :goto_34

    :cond_2c
    iget-object v0, p2, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-static {v0}, LJ/N;->M6qqsegZ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_34
    invoke-static {p1, v0}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    iget-object p1, p1, Lcr2;->c:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, p2, Lcom/opera/android/autofill/CreditCard;->i:Ljava/lang/String;

    invoke-static {p1, v0}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Lcom/opera/android/autofill/CreditCard;->a()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_55

    iget-object p0, p0, Lmr2;->u:Lcr2;

    iget-object p0, p0, Lcr2;->e:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {p0, p1}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    :cond_55
    return-void
.end method
