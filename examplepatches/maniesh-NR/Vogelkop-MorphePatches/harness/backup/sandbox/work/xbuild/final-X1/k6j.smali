.class public final Lk6j;
.super Li93;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lk6j;",
        "Li93;",
        "<init>",
        "()V",
        "j6j",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic x:[Lxtb;


# instance fields
.field public final t:Lktl;

.field public final u:Lzyk;

.field public final v:Ljp3;

.field public w:Landroid/view/MenuItem;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ld6h;

    const-class v1, Lk6j;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ld6h;

    const-string v3, "searchScrollListener"

    const-string v5, "getSearchScrollListener()Lcom/opera/android/settings/SettingsFragment$SearchScrollListener;"

    invoke-direct {v2, v1, v3, v5, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x2

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    const/4 v0, 0x1

    aput-object v2, v1, v0

    sput-object v1, Lk6j;->x:[Lxtb;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f140f45

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    new-instance v0, La3j;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, La3j;-><init>(B)V

    invoke-virtual {p0, v0}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object v0

    iput-object v0, p0, Lk6j;->t:Lktl;

    new-instance v0, Lyse;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lk6j;->u:Lzyk;

    new-instance v0, Ljp3;

    new-instance v1, Lj3i;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Ljp3;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object v0, p0, Lk6j;->v:Ljp3;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lpm9;
    .registers 3

    sget-object v0, Lk6j;->x:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lk6j;->t:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lpm9;

    return-object p0
.end method

.method public final I0()Ldaj;
    .registers 1

    iget-object p0, p0, Lk6j;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldaj;

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lk6j;->w:Landroid/view/MenuItem;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 10

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->d:Lcom/opera/android/widget/MenuSettingsListItem;

    const v0, 0x7f1401b7

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f140f47

    invoke-virtual {p0, v1, v0}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object p2, p2, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object p2, p2, Lor2;->f:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->c:Lcom/opera/android/custom_views/StylingTextView;

    new-instance v0, Lh6j;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lh6j;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Li6j;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Li6j;-><init>(Lk6j;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->t:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lh6j;

    const/16 v3, 0xb

    invoke-direct {v0, p0, v3}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->t:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Li6j;

    const/4 v3, 0x1

    invoke-direct {v0, p0, v3}, Li6j;-><init>(Lk6j;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lh6j;

    const/16 v4, 0xc

    invoke-direct {v0, p0, v4}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Li6j;

    const/4 v4, 0x2

    invoke-direct {v0, p0, v4}, Li6j;-><init>(Lk6j;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lh6j;

    const/16 v5, 0xd

    invoke-direct {v0, p0, v5}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Li6j;

    const/4 v5, 0x3

    invoke-direct {v0, p0, v5}, Li6j;-><init>(Lk6j;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->s:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lh6j;

    const/16 v6, 0xe

    invoke-direct {v0, p0, v6}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->s:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Li6j;

    invoke-direct {v0, p0, v1}, Li6j;-><init>(Lk6j;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lh6j;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Li6j;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Li6j;-><init>(Lk6j;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->h:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    const/16 v6, 0x11

    invoke-direct {v0, p0, v6}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->f:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    const/16 v6, 0x12

    invoke-direct {v0, p0, v6}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->r:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    const/16 v6, 0x13

    invoke-direct {v0, p0, v6}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->o:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    invoke-direct {v0, p0, v2}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->p:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    invoke-direct {v0, p0, v3}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->q:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    invoke-direct {v0, p0, v4}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->n:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    invoke-direct {v0, p0, v5}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->l:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    invoke-direct {v0, p0, v1}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->j:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->k:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->d:Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v0, Lh6j;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lh6j;-><init>(Lk6j;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->b:Lcom/opera/android/custom_views/MakeOperaDefaultBanner;

    new-instance v0, Lh6j;

    const/16 v2, 0x9

    invoke-direct {v0, p0, v2}, Lh6j;-><init>(Lk6j;B)V

    iget-object p2, p2, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->g:Lei;

    iget-object p2, p2, Lei;->c:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object p2

    iget-object p2, p2, Lpm9;->b:Lcom/opera/android/custom_views/MakeOperaDefaultBanner;

    new-instance v0, Lh6j;

    const/16 v2, 0xa

    invoke-direct {v0, p0, v2}, Lh6j;-><init>(Lk6j;B)V

    iget-object p2, p2, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->g:Lei;

    iget-object p2, p2, Lei;->d:Landroid/view/View;

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f0a0269

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/FadingNestedScrollView;

    if-eqz p1, :cond_1cf

    sget-object p2, Lk6j;->x:[Lxtb;

    aget-object p2, p2, v3

    iget-object v0, p0, Lk6j;->v:Ljp3;

    invoke-virtual {v0, p0, p2}, Ljp3;->a(Landroidx/fragment/app/Fragment;Lxtb;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lj6j;

    iput-object p2, p1, Lcom/opera/android/custom_views/FadingNestedScrollView;->F:Lj6j;

    :cond_1cf
    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p1

    iget-object p1, p1, Ldaj;->s:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lk6j;->H0()Lpm9;

    move-result-object v0

    iget-object v0, v0, Lpm9;->a:Landroid/widget/LinearLayout;

    new-instance v2, Lqzg;

    invoke-direct {v2, p0, v1}, Lqzg;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 3

    const v0, 0x7f0a0932

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lk6j;->w:Landroid/view/MenuItem;

    return-void
.end method
