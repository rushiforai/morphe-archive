.class public final Lkc2;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic x:[Lxtb;


# instance fields
.field public final t:Lg0c;

.field public final u:Lua7;

.field public final v:Lktl;

.field public final w:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lkc2;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentAssistantSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lkc2;->x:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;Lg0c;)V
    .registers 6

    const v0, 0x7f100007

    const/16 v1, 0xc

    const v2, 0x7f140110

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    iput-object p2, p0, Lkc2;->t:Lg0c;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lkc2;->u:Lua7;

    new-instance p1, Lt40;

    const/16 p2, 0x16

    invoke-direct {p1, p2}, Lt40;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lkc2;->v:Lktl;

    new-instance p1, Lt2;

    const/16 p2, 0xa

    invoke-direct {p1, p0, p2}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lkc2;->w:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Ldl9;
    .registers 3

    sget-object v0, Lkc2;->x:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lkc2;->v:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Ldl9;

    return-object p0
.end method

.method public final I0()Lqc2;
    .registers 1

    iget-object p0, p0, Lkc2;->w:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqc2;

    return-object p0
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    invoke-super {p0, p1}, Li93;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lkc2;->I0()Lqc2;

    move-result-object p2

    new-instance v0, Lwth;

    const/16 v1, 0xc

    invoke-direct {v0, p2, v1}, Lwth;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ljc2;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lkc2;->I0()Lqc2;

    move-result-object p2

    new-instance v0, Lpjn;

    const/16 v2, 0xd

    invoke-direct {v0, p2, v2}, Lpjn;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ljc2;

    const/4 v0, 0x4

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ljc2;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ljc2;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ljc2;

    const/4 v0, 0x7

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->q:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ljc2;

    const/16 v0, 0x8

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->r:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ljc2;

    const/16 v0, 0x9

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->k:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ljc2;

    const/16 v0, 0xa

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->l:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ljc2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->o:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ljc2;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object p1

    iget-object p1, p1, Ldl9;->n:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Ljc2;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Ljc2;-><init>(Lkc2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lkc2;->I0()Lqc2;

    move-result-object p1

    iget-object p1, p1, Lqc2;->d:Ligi;

    iget-object p1, p1, Ligi;->d:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lkc2;->H0()Ldl9;

    move-result-object v0

    iget-object v0, v0, Ldl9;->a:Landroid/widget/LinearLayout;

    new-instance v2, Lpb;

    invoke-direct {v2, p0, v1}, Lpb;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lkc2;->u:Lua7;

    return-object p0
.end method

.method public final x0(Litd;)V
    .registers 2

    const p0, 0x7f0a0053

    invoke-virtual {p1, p0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method
