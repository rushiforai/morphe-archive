.class public final synthetic Ler2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmr2;


# direct methods
.method public synthetic constructor <init>(Lmr2;B)V
    .registers 3

    iput-byte p2, p0, Ler2;->a:B

    iput-object p1, p0, Ler2;->b:Lmr2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .registers 4

    iget-byte p1, p0, Ler2;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Ler2;->b:Lmr2;

    packed-switch p1, :pswitch_data_82

    if-nez p2, :cond_3b

    invoke-virtual {p0}, Lmr2;->G0()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, LJ/N;->MSg1Yo08(Ljava/lang/Object;)Z

    move-result p1

    iget-object p2, p0, Lmr2;->u:Lcr2;

    if-nez p1, :cond_31

    if-eqz p2, :cond_1e

    move-object v0, p2

    :cond_1e
    iget-object p1, v0, Lcr2;->n:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    const p2, 0x7f140260

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_3b

    :cond_31
    if-nez p2, :cond_34

    move-object p2, v0

    :cond_34
    iget-object p0, p2, Lcr2;->n:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :cond_3b
    :goto_3b
    return-void

    :pswitch_3c
    if-nez p2, :cond_7d

    invoke-virtual {p0}, Lmr2;->H0()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lic4;->C(Ljava/lang/String;)Lfr;

    move-result-object p1

    if-eqz p1, :cond_6e

    iget p2, p1, Lfr;->b:I

    if-ltz p2, :cond_6e

    iget p1, p1, Lfr;->c:I

    const/4 p2, 0x1

    if-lt p1, p2, :cond_6e

    const/16 p2, 0xc

    if-gt p1, p2, :cond_6e

    invoke-virtual {p0}, Lmr2;->J0()Z

    move-result p1

    if-eqz p1, :cond_6a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f140c96

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmr2;->L0(Ljava/lang/String;)V

    goto :goto_80

    :cond_6a
    invoke-virtual {p0, v0}, Lmr2;->L0(Ljava/lang/String;)V

    goto :goto_80

    :cond_6e
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f140c94

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmr2;->L0(Ljava/lang/String;)V

    goto :goto_80

    :cond_7d
    invoke-virtual {p0, v0}, Lmr2;->L0(Ljava/lang/String;)V

    :goto_80
    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_3c
    .end packed-switch
.end method
