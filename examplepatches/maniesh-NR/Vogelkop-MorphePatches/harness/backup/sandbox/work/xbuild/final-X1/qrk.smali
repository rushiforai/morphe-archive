.class public final Lqrk;
.super Llj;
.source "SourceFile"


# static fields
.field public static final synthetic u:[Lxtb;


# instance fields
.field public final r:Lktl;

.field public final s:Lua7;

.field public final t:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lqrk;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/WalletSunsetBackupBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lqrk;->u:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 4

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f141418

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lgpk;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lgpk;-><init>(B)V

    invoke-virtual {p0, v0}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object v0

    iput-object v0, p0, Lqrk;->r:Lktl;

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lqrk;->s:Lua7;

    new-instance p1, Lyse;

    const/16 v0, 0x11

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lqrk;->t:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0()Lgjn;
    .registers 3

    sget-object v0, Lqrk;->u:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lqrk;->r:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lgjn;

    return-object p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 12

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance v2, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    const/4 p1, 0x2

    const/4 p2, 0x1

    invoke-direct {v2, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(II)V

    invoke-virtual {p0}, Lqrk;->G0()Lgjn;

    move-result-object p1

    iget-object p1, p1, Lgjn;->c:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v0, Lt79;

    invoke-virtual {p0}, Lqrk;->G0()Lgjn;

    move-result-object p1

    iget-object v1, p1, Lgjn;->c:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/high16 p1, 0x41800000    # 16.0f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    const/high16 p1, 0x41000000    # 8.0f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v4

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v8}, Lt79;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V

    new-instance p1, Li4a;

    invoke-direct {p1, v0}, Li4a;-><init>(Lk8;)V

    invoke-virtual {p0}, Lqrk;->G0()Lgjn;

    move-result-object p2

    iget-object p2, p2, Lgjn;->c:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    invoke-virtual {p0}, Lqrk;->G0()Lgjn;

    move-result-object p1

    iget-object p1, p1, Lgjn;->c:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p2, Lev5;

    iget-object v0, p0, Lqrk;->t:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrrk;

    iget-object v1, p0, Lqrk;->s:Lua7;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lork;

    iget-object v1, v1, Lork;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, " "

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x6

    invoke-static {v1, v0, v2, v3}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Lev5;-><init>(Lqrk;Ljava/util/List;)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0}, Lqrk;->G0()Lgjn;

    move-result-object p1

    iget-object p1, p1, Lgjn;->b:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance p2, Lh4i;

    const/16 v0, 0x11

    invoke-direct {p2, p0, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final w0()Z
    .registers 1

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
