.class public final Lly4;
.super Lltl;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public r:Ljava/util/List;

.field public s:Lbm8;

.field public t:Lky4;

.field public u:Lcom/google/android/material/textfield/TextInputLayout;

.field public v:Lzy9;

.field public w:Landroidx/core/widget/NestedScrollView;

.field public x:Landroid/widget/LinearLayout;

.field public y:Lcom/google/android/material/button/MaterialButton;


# virtual methods
.method public final G0()V
    .registers 7

    iget-object v0, p0, Lly4;->x:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v0, :cond_3c

    iget-object v3, p0, Lly4;->x:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0a0202

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x1

    if-eqz v4, :cond_21

    check-cast v4, Lcom/opera/android/custom_views/CheckBox;

    iget-boolean v3, v4, Lcom/opera/android/custom_views/CheckBox;->n:Z

    if-eqz v3, :cond_39

    goto :goto_37

    :cond_21
    instance-of v4, v3, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v4, :cond_39

    check-cast v3, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v3, v3, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_39

    :goto_37
    move v1, v5

    goto :goto_3c

    :cond_39
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_3c
    :goto_3c
    iget-object p0, p0, Lly4;->y:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final l0(Z)V
    .registers 2

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    iget-object p0, p0, Lly4;->s:Lbm8;

    if-eqz p0, :cond_f

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lox8;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lox8;->f(Ljava/util/List;)V

    :cond_f
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 8

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0a0aef

    if-ne p1, v0, :cond_6e

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lly4;->x:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_15
    if-ge v1, v0, :cond_62

    iget-object v2, p0, Lly4;->x:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a0202

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_36

    check-cast v3, Lcom/opera/android/custom_views/CheckBox;

    iget-boolean v3, v3, Lcom/opera/android/custom_views/CheckBox;->n:Z

    if-eqz v3, :cond_5f

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltx8;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5f

    :cond_36
    instance-of v3, v2, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v3, :cond_5f

    move-object v3, v2

    check-cast v3, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v3, v3, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5f

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltx8;

    new-instance v4, Ltx8;

    iget-object v5, v2, Ltx8;->a:Ljava/lang/String;

    iget-object v2, v2, Ltx8;->c:Ljava/lang/String;

    invoke-direct {v4, v5, v3, v2}, Ltx8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5f
    :goto_5f
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    :cond_62
    iget-object v0, p0, Lly4;->s:Lbm8;

    if-eqz v0, :cond_7a

    iget-object v0, v0, Lbm8;->b:Ljava/lang/Object;

    check-cast v0, Lox8;

    invoke-interface {v0, p1}, Lox8;->f(Ljava/util/List;)V

    goto :goto_7a

    :cond_6e
    iget-object p1, p0, Lly4;->s:Lbm8;

    if-eqz p1, :cond_7a

    iget-object p1, p1, Lbm8;->b:Ljava/lang/Object;

    check-cast p1, Lox8;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lox8;->f(Ljava/util/List;)V

    :cond_7a
    :goto_7a
    invoke-virtual {p0}, Lryl;->g0()V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 5

    const v0, 0x7f0d02da

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0aef

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_23

    check-cast p1, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lly4;->y:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lly4;->y:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :cond_23
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

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 8

    move-object v0, p2

    check-cast v0, Landroidx/core/widget/NestedScrollView;

    iput-object v0, p0, Lly4;->w:Landroidx/core/widget/NestedScrollView;

    const v0, 0x7f0d02d9

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v0, :cond_b9

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lly4;->x:Landroid/widget/LinearLayout;

    iget-object p2, p0, Lly4;->r:Ljava/util/List;

    if-eqz p2, :cond_b8

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1e
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b8

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltx8;

    iget-object v2, v0, Ltx8;->d:Ljava/lang/String;

    iget-object v3, v0, Ltx8;->e:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    iget-object v4, p0, Lly4;->x:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_62

    const v2, 0x7f0d02dc

    invoke-virtual {p1, v2, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v0, v2

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v0, p0, Lly4;->u:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lly4;->u:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    check-cast v0, Lcom/opera/android/custom_views/ObservableEditText;

    iget-object v3, p0, Lly4;->t:Lky4;

    if-nez v3, :cond_59

    new-instance v3, Lky4;

    invoke-direct {v3, p0, v1}, Lky4;-><init>(Ljava/lang/Object;B)V

    iput-object v3, p0, Lly4;->t:Lky4;

    :cond_59
    invoke-virtual {v0, v3}, Lcom/opera/android/custom_views/ObservableEditText;->m(Lz6f;)V

    iget-object v0, p0, Lly4;->x:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_1e

    :cond_62
    const v2, 0x7f0d02db

    invoke-virtual {p1, v2, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const v4, 0x7f0a069d

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v0, v0, Ltx8;->d:Ljava/lang/String;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0a02d0

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8e

    move v3, v1

    goto :goto_90

    :cond_8e
    const/16 v3, 0x8

    :goto_90
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0a0202

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/CheckBox;

    iget-object v3, p0, Lly4;->v:Lzy9;

    if-nez v3, :cond_a7

    new-instance v3, Lzy9;

    invoke-direct {v3, p0}, Lzy9;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lly4;->v:Lzy9;

    :cond_a7
    iput-object v3, v0, Lcom/opera/android/custom_views/CheckBox;->m:Lav4;

    new-instance v0, Ljy4;

    invoke-direct {v0, v1}, Ljy4;-><init>(B)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lly4;->x:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto/16 :goto_1e

    :cond_b8
    return-void

    :cond_b9
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
