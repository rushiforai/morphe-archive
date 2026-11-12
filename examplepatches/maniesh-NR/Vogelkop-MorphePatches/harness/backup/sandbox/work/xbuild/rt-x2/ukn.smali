.class public final Lukn;
.super Llj;
.source "SourceFile"


# instance fields
.field public A:Lcom/google/android/material/button/MaterialButton;

.field public B:Lcom/opera/android/custom_views/StylingImageButton;

.field public C:Lcom/google/android/material/appbar/AppBarLayout;

.field public D:Lqkn;

.field public final E:Lysj;

.field public final F:Lorm;

.field public final G:Leej;

.field public final H:Lg9l;

.field public I:Z

.field public J:Z

.field public final r:Lgjm;

.field public final s:Lqln;

.field public final t:Lonn;

.field public final u:Lcom/opera/android/settings/SettingsManager;

.field public final v:Lua7;

.field public final w:Lk3i;

.field public final x:Lx4i;

.field public y:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public z:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Lgjm;Lqln;Lonn;Lcom/opera/android/settings/SettingsManager;Lysj;Lorm;Leej;Lk3i;Lx4i;)V
    .registers 13

    const v0, 0x7f0d0476

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput-boolean v2, v1, Litl;->e:Z

    const v2, 0x7f14145c

    invoke-virtual {v0, v2}, Lu7k;->s(I)V

    const v0, 0x7f10003e

    iput v0, v1, Litl;->b:I

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Lukn;->r:Lgjm;

    iput-object p2, p0, Lukn;->s:Lqln;

    iput-object p3, p0, Lukn;->t:Lonn;

    iput-object p4, p0, Lukn;->u:Lcom/opera/android/settings/SettingsManager;

    iput-object p5, p0, Lukn;->E:Lysj;

    iput-object p6, p0, Lukn;->F:Lorm;

    iput-object p7, p0, Lukn;->G:Leej;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lukn;->v:Lua7;

    iput-object p8, p0, Lukn;->w:Lk3i;

    iput-object p9, p0, Lukn;->x:Lx4i;

    new-instance p1, Lg9l;

    const/16 p2, 0xd

    invoke-direct {p1, p0, p2}, Lg9l;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lukn;->H:Lg9l;

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 19

    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_9

    return-void

    :cond_9
    iget-object v2, v0, Lukn;->y:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    new-instance v4, Lqkn;

    iget-object v9, v0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v10, Lxjn;

    invoke-static {v1}, Lrih;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1c

    const/4 v3, 0x0

    :cond_1c
    invoke-direct {v10, v1, v3}, Lxjn;-><init>(Landroid/content/Context;Z)V

    iget-object v12, v0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    sget-object v15, Lwln;->a:Lwln;

    iget-object v1, v0, Lukn;->w:Lk3i;

    iget-object v2, v0, Lukn;->x:Lx4i;

    iget-object v5, v0, Lukn;->r:Lgjm;

    iget-object v6, v0, Lukn;->s:Lqln;

    iget-object v7, v0, Lukn;->t:Lonn;

    iget-object v8, v0, Lukn;->u:Lcom/opera/android/settings/SettingsManager;

    iget-object v11, v0, Lukn;->E:Lysj;

    iget-object v13, v0, Lukn;->F:Lorm;

    iget-object v14, v0, Lukn;->G:Leej;

    move-object/from16 v16, v1

    move-object/from16 v17, v2

    invoke-direct/range {v4 .. v17}, Lqkn;-><init>(Lgjm;Lqln;Lonn;Lcom/opera/android/settings/SettingsManager;Landroidx/recyclerview/widget/RecyclerView;Ln1;Lysj;Lcom/opera/android/StatusBarDrawingFrameLayout;Lorm;Leej;Lwln;Lk3i;Lx4i;)V

    iput-object v4, v0, Lukn;->D:Lqkn;

    iget-boolean v1, v0, Lukn;->I:Z

    invoke-virtual {v4, v1}, Lqkn;->c(Z)V

    iget-object v1, v0, Lukn;->s:Lqln;

    iget-object v1, v1, Lqln;->f:Lami;

    iget-object v1, v1, Lami;->g:Ljava/lang/Object;

    check-cast v1, Lkze;

    iget-object v0, v0, Lukn;->H:Lg9l;

    invoke-virtual {v1, v0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 5

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lukn;->D:Lqkn;

    if-eqz p0, :cond_2b

    iget-object p1, p0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0093

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    check-cast v1, Landroidx/recyclerview/widget/GridLayoutManager;

    if-eqz v1, :cond_2b

    iget v2, v1, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    if-eq v2, v0, :cond_2b

    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    invoke-virtual {p0, v0}, Lqkn;->b(I)V

    const/4 p0, -0x1

    if-eq v1, p0, :cond_2b

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_2b
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lukn;->v:Lua7;

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object p1

    check-cast p1, Lrkn;

    iget-object p1, p1, Lrkn;->a:Lvln;

    iget-object v0, p0, Lukn;->t:Lonn;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lmnn;

    invoke-direct {v1, p1}, Lmnn;-><init>(Lvln;)V

    iput-object v1, v0, Lonn;->g:Lmnn;

    iget-object p0, p0, Lukn;->x:Lx4i;

    iget-object p1, p0, Lx4i;->d:Lddc;

    new-instance v0, Lr07;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lr07;-><init>(Lx4i;ZLmt5;)V

    const/4 p0, 0x3

    invoke-static {p1, v2, v2, v0, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, p0, Lukn;->s:Lqln;

    iget-object v0, v0, Lqln;->f:Lami;

    iget-object v0, v0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lkze;

    iget-object v1, p0, Lukn;->H:Lg9l;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lukn;->D:Lqkn;

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Lqkn;->a()V

    :cond_1a
    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onDetach()V
    .registers 18

    invoke-super/range {p0 .. p0}, Lk24;->onDetach()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lukn;->t:Lonn;

    iget-object v1, v0, Lonn;->g:Lmnn;

    if-eqz v1, :cond_88

    iget-object v3, v1, Lmnn;->a:Lvln;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    if-eqz v3, :cond_35

    if-eq v3, v7, :cond_32

    if-eq v3, v6, :cond_2f

    if-eq v3, v5, :cond_2c

    if-eq v3, v4, :cond_29

    const/4 v8, 0x5

    if-ne v3, v8, :cond_25

    sget-object v3, Lku0;->g:Lku0;

    goto :goto_37

    :cond_25
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_29
    sget-object v3, Lku0;->f:Lku0;

    goto :goto_37

    :cond_2c
    sget-object v3, Lku0;->e:Lku0;

    goto :goto_37

    :cond_2f
    sget-object v3, Lku0;->d:Lku0;

    goto :goto_37

    :cond_32
    sget-object v3, Lku0;->c:Lku0;

    goto :goto_37

    :cond_35
    sget-object v3, Lku0;->b:Lku0;

    :goto_37
    iget-object v8, v0, Lonn;->h:Lnnn;

    if-eqz v8, :cond_3e

    iget-object v8, v8, Lnnn;->c:Laln;

    goto :goto_3f

    :cond_3e
    const/4 v8, 0x0

    :goto_3f
    if-eqz v8, :cond_44

    sget-object v8, Lvb0;->b:Lvb0;

    goto :goto_46

    :cond_44
    sget-object v8, Lvb0;->c:Lvb0;

    :goto_46
    iget-object v9, v0, Lonn;->d:Lx5f;

    iget-wide v10, v1, Lmnn;->b:J

    iget-object v1, v1, Lmnn;->c:Ljava/util/ArrayList;

    new-instance v12, Ljava/util/ArrayList;

    const/16 v13, 0xa

    invoke-static {v1, v13}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/4 v14, 0x0

    move v15, v14

    :goto_5d
    if-ge v15, v13, :cond_84

    invoke-virtual {v1, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    add-int/lit8 v15, v15, 0x1

    check-cast v16, Laln;

    invoke-interface/range {v16 .. v16}, Laln;->getId()Ljava/lang/String;

    move-result-object v2

    const-string v6, "FILE_storefront_wallpaper_"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_76

    const-string v2, "store-wallpaper"

    goto :goto_80

    :cond_76
    const-string v6, "FILE_user_wallpaper_"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_80

    const-string v2, "user-wallpaper"

    :cond_80
    :goto_80
    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5d

    :cond_84
    iget-boolean v1, v9, Lx5f;->h:Z

    if-nez v1, :cond_8a

    :cond_88
    :goto_88
    const/4 v1, 0x0

    goto :goto_d3

    :cond_8a
    iget-object v1, v9, Lx5f;->d:Lzpa;

    new-instance v2, Lju0;

    const/16 v6, 0x98b

    const/4 v13, -0x1

    invoke-direct {v2, v6, v13, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v2, v7, v7, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v14, v7, v8}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v5, v7, v12}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v3, 0x2

    invoke-virtual {v2, v3, v7, v10, v11}, Ljf0;->p(IIJ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v4

    invoke-virtual {v4, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    const/16 v4, 0x29

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-eqz v5, :cond_c3

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_c3

    new-instance v6, Lhf0;

    invoke-direct {v6, v1, v4, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_cc

    :cond_c3
    invoke-static {v1, v4, v7}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v5

    new-instance v6, Lhf0;

    invoke-direct {v6, v1, v4, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_cc
    invoke-virtual {v6, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v9, v3}, Lx5f;->U0(Lx56;)V

    goto :goto_88

    :goto_d3
    iput-object v1, v0, Lonn;->g:Lmnn;

    iput-object v1, v0, Lonn;->h:Lnnn;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    const/4 p0, 0x1

    return p0
.end method

.method public final x0(Litd;)V
    .registers 2

    const p0, 0x7f0a0053

    invoke-virtual {p1, p0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 8

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a0b0b

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iput-object p1, p0, Lukn;->y:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setEnabled(Z)V

    iget-object p1, p0, Lukn;->y:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    new-instance v1, Lr2n;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lr2n;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->b:Lzvk;

    const p1, 0x7f0a0269

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    const p1, 0x7f0a010b

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    iput-object p1, p0, Lukn;->C:Lcom/google/android/material/appbar/AppBarLayout;

    iget-object p1, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p2, p1}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    new-instance p1, Lr3i;

    new-instance v1, Lqfl;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v1}, Lr3i;-><init>(Lqfl;)V

    iget-object v1, p0, Lukn;->x:Lx4i;

    iget-object v1, v1, Lx4i;->h:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    iget-object v2, p0, Lukn;->w:Lk3i;

    invoke-virtual {v2}, Lk3i;->c()Z

    move-result v2

    const/16 v3, 0x8

    const v4, 0x7f0a0cc6

    if-eqz v2, :cond_96

    if-eqz v1, :cond_96

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_96

    invoke-static {p2, v4}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    iput-object v1, p0, Lukn;->A:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    const v1, 0x7f0a08f7

    invoke-static {p2, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p2, p0, Lukn;->B:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Lukn;->B:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p2, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object p2, p0, Lukn;->B:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v1, Lobn;

    const/4 v2, 0x6

    invoke-direct {v1, p0, p1, v2}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_ba

    :cond_96
    invoke-static {p2, v4}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    iput-object p1, p0, Lukn;->A:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lrih;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_ab

    move v3, v0

    :cond_ab
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lukn;->A:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lpkm;

    const/16 v1, 0xd

    invoke-direct {p2, p0, v1}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_ba
    iget-object p1, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    iget-object p1, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iget-object v3, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v2, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-virtual {p1, p2, v1, v3, v2}, Landroid/view/View;->setPadding(IIII)V

    iget-object p1, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Lsvk;

    const/16 v1, 0x1a

    invoke-direct {p2, p0, v1}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    iget-object p1, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Ltkn;

    invoke-direct {p2, p0, p1}, Ltkn;-><init>(Lukn;Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    iget-object p1, p0, Lukn;->s:Lqln;

    iget-object p2, p1, Lqln;->f:Lami;

    iget-object p1, p1, Lqln;->f:Lami;

    iget-object p2, p2, Lami;->e:Ljava/lang/Object;

    check-cast p2, Lvq8;

    invoke-virtual {p2}, Lvq8;->i()Z

    move-result v1

    if-nez v1, :cond_10a

    iget-boolean p2, p2, Lvq8;->a:Z

    if-eqz p2, :cond_112

    :cond_10a
    iget-object p2, p1, Lami;->d:Ljava/lang/Object;

    check-cast p2, Ls14;

    iget-boolean p2, p2, Ls14;->b:Z

    if-nez p2, :cond_120

    :cond_112
    iget-object p2, p0, Lukn;->z:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p2}, Lw8h;->w(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance p2, Lskn;

    invoke-direct {p2, p0, v0}, Lskn;-><init>(Lukn;B)V

    invoke-virtual {p1, p2}, Lami;->r(Ljava/lang/Runnable;)V

    return-void

    :cond_120
    invoke-virtual {p0}, Lukn;->G0()V

    return-void
.end method
