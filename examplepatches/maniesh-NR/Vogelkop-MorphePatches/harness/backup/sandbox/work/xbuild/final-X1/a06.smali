.class public La06;
.super Lltl;
.source "SourceFile"


# instance fields
.field public r:Lvs;

.field public s:Lpq3;

.field public t:Z

.field public u:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .registers 3

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f1404e4

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput v1, v0, Litl;->k:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    return-void
.end method


# virtual methods
.method public final G0(I)V
    .registers 4

    const/4 v0, 0x5

    if-ge p1, v0, :cond_29

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->h()Z

    move-result v0

    if-nez v0, :cond_29

    new-instance v0, Lbr;

    const/16 v1, 0x8

    invoke-direct {v0, p0, p1, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    const-wide/16 p0, 0x64

    invoke-static {v0, p0, p1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void

    :cond_29
    iget-boolean p1, p0, La06;->t:Z

    if-nez p1, :cond_39

    const/4 p1, 0x1

    iput-boolean p1, p0, La06;->t:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_39

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_39
    return-void
.end method

.method public final H0(Z)Z
    .registers 7

    iget-object v0, p0, La06;->r:Lvs;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, La06;->r:Lvs;

    iget-object v1, v1, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-nez v2, :cond_50

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_50

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, La06;->r:Lvs;

    if-nez v0, :cond_47

    iget-object v0, v1, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz p1, :cond_3a

    move p1, v4

    goto :goto_3d

    :cond_3a
    const p1, 0x7f14087f

    :goto_3d
    if-eqz p1, :cond_43

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    :cond_43
    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return v4

    :cond_47
    iget-object p0, v1, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    return p0

    :cond_50
    iget-object p0, p0, La06;->r:Lvs;

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return v4
.end method

.method public final onDestroy()V
    .registers 1

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object p0, p0, La06;->u:Ljava/lang/Runnable;

    if-eqz p0, :cond_a

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_a
    return-void
.end method

.method public final onResume()V
    .registers 3

    invoke-super {p0}, Lltl;->onResume()V

    iget-boolean v0, p0, La06;->t:Z

    if-eqz v0, :cond_14

    const/4 v0, 0x0

    iput-boolean v0, p0, La06;->t:Z

    new-instance v0, Llb4;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Llb4;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_14
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, La06;->H0(Z)Z

    move-result p1

    iget-object p0, p0, La06;->s:Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, La06;->s:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f140ee9

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, La06;->s:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lxz5;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lxz5;-><init>(La06;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, La06;->s:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f1403bf

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, La06;->s:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lxz5;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lxz5;-><init>(La06;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 10

    const v0, 0x7f0d00e0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a025c

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v3, :cond_b7

    const p2, 0x7f0a025d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v4, :cond_b7

    const p2, 0x7f0a03a2

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v5, :cond_b7

    const p2, 0x7f0a03a3

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v0, :cond_b7

    const p2, 0x7f0a0587

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_b7

    const p2, 0x7f0a0588

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_b7

    const p2, 0x7f0a0589

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_b7

    const p2, 0x7f0a058a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v0, :cond_b7

    const p2, 0x7f0a058d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_b7

    const p2, 0x7f0a058e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_b7

    const p2, 0x7f0a058f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_b7

    new-instance v1, Lvs;

    move-object v2, p1

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    const/16 v6, 0x8

    invoke-direct/range {v1 .. v6}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, La06;->r:Lvs;

    new-instance p1, Lzz5;

    invoke-direct {p1, p0}, Lzz5;-><init>(La06;)V

    invoke-virtual {v3, p1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object p2, p0, La06;->r:Lvs;

    iget-object p2, p2, Lvs;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object p2, p0, La06;->r:Lvs;

    iget-object p2, p2, Lvs;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p0, p0, La06;->r:Lvs;

    iget-object p0, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void

    :cond_b7
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
