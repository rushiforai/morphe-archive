.class public abstract Lmr2;
.super Lltl;
.source "SourceFile"


# instance fields
.field public final A:Lhr2;

.field public final r:Lorm;

.field public final s:Lcom/opera/android/autofill/AutofillManager;

.field public final t:Lgw;

.field public u:Lcr2;

.field public v:Lpq3;

.field public w:Lro9;

.field public x:Ljava/lang/String;

.field public y:Lfr2;

.field public z:Lcom/opera/android/autofill/PersonalDataMonitor;


# direct methods
.method public constructor <init>(Lorm;Lcom/opera/android/autofill/AutofillManager;Lgw;I)V
    .registers 6

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    invoke-virtual {v0, p4}, Lu7k;->s(I)V

    iget-object p4, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast p4, Litl;

    const/4 v0, 0x0

    iput v0, p4, Litl;->b:I

    const/4 v0, 0x1

    iput v0, p4, Litl;->k:I

    invoke-direct {p0, p4}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Lmr2;->r:Lorm;

    iput-object p2, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    iput-object p3, p0, Lmr2;->t:Lgw;

    new-instance p1, Lhr2;

    invoke-direct {p1, p0}, Lhr2;-><init>(Lmr2;)V

    iput-object p1, p0, Lmr2;->A:Lhr2;

    return-void
.end method


# virtual methods
.method public final G0()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lmr2;->u:Lcr2;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Lcr2;->k:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "\\s+"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const-string v1, ""

    invoke-virtual {v0, p0, v1}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Ljava/lang/String;
    .registers 8

    iget-object p0, p0, Lmr2;->u:Lcr2;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Lcr2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_1a
    if-gt v3, v0, :cond_3a

    if-nez v4, :cond_20

    move v5, v3

    goto :goto_21

    :cond_20
    move v5, v0

    :goto_21
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x20

    if-gt v5, v6, :cond_2b

    move v5, v1

    goto :goto_2c

    :cond_2b
    move v5, v2

    :goto_2c
    if-nez v4, :cond_35

    if-nez v5, :cond_32

    move v4, v1

    goto :goto_1a

    :cond_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_35
    if-eqz v5, :cond_3a

    add-int/lit8 v0, v0, -0x1

    goto :goto_1a

    :cond_3a
    add-int/2addr v0, v1

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public I0()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final J0()Z
    .registers 6

    invoke-virtual {p0}, Lmr2;->H0()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lic4;->C(Ljava/lang/String;)Lfr;

    move-result-object p0

    const/4 v0, 0x1

    if-eqz p0, :cond_34

    iget v1, p0, Lfr;->b:I

    const/16 v2, 0x64

    if-ge v1, v2, :cond_1c

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/Calendar;->get(I)I

    move-result v3

    div-int/2addr v3, v2

    mul-int/2addr v3, v2

    add-int/2addr v1, v3

    :cond_1c
    iget p0, p0, Lfr;->c:I

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    add-int/2addr v2, v0

    if-lt v1, v3, :cond_34

    if-ne v1, v3, :cond_32

    if-lt p0, v2, :cond_34

    :cond_32
    const/4 p0, 0x0

    return p0

    :cond_34
    return v0
.end method

.method public K0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 18

    new-instance v0, Lcom/opera/android/autofill/CreditCard;

    const-string v4, ""

    const/4 v3, 0x0

    const-string v1, ""

    move-object v2, p1

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    invoke-direct/range {v0 .. v9}, Lcom/opera/android/autofill/CreditCard;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lva2;

    const/4 p3, 0x5

    invoke-direct {p1, p0, p3}, Lva2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean p3, p0, Lnrl;->a:Z

    if-eqz p3, :cond_24

    invoke-static {v0, p2, p1}, LJ/N;->M3WZIaM8(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_24
    new-instance p3, Lk3;

    const/16 p4, 0xe

    invoke-direct {p3, v0, p2, p1, p4}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p3}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final L0(Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f04021f

    const v3, 0x7f060ade

    invoke-static {v2, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    iget-object v2, p0, Lmr2;->u:Lcr2;

    const/4 v3, 0x0

    if-eqz p1, :cond_32

    if-nez v2, :cond_1e

    move-object v2, v3

    :cond_1e
    iget-object v0, v2, Lcr2;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p0, p0, Lmr2;->u:Lcr2;

    if-eqz p0, :cond_2a

    move-object v3, p0

    :cond_2a
    iget-object p0, v3, Lcr2;->e:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void

    :cond_32
    if-nez v2, :cond_35

    move-object v2, v3

    :cond_35
    iget-object p1, v2, Lcr2;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Lmr2;->u:Lcr2;

    if-nez p0, :cond_41

    move-object p0, v3

    :cond_41
    iget-object p0, p0, Lcr2;->e:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final M0()V
    .registers 4

    invoke-virtual {p0}, Lmr2;->G0()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, LJ/N;->MSg1Yo08(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lmr2;->v:Lpq3;

    const/4 v2, 0x0

    if-nez v1, :cond_13

    move-object v1, v2

    :cond_13
    iget-object v1, v1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0}, Lmr2;->G0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LJ/N;->MyZkOeCB(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "amex"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    iget-object p0, p0, Lmr2;->u:Lcr2;

    if-eqz v0, :cond_3a

    if-eqz p0, :cond_2f

    move-object v2, p0

    :cond_2f
    iget-object p0, v2, Lcr2;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    const v0, 0x7f14027d

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHint(I)V

    return-void

    :cond_3a
    if-eqz p0, :cond_3d

    move-object v2, p0

    :cond_3d
    iget-object p0, v2, Lcr2;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    const v0, 0x7f14027f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHint(I)V

    return-void
.end method

.method public final onPause()V
    .registers 2

    invoke-super {p0}, Lltl;->onPause()V

    iget-object v0, p0, Lmr2;->z:Lcom/opera/android/autofill/PersonalDataMonitor;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Lcom/opera/android/autofill/PersonalDataMonitor;->a()V

    const/4 v0, 0x0

    iput-object v0, p0, Lmr2;->z:Lcom/opera/android/autofill/PersonalDataMonitor;

    :cond_d
    return-void
.end method

.method public final onResume()V
    .registers 4

    invoke-super {p0}, Lltl;->onResume()V

    iget-object v0, p0, Lmr2;->z:Lcom/opera/android/autofill/PersonalDataMonitor;

    iget-object v1, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    if-nez v0, :cond_19

    new-instance v0, Lq02;

    const/16 v2, 0x19

    invoke-direct {v0, p0, v2}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lcom/opera/android/autofill/AutofillManager;->b(Ljava/lang/Runnable;)Lcom/opera/android/autofill/PersonalDataMonitor;

    move-result-object v0

    iput-object v0, p0, Lmr2;->z:Lcom/opera/android/autofill/PersonalDataMonitor;

    :cond_19
    new-instance v0, Lab;

    const/16 v2, 0x1a

    invoke-direct {v0, p0, v2}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lcom/opera/android/autofill/AutofillManager;->c(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p2, Lro9;

    iget-object v0, p0, Lmr2;->u:Lcr2;

    const/4 v1, 0x0

    if-nez v0, :cond_b

    move-object v0, v1

    :cond_b
    iget-object v0, v0, Lcr2;->h:Ljava/lang/Object;

    check-cast v0, Lhi4;

    iget-object v0, v0, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v2, Lva2;

    const/4 v3, 0x7

    invoke-direct {v2, p0, v3}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, v0, v2}, Lro9;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ltj9;)V

    iput-object p2, p0, Lmr2;->w:Lro9;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p2

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setImportantForAutofill(I)V

    iget-object p2, p0, Lmr2;->u:Lcr2;

    if-nez p2, :cond_32

    move-object p2, v1

    :cond_32
    iget-object p2, p2, Lcr2;->k:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v2, Ll16;

    iget-object v3, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v2, v3}, Ll16;-><init>(Lcom/opera/android/autofill/AutofillManager;)V

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p2, p0, Lmr2;->u:Lcr2;

    if-nez p2, :cond_45

    move-object p2, v1

    :cond_45
    iget-object p2, p2, Lcr2;->k:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v2, Lmj2;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p2, p0, Lmr2;->u:Lcr2;

    if-nez p2, :cond_57

    move-object p2, v1

    :cond_57
    iget-object p2, p2, Lcr2;->m:Landroid/view/View;

    check-cast p2, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v2, Lnf;

    invoke-direct {v2, p1, p0, v0}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p2, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    iget-object p1, p1, Lz28;->f:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p1}, Lic4;->J(Lcom/google/android/material/internal/CheckableImageButton;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    if-eqz p1, :cond_70

    move-object p2, p1

    goto :goto_71

    :cond_70
    move-object p2, v1

    :goto_71
    iget-object p2, p2, Lcr2;->f:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v0, Lhcd;

    if-nez p1, :cond_7a

    move-object p1, v1

    :cond_7a
    iget-object p1, p1, Lcr2;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-direct {v0, p1}, Lhcd;-><init>(Lcom/opera/android/custom_views/OperaTextInputEditText;)V

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    if-nez p1, :cond_89

    move-object p1, v1

    :cond_89
    iget-object p1, p1, Lcr2;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance p2, Ljr2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ljr2;-><init>(Lmr2;B)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    if-nez p1, :cond_9b

    move-object p1, v1

    :cond_9b
    iget-object p1, p1, Lcr2;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance p2, Ler2;

    invoke-direct {p2, p0, v0}, Ler2;-><init>(Lmr2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    if-nez p1, :cond_ac

    move-object p1, v1

    :cond_ac
    iget-object p1, p1, Lcr2;->k:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance p2, Ler2;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ler2;-><init>(Lmr2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    if-nez p1, :cond_be

    move-object p1, v1

    :cond_be
    iget-object p1, p1, Lcr2;->j:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance p2, Ljr2;

    invoke-direct {p2, p0, v0}, Ljr2;-><init>(Lmr2;B)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    if-nez p1, :cond_cf

    move-object p1, v1

    :cond_cf
    iget-object p1, p1, Lcr2;->h:Ljava/lang/Object;

    check-cast p1, Lhi4;

    iget-object p1, p1, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0}, Lmr2;->I0()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lmr2;->x:Ljava/lang/String;

    new-instance p2, Lfr2;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Lfr2;-><init>(Lmr2;Landroid/content/Context;)V

    iput-object p2, p0, Lmr2;->y:Lfr2;

    iget-object v0, p0, Lmr2;->w:Lro9;

    if-nez v0, :cond_eb

    move-object v0, v1

    :cond_eb
    iget-object v0, v0, Lro9;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p2}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance p2, Lu7;

    const/16 v0, 0xc

    invoke-direct {p2, p0, v0}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lu7;->a(Landroid/view/View;)V

    iget-object p1, p0, Lmr2;->u:Lcr2;

    if-eqz p1, :cond_105

    move-object p2, p1

    goto :goto_106

    :cond_105
    move-object p2, v1

    :goto_106
    iget-object p2, p2, Lcr2;->n:Landroid/view/View;

    check-cast p2, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz p1, :cond_10d

    move-object v1, p1

    :cond_10d
    iget-object p1, v1, Lcr2;->n:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->i()Ljava/lang/CharSequence;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "*"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lmr2;->M0()V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 5

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Lmr2;->v:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f140ee9

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lmr2;->v:Lpq3;

    const/4 p2, 0x0

    if-nez p1, :cond_14

    move-object p1, p2

    :cond_14
    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Ldr2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ldr2;-><init>(Lmr2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lmr2;->v:Lpq3;

    if-nez p1, :cond_24

    move-object p1, p2

    :cond_24
    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const v0, 0x7f1403bf

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lmr2;->v:Lpq3;

    if-eqz p1, :cond_31

    move-object p2, p1

    :cond_31
    iget-object p1, p2, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ldr2;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ldr2;-><init>(Lmr2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 23

    move-object/from16 v0, p2

    const v1, 0x7f0d0079

    const/4 v2, 0x0

    move-object/from16 v3, p1

    invoke-virtual {v3, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v0, 0x7f0a0159

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_eb

    invoke-static {v2}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v5

    move-object v4, v1

    check-cast v4, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const v0, 0x7f0a02b5

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v6, :cond_eb

    const v0, 0x7f0a02b6

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_eb

    const v0, 0x7f0a02b7

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v7, :cond_eb

    const v0, 0x7f0a0407

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v8, :cond_eb

    const v0, 0x7f0a0408

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_eb

    const v0, 0x7f0a0409

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v10, :cond_eb

    const v0, 0x7f0a0435

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v11, :cond_eb

    const v0, 0x7f0a073c

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v12, :cond_eb

    const v0, 0x7f0a076a

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v13, :cond_eb

    const v0, 0x7f0a076b

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v14, :cond_eb

    const v0, 0x7f0a077f

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v15, :cond_eb

    const v0, 0x7f0a0780

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v16, :cond_eb

    const v0, 0x7f0a08d5

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_eb

    const v0, 0x7f0a0b04

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v17, :cond_eb

    const v0, 0x7f0a0b05

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v18, :cond_eb

    const v0, 0x7f0a0b06

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Landroid/widget/HorizontalScrollView;

    if-eqz v19, :cond_eb

    new-instance v3, Lcr2;

    invoke-direct/range {v3 .. v19}, Lcr2;-><init>(Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Lhi4;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/opera/android/custom_views/StylingTextView;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/HorizontalScrollView;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lmr2;->u:Lcr2;

    return-void

    :cond_eb
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final w0()Z
    .registers 1

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
