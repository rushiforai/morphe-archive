.class public final Lzk4;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic y:[Lxtb;


# instance fields
.field public final t:Lwh2;

.field public final u:Lua7;

.field public final v:Lktl;

.field public final w:Lzyk;

.field public x:Lyw;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lzk4;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentCardsSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lzk4;->y:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;Lwh2;)V
    .registers 6

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f140273

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    iput-object p2, p0, Lzk4;->t:Lwh2;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lzk4;->u:Lua7;

    new-instance p1, Lt14;

    const/16 p2, 0x11

    invoke-direct {p1, p2}, Lt14;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Lzk4;->v:Lktl;

    new-instance p1, Lt2;

    invoke-direct {p1, p0, p2}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lzk4;->w:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Lzk4;->I0()Ldl4;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lgl9;
    .registers 3

    sget-object v0, Lzk4;->y:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lzk4;->v:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lgl9;

    return-object p0
.end method

.method public final I0()Ldl4;
    .registers 1

    iget-object p0, p0, Lzk4;->w:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldl4;

    return-object p0
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lzk4;->t:Lwh2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p0

    iget-object p1, p1, Llj2;->b:Lob;

    invoke-virtual {p0, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lzk4;->x:Lyw;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object p1

    iget-object p1, p1, Lgl9;->b:Landroidx/recyclerview/widget/RecyclerView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object p1

    iget-object p1, p1, Lgl9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lva2;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1}, Lva2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object p1

    iget-object p1, p1, Lgl9;->d:Ljq2;

    iget-object p1, p1, Ljq2;->b:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    new-instance v0, Lyk4;

    invoke-direct {v0, p0, p2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lzk4;->I0()Ldl4;

    move-result-object p1

    iget-object v2, p0, Lltl;->n:Lqm9;

    iget-object p2, p1, Ldl4;->f:Lnkm;

    iget-object v3, p1, Ldl4;->e:Lgv2;

    new-instance v0, Lcom/opera/android/undo/UndoBar;

    iget-object v1, p2, Lnkm;->a:Lhjf;

    const/4 v5, 0x1

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v0, p1, Ldl4;->l:Lcom/opera/android/undo/UndoBar;

    const p1, 0x7f12000b

    invoke-virtual {v0, p1}, Lcom/opera/android/undo/UndoBar;->e(I)V

    invoke-virtual {p0}, Lzk4;->I0()Ldl4;

    move-result-object p1

    iget-object p1, p1, Ldl4;->i:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Lzk4;->H0()Lgl9;

    move-result-object v0

    iget-object v0, v0, Lgl9;->a:Landroid/widget/LinearLayout;

    new-instance v1, Lk9;

    const/16 v2, 0x17

    invoke-direct {v1, p0, v2}, Lk9;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lzk4;->u:Lua7;

    return-object p0
.end method
