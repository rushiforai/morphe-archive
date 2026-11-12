.class public final Law7;
.super Lh53;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final t:Z

.field public final u:Ldg7;

.field public final v:Lyt7;

.field public final w:Lyu2;

.field public x:Lrf2;

.field public y:Li4d;


# direct methods
.method public constructor <init>(ZLyu2;)V
    .registers 5

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f14063c

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Li93;-><init>(Litl;Z)V

    new-instance v0, Ldg7;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Ldg7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Law7;->u:Ldg7;

    new-instance v0, Lyt7;

    invoke-direct {v0, v1}, Lyt7;-><init>(B)V

    iput-object v0, p0, Law7;->v:Lyt7;

    iput-boolean p1, p0, Law7;->t:Z

    iput-object p2, p0, Law7;->w:Lyu2;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Law7;->v:Lyt7;

    return-object p0
.end method

.method public final H0()V
    .registers 2

    iget-object p0, p0, Law7;->x:Lrf2;

    iget-object v0, p0, Lrf2;->k:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v0, v0, Ll6b;->q:Z

    if-nez v0, :cond_18

    iget-object v0, p0, Lrf2;->g:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v0, v0, Ll6b;->q:Z

    if-nez v0, :cond_18

    const/4 v0, 0x1

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    iget-object p0, p0, Lrf2;->h:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final I0(Z)V
    .registers 8

    iget-object v0, p0, Law7;->x:Lrf2;

    if-eqz v0, :cond_6f

    iget-object v0, p0, Law7;->y:Li4d;

    if-eqz v0, :cond_2c

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lq4g;

    iget-object v1, v0, Lq4g;->F:Landroid/graphics/drawable/Drawable;

    iget-object v0, v0, Lq4g;->v:Lw3g;

    iget-object v2, v0, Lw3g;->c:Ljava/lang/String;

    invoke-static {v0}, Lcqp;->W(Lw3g;)Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Law7;->y:Li4d;

    iget-object v3, v3, Li4d;->b:Ljava/lang/Object;

    check-cast v3, Lq4g;

    iget-object v4, v3, Lq4g;->v:Lw3g;

    iget-object v5, v4, Lw3g;->f:Ljava/lang/String;

    if-eqz p1, :cond_29

    iget-object v3, v3, Lq4g;->u:La4g;

    invoke-virtual {v3, v4}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object v3

    goto :goto_32

    :cond_29
    const-string v3, "fakepass"

    goto :goto_32

    :cond_2c
    const-string v2, ""

    const/4 v1, 0x0

    move-object v0, v2

    move-object v3, v0

    move-object v5, v3

    :goto_32
    iget-object v4, p0, Law7;->x:Lrf2;

    iget-object v4, v4, Lrf2;->c:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v4, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Law7;->x:Lrf2;

    iget-object v1, v1, Lrf2;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Law7;->x:Lrf2;

    iget-object v1, v1, Lrf2;->i:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Law7;->x:Lrf2;

    iget-object v0, v0, Lrf2;->j:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Law7;->x:Lrf2;

    iget-object v0, v0, Lrf2;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez p1, :cond_6f

    iget-object p0, p0, Law7;->x:Lrf2;

    iget-object p0, p0, Lrf2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lc5g;->a(Landroid/widget/TextView;Z)V

    :cond_6f
    return-void
.end method

.method public final l0(Z)V
    .registers 3

    invoke-static {p0}, Lvtp;->M(Landroidx/fragment/app/Fragment;)Z

    move-result v0

    if-nez v0, :cond_f

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_f
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 10

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0916

    if-ne v0, v1, :cond_4e

    iget-object p1, p0, Law7;->y:Li4d;

    if-eqz p1, :cond_5b

    iget-object v0, p0, Law7;->x:Lrf2;

    iget-object v0, v0, Lrf2;->j:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    goto :goto_21

    :cond_20
    move-object v5, v1

    :goto_21
    iget-object v0, p0, Law7;->x:Lrf2;

    iget-object v0, v0, Lrf2;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_31

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_31
    move-object v6, v1

    iget-object v0, p1, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lq4g;

    iget-object v1, v0, Lq4g;->u:La4g;

    iget-object v0, v0, Lq4g;->v:Lw3g;

    new-instance v7, Leof;

    const/4 v2, 0x5

    iget-object p0, p0, Law7;->u:Ldg7;

    invoke-direct {v7, p1, p0, v2}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v1, La4g;->a:Ljava/util/List;

    invoke-static {p0, v0}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v4

    iget-wide v2, v1, La4g;->b:J

    invoke-static/range {v2 .. v7}, LJ/N;->MjE4dyB7(JILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_4e
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0a01c7

    if-ne p1, v0, :cond_5b

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Law7;->l0(Z)V

    :cond_5b
    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Law7;->x:Lrf2;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Law7;->x:Lrf2;

    iget-object p1, p1, Lrf2;->b:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ScrollView;

    const/16 p2, 0x8

    invoke-static {p1, p2}, Lr5n;->n(Landroid/view/View;I)V

    iget-object p1, p0, Law7;->x:Lrf2;

    iget-object p1, p1, Lrf2;->e:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Law7;->x:Lrf2;

    iget-object p1, p1, Lrf2;->h:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Law7;->x:Lrf2;

    iget-object p1, p1, Lrf2;->j:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance p2, Lvp2;

    invoke-direct {p2, p0}, Lvp2;-><init>(Law7;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p1, p0, Law7;->x:Lrf2;

    iget-object p1, p1, Lrf2;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance p2, Lmj2;

    const/4 v0, 0x7

    invoke-direct {p2, p0, v0}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    sget-object p1, Lwi2;->i:Lwi2;

    iget-object p1, p1, Llj2;->d:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Lks6;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v0}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p0, Law7;->x:Lrf2;

    iget-object p1, p1, Lrf2;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    iget-boolean p0, p0, Law7;->t:Z

    invoke-static {p1, p0}, Lc5g;->a(Landroid/widget/TextView;Z)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-super/range {p0 .. p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v2, 0x7f0d0119

    const/4 v3, 0x0

    move-object/from16 v4, p1

    invoke-virtual {v4, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a01c7

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/google/android/material/button/MaterialButton;

    if-eqz v7, :cond_c6

    const v1, 0x7f0a0322

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v8, :cond_c6

    const v1, 0x7f0a0813

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v9, :cond_c6

    const v1, 0x7f0a0815

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v10, :cond_c6

    const v1, 0x7f0a0916

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lcom/google/android/material/button/MaterialButton;

    if-eqz v11, :cond_c6

    const v1, 0x7f0a0a6a

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_c6

    invoke-static {v4}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v12

    const v1, 0x7f0a0a9f

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Space;

    if-eqz v4, :cond_c6

    const v1, 0x7f0a06c5

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v13, :cond_c6

    const v1, 0x7f0a0c78

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v14, :cond_c6

    const v1, 0x7f0a0c79

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v15, :cond_c6

    new-instance v5, Lrf2;

    move-object v6, v2

    check-cast v6, Landroid/widget/ScrollView;

    const/16 v16, 0x2

    invoke-direct/range {v5 .. v16}, Lrf2;-><init>(Landroid/widget/FrameLayout;Landroid/widget/TextView;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v5, v0, Law7;->x:Lrf2;

    iget-object v1, v0, Law7;->w:Lyu2;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_a4

    const/4 v3, 0x1

    :cond_a4
    iget-object v0, v0, Law7;->x:Lrf2;

    if-eqz v3, :cond_b7

    iget-object v0, v0, Lrf2;->i:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f140637

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_b7
    iget-object v0, v0, Lrf2;->i:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f140639

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_c6
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
