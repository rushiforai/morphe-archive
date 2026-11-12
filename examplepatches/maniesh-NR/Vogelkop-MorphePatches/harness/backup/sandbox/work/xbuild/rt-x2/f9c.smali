.class public final Lf9c;
.super Lltl;
.source "SourceFile"


# instance fields
.field public final synthetic r:B

.field public s:Ljava/lang/Object;

.field public t:Ljava/lang/Object;

.field public u:Ljava/lang/Object;

.field public v:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcie;Li16;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lf9c;->r:B

    const v0, 0x7f0d0144

    .line 40
    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    .line 41
    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    .line 42
    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    .line 43
    iput-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    .line 44
    iput-object p2, p0, Lf9c;->t:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lilh;Leof;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lf9c;->r:B

    const/4 v0, 0x4

    .line 34
    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140636

    .line 35
    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    .line 36
    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput v1, v0, Litl;->k:I

    .line 37
    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    .line 38
    iput-object p1, p0, Lf9c;->u:Ljava/lang/Object;

    .line 39
    iput-object p2, p0, Lf9c;->v:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lva2;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lf9c;->r:B

    const/4 v1, 0x4

    invoke-static {v1}, Lu7k;->f(I)Lu7k;

    move-result-object v1

    const v2, 0x7f1400dc

    invoke-virtual {v1, v2}, Lu7k;->s(I)V

    iget-object v1, v1, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    iput v0, v1, Litl;->k:I

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    new-instance v0, Lmj2;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lmj2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lf9c;->u:Ljava/lang/Object;

    iput-object p1, p0, Lf9c;->v:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 4

    iget-object v0, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast v0, Lzu;

    iget-object v0, v0, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v1, 0x0

    :goto_1b
    iget-object v2, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast v2, Lzu;

    iget-object v2, v2, Lzu;->d:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_31

    if-nez v1, :cond_31

    const v0, 0x7f140884

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_32

    :cond_31
    const/4 v0, 0x0

    :goto_32
    invoke-virtual {v2, v0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p0, Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final l0(Z)V
    .registers 3

    iget-byte v0, p0, Lf9c;->r:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    iget-object p0, p0, Lf9c;->v:Ljava/lang/Object;

    check-cast p0, Li9c;

    if-eqz p0, :cond_1a

    iget-object p0, p0, Li9c;->f:Ljava/lang/Object;

    check-cast p0, Li16;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Li16;->x(ZZ)V

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 3

    iget-byte v0, p0, Lf9c;->r:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    new-instance v0, Lr9i;

    invoke-direct {v0, p0, p1}, Lr9i;-><init>(Lf9c;Landroid/content/Context;)V

    iput-object v0, p0, Lf9c;->u:Ljava/lang/Object;

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onDestroyView()V
    .registers 2

    iget-byte v0, p0, Lf9c;->r:B

    packed-switch v0, :pswitch_data_2a

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void

    :pswitch_9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lq9n;->v(Landroid/view/Window;)Z

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lf9c;->s:Ljava/lang/Object;

    return-void

    :pswitch_1b
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lq9n;->v(Landroid/view/Window;)Z

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_9
    .end packed-switch
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    iget-byte v0, p0, Lf9c;->r:B

    packed-switch v0, :pswitch_data_32

    invoke-super {p0, p1}, Lltl;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p1, Lzu;

    iget-object p1, p1, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_30

    iget-object v0, p0, Lf9c;->v:Ljava/lang/Object;

    check-cast v0, Lva2;

    iget-object v0, v0, Lva2;->b:Ljava/lang/Object;

    check-cast v0, Lm93;

    invoke-virtual {v0, p1}, Lm93;->G0(Ljava/lang/String;)V

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_30
    const/4 p0, 0x1

    return p0

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 10

    iget-byte v0, p0, Lf9c;->r:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_146

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    iget-object p2, p0, Lf9c;->u:Ljava/lang/Object;

    check-cast p2, Lilh;

    iget-object v0, p2, Lilh;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    iget-object p2, p2, Lilh;->b:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    new-instance p1, Lpjg;

    const/16 p2, 0x10

    invoke-direct {p1, p0, p2}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p2, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p2, Lcom/google/android/material/textfield/TextInputLayout;

    iput-boolean v1, p2, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    iget-object p2, p1, Lor2;->e:Ljava/lang/Object;

    check-cast p2, Lcom/google/android/material/textfield/TextInputLayout;

    iput-boolean v1, p2, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    iget-object p0, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p0, Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v1

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_67
    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p1, Lzu;

    iget-object p1, p1, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    new-instance p1, Lfv2;

    const/16 p2, 0x9

    invoke-direct {p1, p0, p2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lf9c;->G0()V

    return-void

    :pswitch_81
    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0a0445

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    const v0, 0x7f0a044f

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const v2, 0x7f0a0453

    invoke-static {p1, v2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    new-instance v3, Li9c;

    iget-object v4, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast v4, Lcie;

    iget-object v5, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast v5, Li16;

    invoke-direct {v3, p2, v4, v5}, Li9c;-><init>(Landroid/view/ViewGroup;Lcie;Li16;)V

    iput-object v3, p0, Lf9c;->v:Ljava/lang/Object;

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object v3, p0, Lf9c;->v:Ljava/lang/Object;

    check-cast v3, Li9c;

    new-instance v5, Ly0a;

    const/4 v6, 0x7

    invoke-direct {v5, v0, v6}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iput-object v5, v3, Li9c;->g:Ljava/lang/Object;

    iget-boolean v3, v3, Li9c;->b:Z

    if-eqz v3, :cond_c9

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5, v3}, Ly0a;->run(Ljava/lang/Object;)V

    :cond_c9
    iget-object v3, p0, Lf9c;->v:Ljava/lang/Object;

    check-cast v3, Li9c;

    iget-object v3, v3, Li9c;->e:Ljava/lang/Object;

    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v3, p0, Lf9c;->v:Ljava/lang/Object;

    check-cast v3, Li9c;

    iget-object v3, v3, Li9c;->e:Ljava/lang/Object;

    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v2, Lsma;

    invoke-direct {v2, p0, v6}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0a0448

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    iget-object v2, v4, Lcie;->o:Ljava/lang/String;

    invoke-static {v0, p1}, Lga6;->m(Landroid/widget/ImageView;Landroid/view/View;)Lga6;

    move-result-object v3

    invoke-static {v2, v0, v3}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    const v0, 0x7f0a0452

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;

    const v2, 0x7f0a0444

    invoke-static {p1, v2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    iget-object v2, p0, Lf9c;->u:Ljava/lang/Object;

    check-cast v2, Lr9i;

    invoke-virtual {v2, v1}, Lr9i;->W(Z)V

    new-instance v2, Le9c;

    invoke-direct {v2, p0, v0}, Le9c;-><init>(Lf9c;Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;)V

    new-instance v3, Lz0c;

    invoke-direct {v3, p0, v2, v1}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v3, v0, Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;->K:Lz0c;

    iget v0, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->s:I

    int-to-float v0, v0

    const/high16 v3, 0x437f0000    # 255.0f

    div-float/2addr v0, v3

    iget-object p0, p0, Lf9c;->u:Ljava/lang/Object;

    check-cast p0, Lr9i;

    float-to-double v3, v0

    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    cmpg-double v3, v3, v5

    if-ltz v3, :cond_13c

    move v1, p2

    :cond_13c
    invoke-virtual {p0, v1}, Lr9i;->W(Z)V

    iput v0, v2, Le9c;->b:F

    invoke-static {p1, v2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void

    nop

    :pswitch_data_146
    .packed-switch 0x0
        :pswitch_81
        :pswitch_67
    .end packed-switch
.end method

.method public final s0()I
    .registers 2

    iget-byte v0, p0, Lf9c;->r:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lltl;->s0()I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f14044d

    return p0

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 3

    iget-byte v0, p0, Lf9c;->r:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0, p1}, Lltl;->t0(Landroid/content/Context;)I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f080522

    return p0

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 8

    iget-byte v0, p0, Lf9c;->r:B

    const/4 v1, 0x1

    const v2, 0x7f1403bf

    const/4 v3, 0x0

    const v4, 0x7f140ee9

    packed-switch v0, :pswitch_data_70

    return-void

    :pswitch_e
    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p1, Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lklh;

    invoke-direct {p2, p0, v3}, Lklh;-><init>(Lf9c;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p1, Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p1, Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lklh;

    invoke-direct {p2, p0, v1}, Lklh;-><init>(Lf9c;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_3f
    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p1, Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ll93;

    invoke-direct {p2, p0, v3}, Ll93;-><init>(Lf9c;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p1, Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf9c;->t:Ljava/lang/Object;

    check-cast p1, Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ll93;

    invoke-direct {p2, p0, v1}, Ll93;-><init>(Lf9c;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_data_70
    .packed-switch 0x1
        :pswitch_3f
        :pswitch_e
    .end packed-switch
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 14

    iget-byte v0, p0, Lf9c;->r:B

    const-string v1, "Missing required view with ID: "

    const v2, 0x7f0a0c68

    const v3, 0x7f0a0c64

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_b8

    invoke-super {p0, p1, p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    return-void

    :pswitch_12
    const v0, 0x7f0d035f

    invoke-virtual {p1, v0, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a06c5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v7, :cond_61

    const p2, 0x7f0a0ba7

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v8, :cond_61

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v9, p2

    check-cast v9, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v9, :cond_5f

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v10, p2

    check-cast v10, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v10, :cond_62

    new-instance v5, Lor2;

    move-object v6, p1

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct/range {v5 .. v10}, Lor2;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;)V

    iput-object v5, p0, Lf9c;->s:Ljava/lang/Object;

    iput-boolean v4, v8, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    iput-boolean v4, v10, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    new-instance p1, Lmj2;

    const/16 p2, 0xb

    invoke-direct {p1, p0, p2}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v7, p1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    goto :goto_71

    :cond_5f
    move v2, v3

    goto :goto_62

    :cond_61
    move v2, p2

    :cond_62
    :goto_62
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_71
    return-void

    :pswitch_72
    const v0, 0x7f0d0033

    invoke-virtual {p1, v0, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz p2, :cond_a7

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v0, :cond_a8

    new-instance v1, Lzu;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1, p2, v0}, Lzu;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;)V

    iput-object v1, p0, Lf9c;->s:Ljava/lang/Object;

    iget-object p1, p0, Lf9c;->u:Ljava/lang/Object;

    check-cast p1, Lmj2;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p0, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p0, Lzu;

    iget-object p0, p0, Lzu;->d:Lcom/google/android/material/textfield/TextInputLayout;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    goto :goto_b7

    :cond_a7
    move v2, v3

    :cond_a8
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_b7
    return-void

    :pswitch_data_b8
    .packed-switch 0x1
        :pswitch_72
        :pswitch_12
    .end packed-switch
.end method
