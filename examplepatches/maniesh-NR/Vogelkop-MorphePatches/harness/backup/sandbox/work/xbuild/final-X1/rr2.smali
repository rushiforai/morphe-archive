.class public abstract Lrr2;
.super Lltl;
.source "SourceFile"


# instance fields
.field public r:Lor2;

.field public s:Lpq3;

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public final v:Lkdg;

.field public w:Lcom/opera/android/autofill/AutofillManager;

.field public x:Ltr2;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 32
    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f1401fc

    .line 33
    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    .line 34
    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput v1, v0, Litl;->k:I

    .line 35
    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    .line 36
    new-instance v0, Lkdg;

    .line 37
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object v0, p0, Lrr2;->v:Lkdg;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 4

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140292

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    iput p1, v0, Litl;->b:I

    const/4 p1, 0x1

    iput p1, v0, Litl;->k:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance p1, Lkdg;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrr2;->v:Lkdg;

    return-void
.end method


# virtual methods
.method public G0()V
    .registers 2

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0}, Lryl;->g0()V

    return-void
.end method

.method public H0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lrr2;->w:Lcom/opera/android/autofill/AutofillManager;

    new-instance v2, Lcom/opera/android/autofill/Address;

    const-string v16, ""

    const/16 v17, 0x1

    const-string v3, ""

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

    new-instance v3, Lva2;

    const/4 v4, 0x6

    invoke-direct {v3, v0, v4}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2, v3}, Lcom/opera/android/autofill/AutofillManager;->a(Lcom/opera/android/autofill/Address;Lcom/opera/android/autofill/AutofillManager$AutofillCallback;)V

    return-void
.end method

.method public final I0(Lcom/google/android/material/textfield/TextInputLayout;I)V
    .registers 7

    const/4 v0, 0x4

    if-ne p2, v0, :cond_16

    iget-object p2, p1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance v1, Lqr2;

    iget-object v2, p0, Lrr2;->u:Ljava/lang/String;

    iget-object v3, p0, Lrr2;->t:Ljava/lang/String;

    invoke-direct {v1, p1, v2}, Lqr2;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/String;)V

    const/4 v2, 0x0

    iput-boolean v2, v1, Lqr2;->d:Z

    iput-object v3, v1, Lqr2;->c:Ljava/lang/String;

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    :cond_16
    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance p2, Lmj2;

    invoke-direct {p2, p0, v0}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method public J0()V
    .registers 3

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lrr2;->I0(Lcom/google/android/material/textfield/TextInputLayout;I)V

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lrr2;->I0(Lcom/google/android/material/textfield/TextInputLayout;I)V

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lrr2;->I0(Lcom/google/android/material/textfield/TextInputLayout;I)V

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    iget-object p0, p0, Lrr2;->v:Lkdg;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method public final K0()V
    .registers 2

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lrr2;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_38

    const/4 v0, 0x0

    goto :goto_39

    :cond_38
    const/4 v0, 0x1

    :goto_39
    iget-object p0, p0, Lrr2;->s:Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lrr2;->r:Lor2;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p1, 0x7f140cba

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lrr2;->u:Ljava/lang/String;

    const p1, 0x7f140ca6

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lrr2;->t:Ljava/lang/String;

    iget-object p1, p0, Lrr2;->r:Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lrr2;->K0()V

    invoke-virtual {p0}, Lrr2;->J0()V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Lrr2;->s:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f140ee9

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lrr2;->s:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lpr2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lpr2;-><init>(Lrr2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lrr2;->s:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f1403bf

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lrr2;->s:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lpr2;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lpr2;-><init>(Lrr2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 11

    const v0, 0x7f0d007d

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0369

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v3, :cond_47

    const p2, 0x7f0a073c

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v4, :cond_47

    const p2, 0x7f0a0830

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v5, :cond_47

    const p2, 0x7f0a08d5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_47

    new-instance v1, Lor2;

    move-object v2, p1

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lrr2;->r:Lor2;

    return-void

    :cond_47
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
