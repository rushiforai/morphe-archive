.class public final Lf6g;
.super Lh53;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic z:[Lxtb;


# instance fields
.field public final t:Lz77;

.field public final u:Lorm;

.field public final v:Lua7;

.field public final w:Lktl;

.field public final x:Lzyk;

.field public final y:Lbjf;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lf6g;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentPasswordsSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lf6g;->z:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;Lz77;Lysj;Lorm;)V
    .registers 14

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f1410cd

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    iput-object p2, p0, Lf6g;->t:Lz77;

    iput-object p4, p0, Lf6g;->u:Lorm;

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lf6g;->v:Lua7;

    new-instance p1, Lodf;

    const/16 v0, 0xd

    invoke-direct {p1, v0}, Lodf;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lf6g;->w:Lktl;

    new-instance p1, Lyse;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lf6g;->x:Lzyk;

    new-instance v0, Lbjf;

    new-instance v1, Le6g;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v2, 0x0

    const-class v4, Lf6g;

    const-string v5, "createDocumentURI"

    const-string v6, "createDocumentURI()V"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    const/4 v5, 0x1

    move-object v2, p2

    move-object v3, p4

    move-object v4, v1

    move-object v1, p3

    invoke-direct/range {v0 .. v5}, Lbjf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lf6g;->y:Lbjf;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    return-object p0
.end method

.method public final H0()V
    .registers 5

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "text/comma-separated-values"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TITLE"

    const-string v2, "passwords.csv"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v1

    new-instance v2, Lqj2;

    const/16 v3, 0xa

    invoke-direct {v2, p0, v3}, Lqj2;-><init>(Ljava/lang/Object;B)V

    check-cast v1, Lhjf;

    invoke-virtual {v1, v0, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    return-void
.end method

.method public final I0()Lim9;
    .registers 3

    sget-object v0, Lf6g;->z:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lf6g;->w:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lim9;

    return-object p0
.end method

.method public final J0()Lm6g;
    .registers 1

    iget-object p0, p0, Lf6g;->x:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm6g;

    return-object p0
.end method

.method public final onResume()V
    .registers 2

    invoke-super {p0}, Lltl;->onResume()V

    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p0

    iget-boolean v0, p0, Lm6g;->n:Z

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    iput-boolean v0, p0, Lm6g;->n:Z

    invoke-virtual {p0}, Lm6g;->g()V

    :cond_11
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lc6g;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lc6g;-><init>(Lf6g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ld6g;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ld6g;-><init>(Lf6g;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ld6g;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Ld6g;-><init>(Lf6g;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lc6g;

    const/4 v2, 0x4

    invoke-direct {p2, p0, v2}, Lc6g;-><init>(Lf6g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lc6g;

    const/4 v2, 0x5

    invoke-direct {p2, p0, v2}, Lc6g;-><init>(Lf6g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lc6g;

    const/4 v2, 0x6

    invoke-direct {p2, p0, v2}, Lc6g;-><init>(Lf6g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lc6g;

    const/4 v3, 0x7

    invoke-direct {p2, p0, v3}, Lc6g;-><init>(Lf6g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lc6g;

    invoke-direct {p2, p0, v0}, Lc6g;-><init>(Lf6g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lc6g;

    invoke-direct {p2, p0, v1}, Lc6g;-><init>(Lf6g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lc6g;

    const/4 v3, 0x2

    invoke-direct {p2, p0, v3}, Lc6g;-><init>(Lf6g;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p1

    iget-object p1, p1, Lm6g;->f:Lk6g;

    iget-object p1, p1, Lk6g;->i:Lv9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object v3

    iget-object v3, v3, Lim9;->a:Landroid/widget/LinearLayout;

    new-instance v4, Liwa;

    const/16 v5, 0xf

    invoke-direct {v4, p0, v5}, Liwa;-><init>(Ljava/lang/Object;B)V

    const/4 v5, 0x0

    invoke-static {p1, p2, v3, v5, v4}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    invoke-virtual {p0}, Lf6g;->J0()Lm6g;

    move-result-object p1

    iget-object p1, p1, Lm6g;->l:Lru9;

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p2, "no_lock_screen_password_manager_dialog"

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_e0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_e0

    new-instance p1, Lwen;

    new-instance p2, Lb6g;

    invoke-direct {p2, p0, v0}, Lb6g;-><init>(Lf6g;B)V

    invoke-direct {p1, p2, v2}, Lwen;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lf6g;->t:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, p2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_e0
    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lf6g;->v:Lua7;

    return-object p0
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    invoke-virtual {p0}, Lf6g;->I0()Lim9;

    move-result-object p1

    iget-object p1, p1, Lim9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const p2, 0x7f1401b7

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    new-instance p2, Lsxh;

    const v0, 0x7f14105b

    invoke-direct {p2, v0, p0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    return-void
.end method
