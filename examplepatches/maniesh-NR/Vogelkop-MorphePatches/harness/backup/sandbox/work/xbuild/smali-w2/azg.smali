.class public final Lazg;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic w:[Lxtb;


# instance fields
.field public final t:Lua7;

.field public final u:Lzyk;

.field public final v:Lktl;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lazg;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentPrivacyAndSecuritySettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lazg;->w:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 5

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f141081

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lazg;->t:Lua7;

    new-instance p1, Lyse;

    const/16 v0, 0x8

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lazg;->u:Lzyk;

    new-instance p1, Lodf;

    const/16 v0, 0x1b

    invoke-direct {p1, v0}, Lodf;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lazg;->v:Lktl;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Llm9;
    .registers 3

    sget-object v0, Lazg;->w:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lazg;->v:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Llm9;

    return-object p0
.end method

.method public final I0()Lhzg;
    .registers 1

    iget-object p0, p0, Lazg;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhzg;

    return-object p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    const p2, 0x7f1401b7

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    const v0, 0x7f14107f

    invoke-virtual {p0, v0, p2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a(Ljava/lang/String;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lzyg;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lzyg;-><init>(Lazg;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    const/16 v1, 0x8

    invoke-direct {p2, p0, v1}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lzyg;

    const/4 v1, 0x4

    invoke-direct {p2, p0, v1}, Lzyg;-><init>(Lazg;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    const/4 v2, 0x0

    invoke-direct {p2, p0, v2}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lzyg;

    invoke-direct {p2, p0, v2}, Lzyg;-><init>(Lazg;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    const/4 v2, 0x1

    invoke-direct {p2, p0, v2}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    const/4 v3, 0x2

    invoke-direct {p2, p0, v3}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    invoke-direct {p2, p0, v0}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    invoke-direct {p2, p0, v1}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lzyg;

    invoke-direct {p2, p0, v2}, Lzyg;-><init>(Lazg;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lzyg;

    invoke-direct {p2, p0, v3}, Lzyg;-><init>(Lazg;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object p1

    iget-object p1, p1, Llm9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyyg;

    const/4 v0, 0x7

    invoke-direct {p2, p0, v0}, Lyyg;-><init>(Lazg;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p1

    iget-object p1, p1, Lhzg;->n:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lazg;->H0()Llm9;

    move-result-object v0

    iget-object v0, v0, Llm9;->a:Landroid/widget/LinearLayout;

    new-instance v1, Ld8d;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, v2}, Ld8d;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lazg;->t:Lua7;

    return-object p0
.end method
