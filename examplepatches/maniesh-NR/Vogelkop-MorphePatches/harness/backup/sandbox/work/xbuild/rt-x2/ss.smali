.class public final Lss;
.super Lltl;
.source "SourceFile"


# static fields
.field public static final synthetic v:[Lxtb;


# instance fields
.field public final r:Lua7;

.field public final s:Lzyk;

.field public final t:Lks;

.field public u:Lcom/opera/android/custom_views/FadingRecyclerView;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lss;

    const-string v2, "adapter"

    const-string v3, "getAdapter()Lcom/opera/android/favorites/add/AddFavoriteAdapter;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lss;->v:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 7

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lss;->r:Lua7;

    new-instance p1, Lt2;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lss;->s:Lzyk;

    new-instance p1, Lwth;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lwth;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lrs;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lrs;-><init>(Lss;B)V

    new-instance v2, Lks;

    new-instance v3, Lrs;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lrs;-><init>(Lss;B)V

    invoke-direct {v2, p1, v1, v0, v3}, Lks;-><init>(Lbs;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v2, p0, Lss;->t:Lks;

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 6

    iput-object p2, p0, Lss;->u:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0}, Lss;->G0()Lxs;

    move-result-object p1

    iget-object v0, p0, Lss;->r:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lqs;

    iget-object v0, v0, Lqs;->b:[Lst;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v0, :cond_18

    const/4 v0, 0x0

    new-array v0, v0, [Lst;

    :cond_18
    iget-object v1, p1, Lxs;->b:Lqb7;

    invoke-virtual {v1, v0}, Lqb7;->v([Lst;)Z

    iput-object v0, p1, Lxs;->h:[Lst;

    invoke-virtual {p1}, Lxs;->f()V

    invoke-virtual {p0}, Lss;->G0()Lxs;

    move-result-object p1

    iget-object p1, p1, Lxs;->g:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    new-instance v1, Lk9;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lk9;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, v0, p2, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final C0(Litl;)Litl;
    .registers 6

    invoke-virtual {p0}, Lss;->G0()Lxs;

    move-result-object v0

    iget-object v1, p0, Lss;->r:Lua7;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lqs;

    iget-object v1, v1, Lqs;->a:Lts;

    const/4 v2, 0x0

    if-eqz v1, :cond_1d

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v1, Lts;->a:Lkq8;

    iget v3, v1, Lkq8;->a:I

    iput v3, v0, Lxs;->f:I

    iput-object v1, v0, Lxs;->i:Lkq8;

    goto :goto_22

    :cond_1d
    const/4 v1, 0x0

    iput v1, v0, Lxs;->f:I

    iput-object v2, v0, Lxs;->i:Lkq8;

    :goto_22
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lss;->G0()Lxs;

    move-result-object p0

    iget p0, p0, Lxs;->f:I

    if-eqz p0, :cond_32

    new-instance v2, Lrxh;

    invoke-direct {v2, p0}, Lrxh;-><init>(I)V

    :cond_32
    iput-object v2, p1, Litl;->a:Lpxh;

    return-object p1
.end method

.method public final G0()Lxs;
    .registers 1

    iget-object p0, p0, Lss;->s:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxs;

    return-object p0
.end method

.method public final l0(Z)V
    .registers 4

    invoke-virtual {p0}, Lss;->G0()Lxs;

    move-result-object v0

    iget-object v0, v0, Lxs;->h:[Lst;

    iget-object v1, p0, Lss;->r:Lua7;

    invoke-static {v1, v0}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lss;->u:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    :cond_a
    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lss;->u:Lcom/opera/android/custom_views/FadingRecyclerView;

    return-void
.end method
