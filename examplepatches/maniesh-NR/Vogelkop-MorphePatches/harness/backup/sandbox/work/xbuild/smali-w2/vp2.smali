.class public final Lvp2;
.super Lca3;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Law7;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lvp2;->b:B

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lca3;-><init>(B)V

    iput-object p1, p0, Lvp2;->d:Ljava/lang/Object;

    const-string p1, ""

    iput-object p1, p0, Lvp2;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 16
    iput-byte p3, p0, Lvp2;->b:B

    const/4 p3, 0x0

    invoke-direct {p0, p3}, Lca3;-><init>(B)V

    iput-object p2, p0, Lvp2;->c:Ljava/lang/Object;

    iput-object p1, p0, Lvp2;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmv;Lbz0;Landroid/widget/EditText;)V
    .registers 4

    const/4 p1, 0x1

    iput-byte p1, p0, Lvp2;->b:B

    const/4 p1, 0x0

    .line 14
    invoke-direct {p0, p1}, Lca3;-><init>(B)V

    .line 15
    iput-object p2, p0, Lvp2;->c:Ljava/lang/Object;

    iput-object p3, p0, Lvp2;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 11

    iget-byte v0, p0, Lvp2;->b:B

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-string v5, ""

    iget-object v6, p0, Lvp2;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_b4

    check-cast v6, Los1;

    iget-object v0, v6, Los1;->d:Ljava/lang/Object;

    check-cast v0, Lfl3;

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    :cond_19
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    iget-object v7, v0, Lfl3;->u:Lel3;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v7, v8, v5}, Lel3;->G(Landroid/content/res/Resources;Ljava/lang/String;)Z

    move-result v5

    iget-object p0, p0, Lvp2;->c:Ljava/lang/Object;

    check-cast p0, Lbz0;

    if-nez p1, :cond_34

    if-nez v5, :cond_34

    move v3, v4

    :cond_34
    invoke-virtual {p0, v2}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, v6, Los1;->c:Ljava/lang/Object;

    check-cast p0, Lov0;

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v5, :cond_4c

    const p1, 0x7f1407b5

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_4c
    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_50
    if-eqz p1, :cond_56

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    :cond_56
    iget-object p1, p0, Lvp2;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_85

    iput-object v5, p0, Lvp2;->c:Ljava/lang/Object;

    check-cast v6, Law7;

    iget-object p1, v6, Law7;->y:Li4d;

    if-eqz p1, :cond_85

    iget-object p1, p1, Li4d;->b:Ljava/lang/Object;

    check-cast p1, Lq4g;

    iget-object p1, p1, Lq4g;->v:Lw3g;

    iget-object v0, p1, Lw3g;->g:Ljava/lang/String;

    iget-object p1, p1, Lw3g;->f:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7c

    invoke-virtual {p0, v3}, Lvp2;->l(Z)V

    goto :goto_85

    :cond_7c
    new-instance p1, Ldg7;

    const/4 v1, 0x7

    invoke-direct {p1, p0, v1}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v5, v0, p1}, LJ/N;->MoLZR6Z2(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_85
    :goto_85
    return-void

    :pswitch_86
    iget-object p0, p0, Lvp2;->c:Ljava/lang/Object;

    check-cast p0, Lbz0;

    check-cast v6, Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/2addr p1, v4

    invoke-virtual {p0, v2}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_9d
    check-cast v6, Lwp2;

    iget-object v0, v6, Lwp2;->c:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    iget-object v0, v6, Lwp2;->d:Liq2;

    iget-object p0, p0, Lvp2;->c:Ljava/lang/Object;

    check-cast p0, Lfw;

    iget-object p0, p0, Lfw;->a:Lew;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Liq2;->O0(Lew;Ljava/lang/String;)V

    return-void

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_9d
        :pswitch_86
        :pswitch_50
    .end packed-switch
.end method

.method public final l(Z)V
    .registers 4

    iget-object p0, p0, Lvp2;->d:Ljava/lang/Object;

    check-cast p0, Law7;

    iget-object v0, p0, Law7;->x:Lrf2;

    iget-object v1, v0, Lrf2;->k:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, v1, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v1, v1, Ll6b;->q:Z

    if-ne v1, p1, :cond_11

    return-void

    :cond_11
    iget-object v0, v0, Lrf2;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ScrollView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lh3m;->a(Landroid/view/ViewGroup;Ly2m;)V

    iget-object v0, p0, Law7;->x:Lrf2;

    if-eqz p1, :cond_2c

    iget-object p1, v0, Lrf2;->k:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    const v0, 0x7f14063a

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_34

    :cond_2c
    iget-object p1, v0, Lrf2;->k:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    :goto_34
    invoke-virtual {p0}, Law7;->H0()V

    return-void
.end method
