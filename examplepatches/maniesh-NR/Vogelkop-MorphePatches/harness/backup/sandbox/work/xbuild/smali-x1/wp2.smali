.class public final Lwp2;
.super Ltp2;
.source "SourceFile"


# instance fields
.field public final c:Lcom/google/android/material/textfield/TextInputLayout;

.field public final synthetic d:Liq2;


# direct methods
.method public constructor <init>(Liq2;Landroid/view/View;)V
    .registers 3

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lwp2;->d:Liq2;

    invoke-direct {p0, p1, p2}, Ltp2;-><init>(Liq2;Landroid/view/View;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a05ef

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p1, p0, Lwp2;->c:Lcom/google/android/material/textfield/TextInputLayout;

    return-void
.end method


# virtual methods
.method public final V(Lfw;)V
    .registers 7

    invoke-virtual {p0, p1}, Ltp2;->X(Lfw;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lwp2;->c:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    iget-object v0, p1, Lfw;->a:Lew;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_36

    const/16 v3, 0x8

    if-eq v2, v3, :cond_2e

    const/4 v3, 0x4

    if-eq v2, v3, :cond_36

    const/4 v3, 0x5

    if-eq v2, v3, :cond_36

    iget-object v3, v1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    const/4 v4, 0x6

    if-eq v2, v4, :cond_27

    const/16 v2, 0x2071

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setInputType(I)V

    goto :goto_3d

    :cond_27
    const v2, 0x22071

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setInputType(I)V

    goto :goto_3d

    :cond_2e
    iget-object v2, v1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    const/16 v3, 0x2061

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setInputType(I)V

    goto :goto_3d

    :cond_36
    iget-object v2, v1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    const/16 v3, 0x1071

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setInputType(I)V

    :goto_3d
    iget-object v2, p0, Lwp2;->d:Liq2;

    iget-object v2, v2, Liq2;->v:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v1, v0}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    iget-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance v2, Lvp2;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Lvp2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance v2, Lup2;

    invoke-direct {v2, p0, p1, v3}, Lup2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object p0, p1, Lfw;->e:Ljava/lang/String;

    invoke-virtual {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void
.end method
