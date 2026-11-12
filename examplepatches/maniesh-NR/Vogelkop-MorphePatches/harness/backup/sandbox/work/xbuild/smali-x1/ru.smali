.class public final Lru;
.super Lh53;
.source "SourceFile"


# static fields
.field public static final synthetic D:[Lxtb;


# instance fields
.field public A:I

.field public B:I

.field public C:Z

.field public final t:Lorm;

.field public final u:Lulp;

.field public final v:Lua7;

.field public final w:Lktl;

.field public final x:Lzyk;

.field public final y:Ljp3;

.field public z:Lpu;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ld6h;

    const-class v1, Lru;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentPasswordAddBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ld6h;

    const-string v3, "adapter"

    const-string v5, "getAdapter()Lcom/opera/android/autofill/passwords/add/InstalledAppsAdapter;"

    invoke-direct {v2, v1, v3, v5, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x2

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    const/4 v0, 0x1

    aput-object v2, v1, v0

    sput-object v1, Lru;->D:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;Lorm;)V
    .registers 5

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140f73

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Li93;-><init>(Litl;Z)V

    iput-object p2, p0, Lru;->t:Lorm;

    sget-object p2, Lulp;->b:Lulp;

    iput-object p2, p0, Lru;->u:Lulp;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lru;->v:Lua7;

    new-instance p1, Lmc8;

    const/16 p2, 0x1b

    invoke-direct {p1, p2}, Lmc8;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lru;->w:Lktl;

    new-instance p1, Lt2;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lru;->x:Lzyk;

    new-instance p1, Ljp3;

    new-instance p2, Lpa;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2}, Ljp3;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lru;->y:Ljp3;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lru;->u:Lulp;

    return-object p0
.end method

.method public final H0()Ltab;
    .registers 3

    sget-object v0, Lru;->D:[Lxtb;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget-object v1, p0, Lru;->y:Ljp3;

    invoke-virtual {v1, p0, v0}, Ljp3;->a(Landroidx/fragment/app/Fragment;Lxtb;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltab;

    return-object p0
.end method

.method public final I0()Lhm9;
    .registers 3

    sget-object v0, Lru;->D:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lru;->w:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lhm9;

    return-object p0
.end method

.method public final J0()Lxu;
    .registers 1

    iget-object p0, p0, Lru;->x:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxu;

    return-object p0
.end method

.method public final K0(Lvb0;)V
    .registers 8

    iget-object p0, p0, Lru;->t:Lorm;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Ly50;

    const/16 v3, 0x98b

    const/4 v4, -0x1

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    invoke-virtual {p1, v0}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p1

    const/16 v0, 0x2e

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_3a

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3a

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v0, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_43

    :cond_3a
    invoke-static {p1, v0, v5}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v0, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_43
    invoke-virtual {v4, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final L0()V
    .registers 2

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object v0

    iget-object v0, v0, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p0

    iget-object p0, p0, Lhm9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    const v0, 0x7f0805d4

    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    return-void

    :cond_1f
    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p0

    iget-object p0, p0, Lhm9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    const v0, 0x7f080538

    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    return-void
.end method

.method public final M0(Z)V
    .registers 5

    if-eqz p1, :cond_39

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->g:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object v0

    iget-object v0, v0, Lxu;->e:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwu;

    const/4 v1, 0x0

    if-eqz v0, :cond_35

    iget-object v0, v0, Lwu;->a:Lzt1;

    if-eqz v0, :cond_35

    invoke-interface {v0}, Lzt1;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_35

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_28

    move-object v0, v1

    :cond_28
    if-eqz v0, :cond_35

    const v1, 0x7f140638

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :cond_35
    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_4f

    :cond_39
    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->g:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean p1, p1, Ll6b;->q:Z

    if-eqz p1, :cond_4f

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->g:Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    :cond_4f
    :goto_4f
    invoke-virtual {p0}, Lru;->N0()V

    return-void
.end method

.method public final N0()V
    .registers 3

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object v0

    iget-object v0, v0, Lhm9;->h:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object v1

    iget-object v1, v1, Lxu;->e:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwu;

    if-eqz v1, :cond_17

    iget-object v1, v1, Lwu;->a:Lzt1;

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    :goto_18
    if-eqz v1, :cond_2e

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p0

    iget-object p0, p0, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    if-eqz p0, :cond_2e

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-eqz p0, :cond_2e

    const/4 p0, 0x1

    goto :goto_2f

    :cond_2e
    const/4 p0, 0x0

    :goto_2f
    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final l0(Z)V
    .registers 2

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    sget-object p1, Lvb0;->d:Lvb0;

    invoke-virtual {p0, p1}, Lru;->K0(Lvb0;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1}, Lh53;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 v0, 0x41c00000    # 24.0f

    invoke-static {v0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lru;->A:I

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 v0, 0x42200000    # 40.0f

    invoke-static {v0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lru;->B:I

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object p1

    iget-object p1, p1, Lxu;->d:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object v0

    iget-object v0, v0, Lhm9;->a:Landroid/widget/ScrollView;

    new-instance v1, Lk9;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lk9;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x0

    invoke-static {p1, p2, v0, v2, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object p1

    iget-object p1, p1, Lxu;->e:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object v0

    iget-object v0, v0, Lhm9;->a:Landroid/widget/ScrollView;

    new-instance v1, Lpb;

    const/4 v3, 0x7

    invoke-direct {v1, p0, v3}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2, v0, v2, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 8

    invoke-super {p0, p1, p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->c:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->i()Ljava/lang/CharSequence;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, "*"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->b:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    invoke-virtual {p0}, Lru;->H0()Ltab;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v0, Lgf;

    const/16 v1, 0x8

    invoke-direct {v0, p1, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lnu;

    invoke-direct {v0, p2}, Lnu;-><init>(B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    new-instance v0, Lou;

    invoke-direct {v0, p0, p2}, Lou;-><init>(Landroidx/fragment/app/i;B)V

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    new-instance v0, Lpu;

    invoke-direct {v0, p0, p1, p2}, Lpu;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iput-object v0, p0, Lru;->z:Lpu;

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->b:Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    new-instance v0, Lmu;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lmu;-><init>(Lru;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_6b

    invoke-static {v2, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_6b
    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->i:Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v0, Lqu;

    invoke-direct {v0, p0, v1}, Lqu;-><init>(Lru;B)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingStart()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingEnd()I

    move-result v3

    iget v4, p0, Lru;->B:I

    add-int/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v0, Lqu;

    invoke-direct {v0, p0, p2}, Lqu;-><init>(Lru;B)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->g:Lcom/google/android/material/textfield/TextInputLayout;

    const v0, 0x7f0a0b70

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/internal/CheckableImageButton;

    if-eqz p1, :cond_d0

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_ca

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v0}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v2

    iget v3, p0, Lru;->B:I

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_d0

    :cond_ca
    const-string p0, "null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_d0
    :goto_d0
    invoke-virtual {p0, p2}, Lru;->M0(Z)V

    iget-object p1, p0, Lru;->v:Lua7;

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object p1

    check-cast p1, Lku;

    iget-boolean p1, p1, Lku;->b:Z

    if-eqz p1, :cond_f3

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lfsp;->v()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_f3
    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Llu;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v2}, Llu;-><init>(Lru;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lmu;

    invoke-direct {v0, p0, p2}, Lmu;-><init>(Lru;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_116

    invoke-static {v2, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_116
    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->h:Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Llu;

    invoke-direct {v0, p0, v1}, Llu;-><init>(Lru;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lru;->N0()V

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Llu;

    invoke-direct {v0, p0, p2}, Llu;-><init>(Lru;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
