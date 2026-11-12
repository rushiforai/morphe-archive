.class public final Lfw9;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic w:[Lxtb;


# instance fields
.field public final t:Lua7;

.field public final u:Lktl;

.field public final v:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lfw9;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentGestureShortcutSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lfw9;->w:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 5

    const v0, 0x7f140fe5

    const/4 v1, 0x0

    const/16 v2, 0xe

    invoke-direct {p0, v0, v1, v2}, Li93;-><init>(III)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lfw9;->t:Lua7;

    new-instance p1, Ls49;

    invoke-direct {p1, v2}, Ls49;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lfw9;->u:Lktl;

    new-instance p1, Lt2;

    const/16 v0, 0x15

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lfw9;->v:Lzyk;

    return-void
.end method

.method public static J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lf03;)V
    .registers 3

    sget-object v0, Lkw9;->l:Lkw9;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_e
    instance-of v0, p1, Llw9;

    if-eqz v0, :cond_1e

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    check-cast p1, Llw9;

    iget-boolean p1, p1, Llw9;->l:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    return-void

    :cond_1e
    invoke-static {}, Lh9o;->p()V

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lfw9;->I0()Liw9;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lpl9;
    .registers 3

    sget-object v0, Lfw9;->w:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lfw9;->u:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lpl9;

    return-object p0
.end method

.method public final I0()Liw9;
    .registers 1

    iget-object p0, p0, Lfw9;->v:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Liw9;

    return-object p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object p1

    iget-object p1, p1, Lpl9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lew9;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lew9;-><init>(Lfw9;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object p1

    iget-object p1, p1, Lpl9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lew9;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lew9;-><init>(Lfw9;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object p1

    iget-object p1, p1, Lpl9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lew9;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lew9;-><init>(Lfw9;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object p1

    iget-object p1, p1, Lpl9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lyk4;

    const/16 v0, 0x1c

    invoke-direct {p2, p0, v0}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lfw9;->I0()Liw9;

    move-result-object p1

    iget-object p1, p1, Liw9;->h:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object v0

    iget-object v0, v0, Lpl9;->a:Landroid/widget/LinearLayout;

    new-instance v1, Lcl4;

    const/16 v2, 0x18

    invoke-direct {v1, p0, v2}, Lcl4;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lfw9;->t:Lua7;

    return-object p0
.end method
