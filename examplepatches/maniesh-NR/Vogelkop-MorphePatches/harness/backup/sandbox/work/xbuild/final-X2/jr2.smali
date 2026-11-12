.class public final Ljr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmr2;


# direct methods
.method public synthetic constructor <init>(Lmr2;B)V
    .registers 3

    iput-byte p2, p0, Ljr2;->a:B

    iput-object p1, p0, Ljr2;->b:Lmr2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final b(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final j(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final k(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 7

    iget-byte v0, p0, Ljr2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Ljr2;->b:Lmr2;

    packed-switch v0, :pswitch_data_7c

    if-eqz p1, :cond_11

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_12

    :cond_11
    move-object p1, v2

    :goto_12
    if-nez p1, :cond_16

    const-string p1, ""

    :cond_16
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_23

    invoke-static {p1}, LJ/N;->MP7gcyB7(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_23

    move v1, v3

    :cond_23
    iget-object p1, p0, Lmr2;->u:Lcr2;

    if-eqz v1, :cond_3d

    if-nez p1, :cond_2a

    move-object p1, v2

    :cond_2a
    iget-object p1, p1, Lcr2;->m:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    const v4, 0x7f140897

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_47

    :cond_3d
    if-nez p1, :cond_40

    move-object p1, v2

    :cond_40
    iget-object p1, p1, Lcr2;->m:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1, v2}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :goto_47
    iget-object p0, p0, Lmr2;->v:Lpq3;

    if-eqz p0, :cond_4c

    move-object v2, p0

    :cond_4c
    iget-object p0, v2, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    xor-int/2addr v1, v3

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_53
    iget-object p1, p0, Lmr2;->v:Lpq3;

    if-eqz p1, :cond_58

    move-object v2, p1

    :cond_58
    iget-object p1, v2, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Lmr2;->H0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lic4;->C(Ljava/lang/String;)Lfr;

    move-result-object v0

    if-eqz v0, :cond_77

    iget v2, v0, Lfr;->b:I

    if-ltz v2, :cond_77

    iget v0, v0, Lfr;->c:I

    if-lt v0, v3, :cond_77

    const/16 v2, 0xc

    if-gt v0, v2, :cond_77

    invoke-virtual {p0}, Lmr2;->J0()Z

    move-result p0

    if-nez p0, :cond_77

    move v1, v3

    :cond_77
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    nop

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_53
    .end packed-switch
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p0, p0, Ljr2;->a:B

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p0, p0, Ljr2;->a:B

    return-void
.end method
