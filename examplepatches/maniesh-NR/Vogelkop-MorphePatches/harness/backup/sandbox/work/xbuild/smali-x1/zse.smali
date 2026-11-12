.class public final Lzse;
.super Llj;
.source "SourceFile"


# instance fields
.field public final r:I

.field public final s:I

.field public t:Ly83;

.field public u:Landroid/view/MenuItem;

.field public final v:Ltni;

.field public final w:Lzyk;

.field public final x:Lua7;

.field public y:Lwse;


# direct methods
.method public constructor <init>(Ltni;Lgjm;)V
    .registers 6

    const v0, 0x7f0d0091

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput-boolean v2, v1, Litl;->e:Z

    const v2, 0x7f140592

    invoke-virtual {v0, v2}, Lu7k;->s(I)V

    const v0, 0x7f10003b

    iput v0, v1, Litl;->b:I

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    const v0, 0x7f140b2a

    iput v0, p0, Lzse;->r:I

    const v0, 0x7f140b20

    iput v0, p0, Lzse;->s:I

    iput-object p1, p0, Lzse;->v:Ltni;

    new-instance p1, Lyse;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lzse;->w:Lzyk;

    new-instance p1, Lua7;

    invoke-direct {p1, p0, p2}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p1, p0, Lzse;->x:Lua7;

    return-void
.end method


# virtual methods
.method public final G0()Ldte;
    .registers 1

    iget-object p0, p0, Lzse;->w:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldte;

    return-object p0
.end method

.method public final H0(Lij0;Ll0c;)V
    .registers 22

    move-object/from16 v0, p2

    invoke-virtual/range {p0 .. p0}, Lzse;->G0()Ldte;

    move-result-object v1

    move-object/from16 v2, p0

    iget-object v3, v2, Lzse;->x:Lua7;

    invoke-virtual {v3}, Lua7;->p()Ln37;

    move-result-object v4

    check-cast v4, Lt73;

    invoke-virtual {v4}, Lt73;->a()I

    move-result v4

    invoke-static {v4}, Lij0;->a(I)Lij0;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ll0c;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v1, Ldte;->c:Lru9;

    iget-object v7, v6, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v8, "settings.news.language_region.recently_used"

    const-string v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2e

    move-object v9, v7

    :cond_2e
    const-string v7, ";"

    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v7

    const/4 v10, 0x6

    const/4 v11, 0x0

    invoke-static {v9, v7, v11, v10}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_45
    :goto_45
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_62

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v12, v10

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_45

    invoke-static {v12, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_45

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_45

    :cond_62
    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v7, 0x2

    if-gt v7, v5, :cond_72

    move v5, v7

    :cond_72
    :goto_72
    if-ge v11, v5, :cond_7e

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v12, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    goto :goto_72

    :cond_7e
    invoke-virtual {v6}, Lru9;->b()Lnv6;

    move-result-object v5

    const/16 v17, 0x0

    const/16 v18, 0x3e

    const-string v13, ";"

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-static/range {v12 .. v18}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v5, Lnv6;->a:Ljava/lang/Object;

    check-cast v7, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v7, v8, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v5}, Lnv6;->w()V

    invoke-virtual {v1, v4, v0}, Ldte;->g(Lij0;Ll0c;)V

    iget-object v1, v1, Ldte;->b:Lfqe;

    invoke-virtual {v1}, Lfqe;->b()Lp1c;

    move-result-object v1

    invoke-virtual {v1, v0}, Lp1c;->g(Ll0c;)V

    new-instance v1, Ltse;

    move-object/from16 v4, p1

    invoke-direct {v1, v4, v0}, Ltse;-><init>(Lij0;Ll0c;)V

    invoke-static {v3, v1}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    invoke-virtual {v2}, Lryl;->g0()V

    return-void
.end method

.method public final I0(Late;Ljava/util/ArrayList;)V
    .registers 9

    iget-object v0, p0, Lzse;->x:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lt73;

    invoke-virtual {v1}, Lt73;->a()I

    move-result v1

    iget-object p1, p1, Late;->f:Ll0c;

    invoke-virtual {p1}, Ll0c;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {p2, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_22
    if-ge v4, v3, :cond_36

    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Late;

    iget-object v5, v5, Late;->f:Ll0c;

    invoke-virtual {v5}, Ll0c;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_22

    :cond_36
    new-instance p2, Lqse;

    invoke-direct {p2, v1, p1, v2}, Lqse;-><init>(ILjava/lang/String;Ljava/util/ArrayList;)V

    new-instance p1, Lmwc;

    const/4 v1, 0x2

    invoke-direct {p1, p0, v1}, Lmwc;-><init>(Lzse;B)V

    new-instance p0, Liwa;

    const/16 v1, 0xc

    invoke-direct {p0, p1, v1}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p2, p0}, Lua7;->E(Lr37;Lf7f;)V

    return-void
.end method

.method public final J0(Z)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-nez p1, :cond_11

    iget-object v2, p0, Lzse;->t:Ly83;

    if-nez v2, :cond_9

    move-object v2, v1

    :cond_9
    iget-object v2, v2, Ly83;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Lcom/google/android/material/appbar/AppBarLayout;->l(ZZ)Z

    :cond_11
    iget-object p0, p0, Lzse;->t:Ly83;

    if-eqz p0, :cond_17

    move-object v2, p0

    goto :goto_18

    :cond_17
    move-object v2, v1

    :goto_18
    iget-object v2, v2, Ly83;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    xor-int/lit8 v3, p1, 0x1

    iput-boolean v3, v2, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    if-eqz p0, :cond_24

    move-object v2, p0

    goto :goto_25

    :cond_24
    move-object v2, v1

    :goto_25
    iget-object v2, v2, Ly83;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    iput-boolean p1, v2, Lcom/google/android/material/appbar/AppBarLayout;->i:Z

    if-eqz p0, :cond_2e

    move-object v1, p0

    :cond_2e
    iget-object p0, v1, Ly83;->g:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    if-nez p1, :cond_35

    const/4 v0, 0x4

    :cond_35
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final l0(Z)V
    .registers 4

    iget-object v0, p0, Lzse;->u:Landroid/view/MenuItem;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object p0, p0, Lzse;->u:Landroid/view/MenuItem;

    if-eqz p0, :cond_11

    move-object v1, p0

    :cond_11
    invoke-interface {v1}, Landroid/view/MenuItem;->collapseActionView()Z

    return-void

    :cond_15
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object p0

    iget-object p0, p0, Ldte;->i:Lcte;

    invoke-virtual {p0}, Lcte;->e()V

    return-void
.end method

.method public final onDestroy()V
    .registers 5

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lzse;->y:Lwse;

    const/4 v1, 0x0

    if-nez v0, :cond_9

    move-object v0, v1

    :cond_9
    invoke-virtual {v0}, Lha2;->onDestroy()V

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object v0

    iget-object p0, p0, Lzse;->x:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lt73;

    invoke-virtual {p0}, Lt73;->a()I

    move-result p0

    invoke-static {p0}, Lij0;->a(I)Lij0;

    move-result-object p0

    iget-object v2, v0, Ldte;->i:Lcte;

    const/4 v3, 0x1

    iput-boolean v3, v2, Loh4;->a:Z

    invoke-virtual {v0, p0, v1}, Ldte;->g(Lij0;Ll0c;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 17

    new-instance v2, Lwse;

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object v0

    iget-object v0, v0, Ldte;->e:Lbte;

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object v1

    iget-object v1, v1, Ldte;->f:Lz8b;

    iget-object v3, p0, Lzse;->v:Ltni;

    invoke-direct {v2, v0, p0, v3, v1}, Lwse;-><init>(Lbte;Lzse;Ltni;Lz8b;)V

    iput-object v2, p0, Lzse;->y:Lwse;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v8

    new-instance v0, Llwc;

    iget-object v1, v2, Lwse;->o:Lbte;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v1, Lbte;->a:Lkze;

    iget-object v4, v2, Lwse;->k:Lz8b;

    invoke-direct {v0, v3, v4, v2}, Llwc;-><init>(Lkze;Lz8b;Lwse;)V

    iput-object v0, v2, Lwse;->m:Llwc;

    new-instance v0, Lavc;

    invoke-direct {v0, v2}, Lavc;-><init>(Lwse;)V

    iput-object v0, v2, Lwse;->q:Lavc;

    invoke-virtual {v2, v0}, Lha2;->G(Lfa2;)V

    new-instance v0, Lrwc;

    const-class v4, Lpwc;

    invoke-direct {v0, v4}, Lba2;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v2, v0}, Lha2;->G(Lfa2;)V

    new-instance v0, Ldwc;

    const/4 v9, 0x0

    invoke-direct {v0, v2, v9}, Ldwc;-><init>(Lwse;B)V

    new-instance v4, Lug;

    const/16 v10, 0x1c

    invoke-direct {v4, v0, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v11, v2, Lwse;->l:Lh42;

    invoke-virtual {v11, v3, v4}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, v1, Lbte;->b:Lkze;

    new-instance v3, Ldwc;

    const/4 v12, 0x1

    invoke-direct {v3, v2, v12}, Ldwc;-><init>(Lwse;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v3, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v11, v0, v4}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, v1, Lbte;->c:Lkze;

    new-instance v1, Ldwc;

    const/4 v13, 0x2

    invoke-direct {v1, v2, v13}, Ldwc;-><init>(Lwse;B)V

    new-instance v3, Lug;

    invoke-direct {v3, v1, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v11, v0, v3}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, Lci7;

    const/4 v6, 0x0

    const/16 v7, 0x18

    const/4 v1, 0x1

    const-class v3, Lwse;

    const-string v4, "updateItems"

    const-string v5, "updateItems(Ljava/util/List;)V"

    invoke-direct/range {v0 .. v7}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lug;

    invoke-direct {v1, v0, v10}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v11, v8, v1}, Lekc;->j(Lndc;Lf7f;)V

    invoke-super/range {p0 .. p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object v0, p0, Lzse;->t:Ly83;

    const/4 v1, 0x0

    if-nez v0, :cond_8f

    move-object v0, v1

    :cond_8f
    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v2, p0, Lzse;->y:Lwse;

    if-nez v2, :cond_98

    move-object v2, v1

    :cond_98
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, p0, Lzse;->t:Ly83;

    if-nez v0, :cond_a0

    move-object v0, v1

    :cond_a0
    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {v2, v12, v9}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v0, p0, Lzse;->t:Ly83;

    if-nez v0, :cond_b4

    move-object v0, v1

    :cond_b4
    iget-object v0, v0, Ly83;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    iget v2, p0, Lzse;->s:I

    invoke-virtual {v0, v2}, Lcom/opera/android/custom_views/AnimationEmptyListView;->c(I)V

    iget-object v0, p0, Lzse;->t:Ly83;

    if-nez v0, :cond_c2

    move-object v0, v1

    :cond_c2
    iget-object v0, v0, Ly83;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    new-instance v2, Lyzb;

    const/16 v3, 0xb

    invoke-direct {v2, p0, v3}, Lyzb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->a(Lzph;)V

    iget-object v0, p0, Lzse;->y:Lwse;

    if-nez v0, :cond_d5

    move-object v0, v1

    :cond_d5
    new-instance v2, La83;

    const/16 v3, 0x9

    invoke-direct {v2, p0, v3}, La83;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object v0

    iget-object v0, v0, Ldte;->e:Lbte;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lbte;->a:Lkze;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    new-instance v3, Lmwc;

    invoke-direct {v3, p0, v9}, Lmwc;-><init>(Lzse;B)V

    new-instance v4, Lug;

    const/16 v5, 0x1d

    invoke-direct {v4, v3, v5}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v2, v4}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object v0

    iget-object v0, v0, Ldte;->e:Lbte;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lbte;->b:Lkze;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    new-instance v3, Lmwc;

    invoke-direct {v3, p0, v12}, Lmwc;-><init>(Lzse;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v3, v5}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v2, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v0

    const v2, 0x7f0a0932

    invoke-virtual {v0, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lzse;->u:Landroid/view/MenuItem;

    if-nez v0, :cond_12b

    move-object v0, v1

    :cond_12b
    new-instance v2, Lz73;

    invoke-direct {v2, p0, v13}, Lz73;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    invoke-virtual {p0, v9}, Lzse;->J0(Z)V

    iget-object v0, p0, Lzse;->u:Landroid/view/MenuItem;

    if-nez v0, :cond_13b

    move-object v0, v1

    :cond_13b
    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lzse;->r:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    new-instance v2, Lqe6;

    const/16 v3, 0x1a

    invoke-direct {v2, p0, v3}, Lqe6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    iget-object p0, p0, Lzse;->t:Ly83;

    if-eqz p0, :cond_15d

    move-object v1, p0

    :cond_15d
    iget-object p0, v1, Ly83;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v1, Lnwc;

    invoke-direct {v1, v0}, Lnwc;-><init>(Landroidx/appcompat/widget/SearchView;)V

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 3

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a02a9

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Ly83;->a(Landroid/view/View;)Ly83;

    move-result-object p1

    iput-object p1, p0, Lzse;->t:Ly83;

    return-void
.end method

.method public final z0()V
    .registers 3

    iget-object v0, p0, Lzse;->t:Ly83;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v0}, Lz4o;->q0(Landroid/view/View;)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-static {p0, v1}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    return-void
.end method
