.class public final Lts1;
.super Llj;
.source "SourceFile"


# instance fields
.field public final r:Lzyk;

.field public s:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public t:Li4a;

.field public final u:Lss1;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lsl6;)V
    .registers 6

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object v0

    const v1, 0x7f1401ae

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lt2;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lts1;->r:Lzyk;

    new-instance v0, Lss1;

    sget-object v1, Ll08;->a:Ll08;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object p1

    iget-byte p1, p1, Ld7j;->e:B

    invoke-virtual {p2}, Lsl6;->b()Z

    move-result p2

    new-instance v2, Lole;

    invoke-direct {v2, p0}, Lole;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, p1, p2, v2}, Lss1;-><init>(Ll08;IZLole;)V

    iput-object v0, p0, Lts1;->u:Lss1;

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 7

    iput-object p2, p0, Lts1;->s:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    iget-object p1, p0, Lts1;->s:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v0, 0x0

    if-nez p1, :cond_c

    move-object p1, v0

    :cond_c
    iget-object v1, p0, Lts1;->u:Lss1;

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0}, Lts1;->G0()V

    iget-object p1, p0, Lts1;->r:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lat1;

    iget-object p1, p1, Lat1;->o:Ljze;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v2, Lpb;

    const/16 v3, 0x9

    invoke-direct {v2, p0, v3}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v1, p2, v0, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final G0()V
    .registers 12

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0003

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    new-instance v4, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    const/4 v0, 0x1

    invoke-direct {v4, v9, v0}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(II)V

    iget-object v0, p0, Lts1;->s:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v1, 0x0

    if-nez v0, :cond_1a

    move-object v0, v1

    :cond_1a
    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v0, p0, Lts1;->t:Li4a;

    if-eqz v0, :cond_29

    iget-object v2, p0, Lts1;->s:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-nez v2, :cond_26

    move-object v2, v1

    :cond_26
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->q0(Liph;)V

    :cond_29
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f070073

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f070072

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f070074

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f070075

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    new-instance v2, Lt79;

    iget-object v0, p0, Lts1;->s:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-nez v0, :cond_5d

    move-object v3, v1

    goto :goto_5e

    :cond_5d
    move-object v3, v0

    :goto_5e
    const/4 v10, 0x1

    invoke-direct/range {v2 .. v10}, Lt79;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V

    new-instance v0, Li4a;

    invoke-direct {v0, v2}, Li4a;-><init>(Lk8;)V

    iput-object v0, p0, Lts1;->t:Li4a;

    iget-object p0, p0, Lts1;->s:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz p0, :cond_6e

    move-object v1, p0

    :cond_6e
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Lts1;->G0()V

    iget-object p0, p0, Lts1;->s:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-nez p0, :cond_b

    const/4 p0, 0x0

    :cond_b
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    return-void
.end method

.method public final onResume()V
    .registers 10

    invoke-super {p0}, Lltl;->onResume()V

    iget-object v0, p0, Lts1;->r:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lat1;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    iget-boolean v0, v2, Lat1;->q:Z

    iget-object v1, v2, Lat1;->d:Llw3;

    iget-object v1, v1, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->k()Lsl6;

    move-result-object v1

    invoke-virtual {v1}, Lsl6;->b()Z

    move-result v1

    iput-boolean v1, v2, Lat1;->q:Z

    const/4 v7, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v0, v1, :cond_4d

    iget-boolean p0, v2, Lat1;->r:Z

    if-eqz p0, :cond_d2

    iput-boolean v5, v2, Lat1;->r:Z

    iget-object p0, v2, Lat1;->f:Lz77;

    new-instance v0, Los1;

    new-instance v1, Lx2;

    const/16 v5, 0x11

    invoke-direct {v1, v2, v3, v5}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lys1;

    invoke-direct {v3, v2, v7}, Lys1;-><init>(Lat1;B)V

    new-instance v5, Lys1;

    const/4 v6, 0x3

    invoke-direct {v5, v2, v6}, Lys1;-><init>(Lat1;B)V

    invoke-direct {v0, v1, v3, v5, v4}, Los1;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_4d
    iget-object v1, v2, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v1

    iget-boolean v6, v2, Lat1;->q:Z

    invoke-virtual {v2, v1, v4, v6}, Lat1;->k(Ld7j;ZZ)V

    iget-boolean v1, v2, Lat1;->r:Z

    if-eqz v1, :cond_d2

    iput-boolean v5, v2, Lat1;->r:Z

    if-nez v0, :cond_d2

    iget-boolean v0, v2, Lat1;->q:Z

    if-eqz v0, :cond_d2

    sget-object v0, Lvb0;->b:Lvb0;

    iput-object v0, v2, Lat1;->t:Lvb0;

    iget-object v0, v2, Lat1;->s:Ld7j;

    if-eqz v0, :cond_d2

    iget-byte v1, v0, Ld7j;->e:B

    invoke-virtual {v2, v0, v5, v4}, Lat1;->k(Ld7j;ZZ)V

    iget-object v0, v2, Lat1;->m:Lr2i;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    iget-object v0, v0, Lr2i;->c:Lru9;

    iget-object v5, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "rewards.claimed_app_icons"

    invoke-static {v5, v6}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v4, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object v0, v2, Lat1;->o:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lus1;

    iget-object v0, v0, Lus1;->a:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lqs1;

    iget v5, v5, Lqs1;->a:I

    if-ne v1, v5, :cond_a2

    goto :goto_b5

    :cond_b4
    const/4 v4, 0x0

    :goto_b5
    move-object v5, v4

    check-cast v5, Lqs1;

    if-eqz v5, :cond_d2

    iget-object v0, v2, Lat1;->e:Lgjm;

    new-instance v8, Ljt1;

    iget v1, v5, Lqs1;->b:I

    invoke-direct {v8, v1}, Ljt1;-><init>(I)V

    new-instance v1, Lxs1;

    const/4 v6, 0x0

    move-object v4, p0

    invoke-direct/range {v1 .. v6}, Lxs1;-><init>(Lat1;Landroid/content/Context;Lndc;Lqs1;B)V

    new-instance p0, Lug;

    invoke-direct {p0, v1, v7}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v8, v4, p0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    :cond_d2
    return-void
.end method
