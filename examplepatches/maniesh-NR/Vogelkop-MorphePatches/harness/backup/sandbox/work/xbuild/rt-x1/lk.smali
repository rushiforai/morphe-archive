.class public final Llk;
.super Li93;
.source "SourceFile"


# instance fields
.field public final t:Lmw3;

.field public final u:Lzyk;


# direct methods
.method public constructor <init>(Lmw3;)V
    .registers 4

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object v0

    const v1, 0x7f140098

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const v1, 0x7f100001

    iput v1, v0, Litl;->b:I

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Li93;-><init>(Litl;Z)V

    iput-object p1, p0, Llk;->t:Lmw3;

    new-instance p1, Lt2;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Llk;->u:Lzyk;

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 10

    iget-object p1, p2, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    check-cast p1, Lxkj;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lxkj;->g:Z

    new-instance p1, Lwf;

    const/4 v1, 0x1

    invoke-direct {p1, v1}, Lwf;-><init>(B)V

    new-instance v2, Lmc8;

    const/16 v3, 0x16

    invoke-direct {v2, v3}, Lmc8;-><init>(B)V

    new-instance v3, Lyj;

    invoke-direct {v3, p0, v0}, Lyj;-><init>(Llk;B)V

    new-instance v4, La3j;

    const/4 v5, 0x4

    invoke-direct {v4, v5}, La3j;-><init>(B)V

    const-class v6, Lck;

    invoke-virtual {p1, v6, v2, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v2, Lmc8;

    const/16 v3, 0x17

    invoke-direct {v2, v3}, Lmc8;-><init>(B)V

    new-instance v3, Lmc8;

    const/16 v4, 0x18

    invoke-direct {v3, v4}, Lmc8;-><init>(B)V

    new-instance v4, La3j;

    invoke-direct {v4, v5}, La3j;-><init>(B)V

    const-class v6, Lbk;

    invoke-virtual {p1, v6, v2, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v2, Lmc8;

    const/16 v3, 0x19

    invoke-direct {v2, v3}, Lmc8;-><init>(B)V

    new-instance v3, Lyj;

    invoke-direct {v3, p0, v1}, Lyj;-><init>(Llk;B)V

    new-instance v4, La3j;

    invoke-direct {v4, v5}, La3j;-><init>(B)V

    const-class v6, Lzj;

    invoke-virtual {p1, v6, v2, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v2, Lmc8;

    const/16 v3, 0x1a

    invoke-direct {v2, v3}, Lmc8;-><init>(B)V

    new-instance v3, Lyj;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v4}, Lyj;-><init>(Llk;B)V

    new-instance v4, La3j;

    invoke-direct {v4, v5}, La3j;-><init>(B)V

    const-class v5, Lak;

    invoke-virtual {p1, v5, v2, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    invoke-virtual {p2, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object v1

    iget-object v1, v1, Lpk;->g:Lwnm;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    new-instance v3, Lwj;

    invoke-direct {v3, p1, p0, v0}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {v1, v2, p2, p0, v3}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final G0()Lh93;
    .registers 1

    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Lpk;
    .registers 1

    iget-object p0, p0, Llk;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpk;

    return-object p0
.end method

.method public final onDetach()V
    .registers 6

    invoke-super {p0}, Lk24;->onDetach()V

    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object p0

    iget-object v0, p0, Lpk;->d:Lri3;

    iget-object v1, p0, Lpk;->f:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La7j;

    iget-object v3, v0, Lri3;->a:Lsi3;

    iget-object v3, v3, Lsi3;->q:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lus4;

    iget-object v3, v3, Lus4;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v4, "ad_blocking_mode"

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    invoke-virtual {v3, v2, v4}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, La7j;->c:La7j;

    if-ne v1, v2, :cond_87

    iget-object p0, p0, Lpk;->e:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_48
    :goto_48
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_61

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnvm;

    iget-object v3, v2, Lnvm;->a:Ljava/lang/String;

    iget-boolean v2, v2, Lnvm;->f:Z

    if-nez v2, :cond_5b

    const/4 v3, 0x0

    :cond_5b
    if-eqz v3, :cond_48

    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_48

    :cond_61
    iget-object p0, v0, Lri3;->a:Lsi3;

    iget-object p0, p0, Lsi3;->q:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lus4;

    iget-object p0, p0, Lus4;->b:Lcom/opera/android/settings/SettingsManager;

    sget-object v0, Lrpb;->d:Lqpb;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lk72;

    sget-object v3, Lxhk;->a:Lxhk;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {v0, v1, v2}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ad_blocking_mode.selected_custom_lists"

    invoke-virtual {p0, v1, v0}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    :cond_87
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-super {p0, p1}, Li93;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0c60

    const/4 v2, 0x0

    if-ne p1, v0, :cond_48

    invoke-virtual {p0}, Llk;->H0()Lpk;

    move-result-object p1

    iget-object p1, p1, Lpk;->d:Lri3;

    iget-object p1, p1, Lri3;->a:Lsi3;

    iget-object p1, p1, Lsi3;->s:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmj3;

    iget-boolean v0, p1, Lmj3;->c:Z

    if-nez v0, :cond_32

    iput-boolean v1, p1, Lmj3;->c:Z

    iget-object v0, p1, Lmj3;->b:Lcom/opera/android/PushedContentHandler;

    new-instance v3, Lc3;

    invoke-direct {v3, p1, v1}, Lc3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v3}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    :cond_32
    iget-object p0, p0, Llk;->t:Lmw3;

    invoke-virtual {p0}, Lmw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lysj;

    const p1, 0x7f14009a

    const/16 v0, 0x1388

    invoke-static {p1, v0, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_48
    return v2
.end method
