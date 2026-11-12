.class public Ll18;
.super Lo1e;
.source "SourceFile"


# instance fields
.field public f:Landroid/widget/EditText;

.field public g:Lcom/google/android/material/textfield/TextInputLayout;

.field public h:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Luim;-><init>()V

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 7

    new-instance p1, Laz0;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-direct {p1, v0}, Laz0;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0124

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a0810

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Ll18;->f:Landroid/widget/EditText;

    const v1, 0x7f0a0811

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v1, p0, Ll18;->g:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Ll18;->f:Landroid/widget/EditText;

    new-instance v3, Lmj2;

    const/16 v4, 0x8

    invoke-direct {v3, p0, v4}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    const v0, 0x7f140c64

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    const v0, 0x7f140c65

    invoke-virtual {p1, v0, v2}, Laz0;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    const v0, 0x7f1403bf

    invoke-virtual {p1, v0, v2}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    invoke-virtual {p1}, Laz0;->create()Lbz0;

    move-result-object p1

    new-instance v0, Lkz0;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lkz0;-><init>(Ljava/lang/Object;Landroid/app/Dialog;B)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    return-object p1
.end method

.method public final k0()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Ll18;->h:Z

    invoke-super {p0}, Lo1e;->k0()V

    return-void
.end method

.method public final l0(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Ll18;->g:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void
.end method
