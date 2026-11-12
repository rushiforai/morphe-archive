.class public final Lv7k;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic A:[Lxtb;


# instance fields
.field public final t:Lua7;

.field public final u:Lktl;

.field public final v:Lzyk;

.field public final w:Lzyk;

.field public x:Ljava/util/List;

.field public final y:Ljp3;

.field public final z:Ljp3;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Ld6h;

    const-class v1, Lv7k;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentStartPageSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ld6h;

    const-string v3, "wallpaperAdapterHelper"

    const-string v5, "getWallpaperAdapterHelper()Lcom/opera/android/wallpaper/WallpaperHorizontalPreviewAdapterHelper;"

    invoke-direct {v2, v1, v3, v5, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v3, Ld6h;

    const-string v5, "wallpaperDelegate"

    const-string v6, "getWallpaperDelegate()Lcom/opera/android/wallpaper/adapter/WallpaperAdapter$Delegate;"

    invoke-direct {v3, v1, v5, v6, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x3

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    const/4 v0, 0x1

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v3, v1, v0

    sput-object v1, Lv7k;->A:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 5

    const/16 v0, 0xe

    const v1, 0x7f1410aa

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2, v0}, Li93;-><init>(III)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lv7k;->t:Lua7;

    new-instance p1, La3j;

    const/16 v0, 0xc

    invoke-direct {p1, v0}, La3j;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lv7k;->u:Lktl;

    new-instance p1, Lyse;

    const/16 v0, 0x10

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lv7k;->v:Lzyk;

    new-instance p1, Ln7k;

    invoke-direct {p1, p0, v2}, Ln7k;-><init>(Lv7k;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lv7k;->w:Lzyk;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lv7k;->x:Ljava/util/List;

    new-instance p1, Ljp3;

    new-instance v0, Ln7k;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ln7k;-><init>(Lv7k;B)V

    invoke-direct {p1, v0}, Ljp3;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lv7k;->y:Ljp3;

    new-instance p1, Ljp3;

    new-instance v0, Ln7k;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ln7k;-><init>(Lv7k;B)V

    invoke-direct {p1, v0}, Ljp3;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lv7k;->z:Ljp3;

    return-void
.end method

.method public static J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V
    .registers 3

    iget-boolean v0, p1, Lyt8;->a:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    goto :goto_8

    :cond_6
    const/16 v0, 0x8

    :goto_8
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p1, p1, Lyt8;->b:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lsm9;
    .registers 3

    sget-object v0, Lv7k;->A:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lv7k;->u:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lsm9;

    return-object p0
.end method

.method public final I0()Lc8k;
    .registers 1

    iget-object p0, p0, Lv7k;->v:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc8k;

    return-object p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lo7k;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lo7k;-><init>(Lv7k;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ls7k;

    invoke-direct {p2, p0, v0}, Ls7k;-><init>(Lv7k;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lt7k;

    invoke-direct {p2, p0, v0}, Lt7k;-><init>(Lv7k;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lo7k;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Lo7k;-><init>(Lv7k;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lo7k;

    const/4 v2, 0x2

    invoke-direct {p2, p0, v2}, Lo7k;-><init>(Lv7k;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lqie;

    const/16 v2, 0x19

    invoke-direct {p2, p0, v2}, Lqie;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lu7k;

    invoke-direct {p2, p0}, Lu7k;-><init>(Ljava/lang/Object;)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lz4k;

    invoke-direct {p2, p0, v1}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lq7k;

    invoke-direct {p2, p0, v1}, Lq7k;-><init>(Lv7k;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lr7k;

    invoke-direct {p2, p0, v1}, Lr7k;-><init>(Lv7k;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Ls7k;

    invoke-direct {p2, p0, v1}, Ls7k;-><init>(Lv7k;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lt7k;

    invoke-direct {p2, p0, v1}, Lt7k;-><init>(Lv7k;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lq7k;

    invoke-direct {p2, p0, v0}, Lq7k;-><init>(Lv7k;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lr7k;

    invoke-direct {p2, p0, v0}, Lr7k;-><init>(Lv7k;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p0, Lv7k;->x:Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_e3

    sget-object p1, Lv7k;->A:[Lxtb;

    aget-object p1, p1, v1

    iget-object p2, p0, Lv7k;->y:Ljp3;

    invoke-virtual {p2, p0, p1}, Ljp3;->a(Landroidx/fragment/app/Fragment;Lxtb;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lvkn;

    iget-object p2, p0, Lv7k;->x:Ljava/util/List;

    iget-object v1, p1, Lvkn;->a:Lujn;

    invoke-virtual {v1, p2}, Lujn;->T(Ljava/util/List;)V

    iget-object p1, p1, Lvkn;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_e3
    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p1

    iget-object p1, p1, Lc8k;->d:Lb8k;

    iget-object p1, p1, Lb8k;->n:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->a:Landroid/widget/LinearLayout;

    new-instance v1, Lw4i;

    const/16 v2, 0xa

    invoke-direct {v1, p0, v2}, Lw4i;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lv7k;->t:Lua7;

    return-object p0
.end method
