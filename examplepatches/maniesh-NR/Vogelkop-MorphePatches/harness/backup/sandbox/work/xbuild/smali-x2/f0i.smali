.class public final Lf0i;
.super Lo1e;
.source "SourceFile"


# instance fields
.field public final f:Ldb;

.field public g:Ly83;

.field public h:Landroid/widget/Button;

.field public final i:Lcom/opera/android/autofill/PasswordManager;

.field public j:B

.field public final k:Ll31;


# direct methods
.method public constructor <init>(Ldb;Lcom/opera/android/autofill/PasswordManager;Ll31;)V
    .registers 4

    invoke-direct {p0}, Luim;-><init>()V

    iput-object p2, p0, Lf0i;->i:Lcom/opera/android/autofill/PasswordManager;

    iput-object p1, p0, Lf0i;->f:Ldb;

    iput-object p3, p0, Lf0i;->k:Ll31;

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4

    new-instance p1, Lv48;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, v1}, Lv48;-><init>(Luim;Landroid/content/Context;B)V

    return-object p1
.end method

.method public final i0()V
    .registers 2

    iget-object v0, p0, Lf0i;->f:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-nez v0, :cond_d

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lf0i;->o0(I)V

    return-void

    :cond_d
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lf0i;->o0(I)V

    return-void
.end method

.method public final j0()V
    .registers 2

    invoke-super {p0}, Lo1e;->j0()V

    iget-object v0, p0, Lf0i;->f:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lf0i;->o0(I)V

    return-void

    :cond_10
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lf0i;->o0(I)V

    return-void
.end method

.method public final l0(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lf0i;->g:Ly83;

    if-eqz p0, :cond_b

    iget-object p0, p0, Ly83;->f:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :cond_b
    return-void
.end method

.method public final o0(I)V
    .registers 7

    iget-byte v0, p0, Lf0i;->j:B

    if-eq v0, p1, :cond_a2

    iget-object v0, p0, Lf0i;->h:Landroid/widget/Button;

    if-eqz v0, :cond_a2

    iget-object v0, p0, Lf0i;->g:Ly83;

    if-eqz v0, :cond_a2

    iput-byte p1, p0, Lf0i;->j:B

    iget-object p1, v0, Ly83;->h:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lf0i;->g:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-byte p1, p0, Lf0i;->j:B

    const v0, 0x7f140968

    const/4 v1, 0x0

    if-eqz p1, :cond_93

    const/4 v2, 0x1

    if-eq p1, v2, :cond_93

    const/4 v3, 0x2

    if-eq p1, v3, :cond_66

    const/4 v4, 0x3

    if-eq p1, v4, :cond_35

    const/4 v4, 0x4

    if-eq p1, v4, :cond_66

    goto :goto_a2

    :cond_35
    iget-object p1, p0, Lf0i;->h:Landroid/widget/Button;

    const v0, 0x7f140eb0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf0i;->h:Landroid/widget/Button;

    new-instance v0, Ld0i;

    invoke-direct {v0, p0, v3}, Ld0i;-><init>(Lf0i;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lf0i;->g:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const v0, 0x7f140eb1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf0i;->g:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lf0i;->g:Ly83;

    iget-object p0, p0, Ly83;->h:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_66
    iget-object p1, p0, Lf0i;->h:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf0i;->h:Landroid/widget/Button;

    new-instance v0, Ld0i;

    invoke-direct {v0, p0, v2}, Ld0i;-><init>(Lf0i;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lf0i;->g:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-byte v0, p0, Lf0i;->j:B

    if-ne v0, v3, :cond_83

    const v0, 0x7f141201

    goto :goto_86

    :cond_83
    const v0, 0x7f141200

    :goto_86
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p0, p0, Lf0i;->g:Ly83;

    iget-object p0, p0, Ly83;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_93
    iget-object p1, p0, Lf0i;->h:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf0i;->h:Landroid/widget/Button;

    new-instance v0, Ld0i;

    invoke-direct {v0, p0, v1}, Ld0i;-><init>(Lf0i;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_a2
    :goto_a2
    return-void
.end method

.method public final p0(Landroidx/fragment/app/w;Ljava/lang/String;)Z
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    new-instance v1, Lzzh;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Lzzh;-><init>(Ljava/lang/Object;B)V

    const/4 p1, 0x0

    iget-object p0, p0, Lf0i;->f:Ldb;

    invoke-virtual {p0, v0, p2, v1, p1}, Ldb;->k(Landroid/app/Activity;Ljava/lang/String;Lcom/opera/api/Callback;Lab;)Z

    move-result p0

    return p0
.end method
