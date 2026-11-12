.class public final Las;
.super Lss7;
.source "SourceFile"


# instance fields
.field public final D:Lgjm;

.field public E:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 4

    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lss7;-><init>(II)V

    iput-object p1, p0, Las;->D:Lgjm;

    return-void
.end method


# virtual methods
.method public final C0(Litl;)Litl;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lss7;->v:Lal3;

    if-nez p0, :cond_b

    const p0, 0x7f140383

    goto :goto_e

    :cond_b
    const p0, 0x7f140381

    :goto_e
    new-instance v0, Lrxh;

    invoke-direct {v0, p0}, Lrxh;-><init>(I)V

    iput-object v0, p1, Litl;->a:Lpxh;

    return-object p1
.end method

.method public final G0(Lal3;Ljava/lang/String;)Lal3;
    .registers 11

    iget-object v0, p0, Lss7;->v:Lal3;

    if-eqz v0, :cond_2c

    if-nez p1, :cond_12

    iget-object v5, p0, Las;->E:Ljava/lang/String;

    new-instance v1, Lkkj;

    const-wide/16 v2, -0x1

    const/4 v6, 0x0

    move-object v4, p2

    invoke-direct/range {v1 .. v6}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    return-object v1

    :cond_12
    move-object v4, p2

    invoke-interface {v0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_22

    invoke-interface {p1}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object p2

    goto :goto_23

    :cond_22
    move-object p2, v4

    :goto_23
    check-cast p1, Lml3;

    iget-object p0, p0, Las;->E:Ljava/lang/String;

    invoke-static {p1, p2, p0}, Lkkj;->k(Lml3;Ljava/lang/String;Ljava/lang/String;)Lkkj;

    move-result-object p0

    return-object p0

    :cond_2c
    move-object v4, p2

    iget-object v6, p0, Las;->E:Ljava/lang/String;

    new-instance v2, Lkkj;

    move-object v5, v4

    const-wide/16 v3, -0x1

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    return-object v2
.end method

.method public final H0()Lx80;
    .registers 1

    iget-object p0, p0, Lss7;->v:Lal3;

    if-nez p0, :cond_7

    sget-object p0, Lx80;->e:Lx80;

    return-object p0

    :cond_7
    sget-object p0, Lx80;->d:Lx80;

    return-object p0
.end method

.method public final J0()Z
    .registers 3

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-static {v0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-virtual {p0, v0}, Lss7;->I0(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public final K0()V
    .registers 3

    invoke-super {p0}, Lss7;->K0()V

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lss7;->I0(Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v1, p0, Lss7;->t:Lcr2;

    iget-object v1, v1, Lcr2;->e:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v0, :cond_21

    const v0, 0x7f1407b5

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_22

    :cond_21
    const/4 p0, 0x0

    :goto_22
    invoke-virtual {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final Q0()V
    .registers 4

    const/4 v0, 0x0

    iput-object v0, p0, Las;->E:Ljava/lang/String;

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->m:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->j:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0801be

    invoke-static {v2, v1}, Lalo;->A(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f140377

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->h:Ljava/lang/Object;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final R0(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v1, v0, Lcr2;->j:Landroid/view/View;

    check-cast v1, Landroid/widget/ImageView;

    iget-object v0, v0, Lcr2;->g:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lalo;->z(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lss7;->t:Lcr2;

    iget-object p1, p1, Lcr2;->m:Landroid/view/View;

    check-cast p1, Landroid/widget/ImageButton;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lss7;->t:Lcr2;

    iget-object p1, p1, Lcr2;->m:Landroid/view/View;

    check-cast p1, Landroid/widget/ImageButton;

    new-instance v0, Lzr;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lzr;-><init>(Las;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lss7;->t:Lcr2;

    iget-object p1, p1, Lcr2;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const v0, 0x7f140378

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lss7;->t:Lcr2;

    iget-object p1, p1, Lcr2;->h:Ljava/lang/Object;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->e:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    iget-object v0, p0, Lss7;->v:Lal3;

    if-eqz v0, :cond_14

    invoke-interface {v0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3a

    :cond_14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f1407b1

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1f
    invoke-virtual {p0, v0}, Lss7;->I0(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3a

    add-int/lit8 v0, v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f1407b2

    invoke-virtual {p0, v2, v1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    move-object v3, v1

    move v1, v0

    move-object v0, v3

    goto :goto_1f

    :cond_3a
    iget-object v1, p0, Lss7;->t:Lcr2;

    iget-object v1, v1, Lcr2;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->i:Landroid/view/View;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lss7;->v:Lal3;

    check-cast v0, Lml3;

    if-eqz v0, :cond_61

    invoke-interface {v0}, Lol3;->b()Ljava/lang/String;

    move-result-object v0

    goto :goto_62

    :cond_61
    const/4 v0, 0x0

    :goto_62
    if-eqz v0, :cond_6a

    invoke-virtual {p0, v0}, Las;->R0(Ljava/lang/String;)V

    iput-object v0, p0, Las;->E:Ljava/lang/String;

    goto :goto_6d

    :cond_6a
    invoke-virtual {p0}, Las;->Q0()V

    :goto_6d
    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->h:Ljava/lang/Object;

    check-cast v0, Landroid/widget/LinearLayout;

    new-instance v2, Lzr;

    invoke-direct {v2, p0, v1}, Lzr;-><init>(Las;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-super {p0, p1, p2}, Lss7;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void
.end method
