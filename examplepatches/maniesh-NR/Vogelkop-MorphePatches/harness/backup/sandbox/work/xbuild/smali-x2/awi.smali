.class public final Lawi;
.super Le93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final y:Landroid/util/SparseArray;


# instance fields
.field public final r:Lvzk;

.field public final s:Lysj;

.field public final t:Lua7;

.field public u:Lei;

.field public v:Llh4;

.field public w:Ljava/lang/String;

.field public x:Z


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    invoke-static {}, Ll7j;->values()[Ll7j;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_b
    if-ge v3, v2, :cond_3c

    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_33

    const/4 v6, 0x1

    if-eq v5, v6, :cond_2c

    const/4 v6, 0x2

    if-eq v5, v6, :cond_25

    const/4 v6, 0x3

    if-ne v5, v6, :cond_39

    const v5, 0x7f0a02f7

    invoke-virtual {v0, v5, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_39

    :cond_25
    const v5, 0x7f0a02fb

    invoke-virtual {v0, v5, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_39

    :cond_2c
    const v5, 0x7f0a02f6

    invoke-virtual {v0, v5, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_39

    :cond_33
    const v5, 0x7f0a02fa

    invoke-virtual {v0, v5, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_39
    :goto_39
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_3c
    sput-object v0, Lawi;->y:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>(Lgjm;Lydn;Lwc7;Lysj;)V
    .registers 8

    const/4 v0, 0x4

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140f12

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lvzk;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ldzg;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Ldzg;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lvzk;->c:Ljava/lang/Object;

    new-instance v1, Lode;

    invoke-direct {v1}, Lekc;-><init>()V

    iput-object v1, v0, Lvzk;->d:Ljava/lang/Object;

    iput-object p2, v0, Lvzk;->a:Ljava/lang/Object;

    iput-object p3, v0, Lvzk;->b:Ljava/lang/Object;

    invoke-virtual {v0}, Lvzk;->h0()V

    iput-object v0, p0, Lawi;->r:Lvzk;

    iput-object p4, p0, Lawi;->s:Lysj;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lawi;->t:Lua7;

    return-void
.end method


# virtual methods
.method public final G0()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public final H0(ILandroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 14

    const p1, 0x7f0d0378

    const/4 v0, 0x0

    invoke-virtual {p2, p1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a02f6

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz p3, :cond_98

    const p2, 0x7f0a02f7

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v2, :cond_98

    const p2, 0x7f0a02f8

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v3, p3

    check-cast v3, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v3, :cond_98

    const p2, 0x7f0a02f9

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v4, p3

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v4, :cond_98

    const p2, 0x7f0a02fa

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz p3, :cond_98

    const p2, 0x7f0a02fb

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz p3, :cond_98

    const p2, 0x7f0a02fc

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v5, p3

    check-cast v5, Lcom/opera/android/custom_views/OperaRadioGroup;

    if-eqz v5, :cond_98

    const p2, 0x7f0a02fd

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz p3, :cond_98

    const p2, 0x7f0a0590

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v6, p3

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_98

    const p2, 0x7f0a0591

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v7, p3

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v7, :cond_98

    const p2, 0x7f0a0c6c

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v8, p3

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_98

    new-instance v0, Lei;

    move-object v1, p1

    check-cast v1, Landroid/widget/LinearLayout;

    const/16 v9, 0xa

    invoke-direct/range {v0 .. v9}, Lei;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v0, p0, Lawi;->u:Lei;

    return-void

    :cond_98
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

.method public final I0(Ljava/lang/CharSequence;)V
    .registers 8

    iget-object v0, p0, Lawi;->u:Lei;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lawi;->w:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d

    :cond_c
    return-void

    :cond_d
    invoke-static {p1}, Laik;->c(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lawi;->w:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v1, p0, Lawi;->r:Lvzk;

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lawi;->K0()V

    goto :goto_82

    :cond_1f
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, v1, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Lwc7;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, LJ/N;->MLC1dld3(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_58

    invoke-virtual {p0}, Lawi;->K0()V

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lawi;->v:Llh4;

    if-eqz v4, :cond_3f

    iput-object v3, v4, Llh4;->b:Lcom/opera/api/Callback;

    :cond_3f
    new-instance v3, Llh4;

    new-instance v4, Leof;

    const/16 v5, 0x10

    invoke-direct {v4, p0, v0, v5}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v3, v4, v2}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    iput-object v3, p0, Lawi;->v:Llh4;

    iget-object v2, v1, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Lwc7;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v3}, LJ/N;->MkRRLkEl(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_82

    :cond_58
    const v0, 0x7f14069c

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lawi;->u:Lei;

    iget-object v4, v4, Lei;->e:Landroid/view/View;

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v4, v4, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    invoke-virtual {v4, v2}, Lz28;->h(I)V

    iget-object v2, p0, Lawi;->u:Lei;

    iget-object v2, v2, Lei;->e:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v2, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    iget-object v4, v2, Lz28;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v2, Lz28;->f:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Lawi;->u:Lei;

    iget-object v2, v2, Lei;->e:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v2, v0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :goto_82
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, v1, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Lwc7;

    iget-object v0, v0, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "dns_over_https_custom_server_template"

    invoke-virtual {v0, v1, p1}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lawi;->J0()V

    return-void
.end method

.method public final J0()V
    .registers 3

    iget-object v0, p0, Lawi;->u:Lei;

    iget-object v1, v0, Lei;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/OperaRadioGroup;

    iget v1, v1, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    iget-object v0, v0, Lei;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    if-ne v1, v0, :cond_20

    iget-object v0, p0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v0, v0, Ll6b;->q:Z

    if-eqz v0, :cond_20

    const/4 v0, 0x1

    goto :goto_21

    :cond_20
    const/4 v0, 0x0

    :goto_21
    iput-boolean v0, p0, Lawi;->x:Z

    return-void
.end method

.method public final K0()V
    .registers 4

    iget-object v0, p0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    iget-object v0, p0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    invoke-virtual {v0, v1}, Lz28;->h(I)V

    iget-object v0, p0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    iget-object v1, v0, Lz28;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lz28;->f:Lcom/google/android/material/internal/CheckableImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const-string v1, "https://opera.cloudflare-dns.com/dns-query"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f14069d

    invoke-virtual {p0, v2, v1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/android/material/textfield/TextInputLayout;->r(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final L0(Lbwi;)V
    .registers 5

    if-nez p1, :cond_3

    return-void

    :cond_3
    iget-boolean v0, p1, Lbwi;->b:Z

    if-eqz v0, :cond_f

    const v0, 0x7f1413ee

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    :cond_f
    const v0, 0x7f141408

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_16
    iget-object v1, p0, Lawi;->u:Lei;

    iget-object v1, v1, Lei;->h:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    const v2, 0x7f140f15

    filled-new-array {v0, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lawi;->u:Lei;

    iget-object p0, p0, Lei;->h:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    iget-boolean p1, p1, Lbwi;->a:Z

    if-eqz p1, :cond_37

    sget-object p1, Lxkf;->f:Lxkf;

    goto :goto_39

    :cond_37
    sget-object p1, Lxkf;->e:Lxkf;

    :goto_39
    sget-object v0, Lxkf;->b:Lj06;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget p1, p1, Lxkf;->a:I

    sget-object v2, Lxkf;->c:[I

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0, p1}, Lj06;->h(Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;Landroid/content/res/TypedArray;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-boolean v0, p0, Lawi;->x:Z

    if-eqz v0, :cond_17

    new-instance v0, Lw0a;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lw0a;-><init>(B)V

    iget-object p0, p0, Lawi;->s:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_17
    return-void
.end method

.method public final onDestroyView()V
    .registers 4

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Lawi;->v:Llh4;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    iput-object v1, v0, Llh4;->b:Lcom/opera/api/Callback;

    :cond_a
    iget-object v0, p0, Lawi;->r:Lvzk;

    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Lwc7;

    iget-object v0, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Ldzg;

    iget-object v2, v2, Lwc7;->c:Lh7f;

    invoke-virtual {v2, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iput-object v1, p0, Lawi;->u:Lei;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object p1

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaRadioGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    invoke-virtual {p1, v0}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    new-instance p1, Lowj;

    new-instance v1, Ljng;

    iget-object v2, p0, Lawi;->u:Lei;

    iget-object v2, v2, Lei;->g:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v3}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v0, "<terms>"

    const-string v2, "</terms>"

    invoke-direct {p1, v0, v2, v1}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    new-instance v0, Lowj;

    new-instance v1, Ljng;

    iget-object v2, p0, Lawi;->u:Lei;

    iget-object v2, v2, Lei;->g:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p2, v2, v3}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v2, "<privacy>"

    const-string v3, "</privacy>"

    invoke-direct {v0, v2, v3, v1}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    const v1, 0x7f14127c

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {p1, v0}, [Lowj;

    move-result-object p1

    invoke-static {v1, p1}, Ln1h;->d(Ljava/lang/String;[Lowj;)Landroid/text/SpannableString;

    move-result-object p1

    iget-object v0, p0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {v0, p1}, Lphj;->u0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object v0, p1, Lei;->i:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lyvi;

    invoke-direct {v1, p0}, Lyvi;-><init>(Lawi;)V

    iput-object v1, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object v0, p1, Lei;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaRadioGroup;

    new-instance v1, Lyvi;

    invoke-direct {v1, p0}, Lyvi;-><init>(Lawi;)V

    iput-object v1, v0, Lcom/opera/android/custom_views/OperaRadioGroup;->c:Lyvi;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v0, Lzp2;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lzp2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v0, Lys7;

    invoke-direct {v0, p0, p2}, Lys7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance p2, Lzvi;

    invoke-direct {p2, p0}, Lzvi;-><init>(Lawi;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p1, p0, Lawi;->r:Lvzk;

    iget-object p2, p1, Lvzk;->d:Ljava/lang/Object;

    check-cast p2, Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    new-instance v1, Lqzg;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0, v1}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p2, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p2, Lwc7;

    iget-object p1, p1, Lvzk;->c:Ljava/lang/Object;

    check-cast p1, Ldzg;

    iget-object p2, p2, Lwc7;->c:Lh7f;

    invoke-virtual {p2, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance p2, Lkkf;

    const/16 v0, 0xf

    invoke-direct {p2, p0, v0}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_e3

    return-void

    :cond_e3
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lawi;->t:Lua7;

    return-object p0
.end method
