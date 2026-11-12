.class public final Lmj2;
.super Lca3;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lmj2;->b:B

    const/4 p2, 0x0

    invoke-direct {p0, p2}, Lca3;-><init>(B)V

    iput-object p1, p0, Lmj2;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 7

    iget-byte v0, p0, Lmj2;->b:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lmj2;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_fc

    :pswitch_9
    return-void

    :pswitch_a
    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->p:Lkrn;

    new-instance v0, Ljrn;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljrn;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v0}, Lkrn;->f(Ltc2;)V

    return-void

    :pswitch_1b
    check-cast p0, Lf9c;

    iget-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p1, Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    iget-object p0, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p0, Lor2;

    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v2

    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_3c
    check-cast p0, Lfge;

    invoke-static {p1}, Laik;->t(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object v0, p0, Lfge;->B:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lfge;->B:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setActivated(Z)V

    return-void

    :pswitch_56
    check-cast p0, Law7;

    const/4 v0, 0x0

    if-eqz p1, :cond_63

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-lez p1, :cond_63

    move p1, v2

    goto :goto_64

    :cond_63
    move p1, v0

    :goto_64
    iget-object v3, p0, Law7;->x:Lrf2;

    iget-object v4, v3, Lrf2;->g:Landroid/view/View;

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v4, v4, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v4, v4, Ll6b;->q:Z

    xor-int/2addr v4, v2

    if-eq v4, p1, :cond_b2

    iget-object v2, v3, Lrf2;->b:Ljava/lang/Object;

    check-cast v2, Landroid/widget/ScrollView;

    invoke-static {v2, v1}, Lh3m;->a(Landroid/view/ViewGroup;Ly2m;)V

    if-eqz p1, :cond_84

    iget-object p1, p0, Law7;->x:Lrf2;

    iget-object p1, p1, Lrf2;->g:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    goto :goto_af

    :cond_84
    iget-object p1, p0, Law7;->y:Li4d;

    if-eqz p1, :cond_93

    iget-object p1, p1, Li4d;->b:Ljava/lang/Object;

    check-cast p1, Lq4g;

    iget-object p1, p1, Lq4g;->v:Lw3g;

    invoke-static {p1}, Lcqp;->W(Lw3g;)Ljava/lang/String;

    move-result-object p1

    goto :goto_95

    :cond_93
    const-string p1, ""

    :goto_95
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a6

    const v0, 0x7f140638

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :cond_a6
    iget-object p1, p0, Law7;->x:Lrf2;

    iget-object p1, p1, Lrf2;->g:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :goto_af
    invoke-virtual {p0}, Law7;->H0()V

    :cond_b2
    return-void

    :pswitch_b3
    check-cast p0, Lss7;

    iput-boolean v2, p0, Lss7;->z:Z

    invoke-virtual {p0}, Lss7;->K0()V

    return-void

    :pswitch_bb
    check-cast p0, Lf9c;

    invoke-virtual {p0}, Lf9c;->G0()V

    return-void

    :pswitch_c1
    check-cast p0, Lrr2;

    invoke-virtual {p0}, Lrr2;->K0()V

    return-void

    :pswitch_c7
    check-cast p0, Lmr2;

    invoke-virtual {p0}, Lmr2;->M0()V

    return-void

    :pswitch_cd
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast p0, Laq2;

    iget-object v2, p0, Laq2;->c:Liq2;

    iget-object v3, v2, Liq2;->H:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ed

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Liq2;->H:Ljava/lang/String;

    iput-object v1, v2, Liq2;->J:Ljava/lang/String;

    iget-object p0, p0, Laq2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    invoke-virtual {v2}, Liq2;->N0()V

    :cond_ed
    return-void

    :pswitch_ee
    check-cast p0, Lxp2;

    iget-object p0, p0, Lxp2;->c:Liq2;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Liq2;->I:Ljava/lang/String;

    invoke-virtual {p0}, Liq2;->N0()V

    return-void

    :pswitch_data_fc
    .packed-switch 0x1
        :pswitch_ee
        :pswitch_cd
        :pswitch_c7
        :pswitch_c1
        :pswitch_bb
        :pswitch_b3
        :pswitch_56
        :pswitch_9
        :pswitch_9
        :pswitch_3c
        :pswitch_1b
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 8

    iget-byte v0, p0, Lmj2;->b:B

    const/4 v1, 0x0

    iget-object v2, p0, Lmj2;->c:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_50

    invoke-super {p0, p1, p2, p3, p4}, Lca3;->onTextChanged(Ljava/lang/CharSequence;III)V

    return-void

    :sswitch_c
    check-cast v2, Lv48;

    iget-object p0, v2, Lv48;->b:Luim;

    check-cast p0, Lf0i;

    iget-object p0, p0, Lf0i;->g:Ly83;

    iget-object p0, p0, Ly83;->f:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void

    :sswitch_1c
    check-cast v2, Lv48;

    iget-object p0, v2, Lv48;->b:Luim;

    check-cast p0, Lw48;

    iget-object p0, p0, Lw48;->d:Lvs;

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void

    :sswitch_2c
    check-cast v2, Ll18;

    iget-object p0, v2, Ll18;->g:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void

    :sswitch_34
    check-cast v2, Lpj2;

    iget-object p0, v2, Lpj2;->u:Landroid/widget/Button;

    iget-object p1, v2, Lpj2;->s:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, v2, Lpj2;->r:Landroid/widget/TextView;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    nop

    :sswitch_data_50
    .sparse-switch
        0x0 -> :sswitch_34
        0x8 -> :sswitch_2c
        0x9 -> :sswitch_1c
        0xc -> :sswitch_c
    .end sparse-switch
.end method
