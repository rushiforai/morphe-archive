.class public final Luw;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lo37;


# static fields
.field public static final synthetic x:[Lxtb;


# instance fields
.field public final t:Lua7;

.field public final u:Lktl;

.field public final v:Lzyk;

.field public w:Lyw;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Luw;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentAddressesSettingsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Luw;->x:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 5

    const/4 v0, 0x0

    const/16 v1, 0xe

    const v2, 0x7f14020a

    invoke-direct {p0, v2, v0, v1}, Li93;-><init>(III)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Luw;->t:Lua7;

    new-instance p1, Lmc8;

    const/16 v0, 0x1c

    invoke-direct {p1, v0}, Lmc8;-><init>(B)V

    invoke-virtual {p0, p1}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p1

    iput-object p1, p0, Luw;->u:Lktl;

    new-instance p1, Lt2;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Luw;->v:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Luw;->I0()Lcx;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lxk9;
    .registers 3

    sget-object v0, Luw;->x:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Luw;->u:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lxk9;

    return-object p0
.end method

.method public final I0()Lcx;
    .registers 1

    iget-object p0, p0, Luw;->v:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcx;

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Luw;->w:Lyw;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object p1

    iget-object p1, p1, Lxk9;->c:Landroidx/recyclerview/widget/RecyclerView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object p1

    iget-object p1, p1, Lxk9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lbi;

    const/16 v0, 0xb

    invoke-direct {p2, p0, v0}, Lbi;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object p1

    iget-object p1, p1, Lxk9;->e:Ljq2;

    iget-object p1, p1, Ljq2;->b:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    new-instance p2, Lgf;

    const/16 v0, 0x9

    invoke-direct {p2, p0, v0}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Luw;->I0()Lcx;

    move-result-object p1

    iget-object v2, p0, Lltl;->n:Lqm9;

    iget-object p2, p1, Lcx;->g:Lnkm;

    iget-object v3, p1, Lcx;->e:Lsw;

    new-instance v0, Lcom/opera/android/undo/UndoBar;

    iget-object v1, p2, Lnkm;->a:Lhjf;

    const/4 v5, 0x1

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v0, p1, Lcx;->j:Lcom/opera/android/undo/UndoBar;

    const p1, 0x7f12000a

    invoke-virtual {v0, p1}, Lcom/opera/android/undo/UndoBar;->e(I)V

    invoke-virtual {p0}, Luw;->I0()Lcx;

    move-result-object p1

    iget-object p1, p1, Lcx;->h:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Luw;->H0()Lxk9;

    move-result-object v0

    iget-object v0, v0, Lxk9;->a:Landroid/widget/LinearLayout;

    new-instance v1, Lk9;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Lk9;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Luw;->t:Lua7;

    return-object p0
.end method
