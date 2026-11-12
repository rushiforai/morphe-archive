.class public final Lndn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lvs;

.field public final c:Lydn;

.field public final d:Lode;

.field public final e:Ljava/util/List;

.field public final f:Lqdn;

.field public final g:Lgdn;

.field public final h:Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

.field public final i:Lvc7;

.field public final j:Lgmk;

.field public final k:Lcom/google/android/material/appbar/AppBarLayout;

.field public final l:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

.field public final m:Landroid/view/View;

.field public n:Ljava/util/List;

.field public o:Ljava/util/List;

.field public p:Lfdn;

.field public q:Z

.field public r:Z

.field public final s:Landroid/view/MenuItem;

.field public t:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lndc;Lvs;Lydn;Ljava/util/List;Ljava/util/List;Ltni;Lcom/opera/android/Lazy;Litd;Lr2n;Lyug;Lgmk;)V
    .registers 36

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v5, p4

    move-object/from16 v13, p6

    move-object/from16 v10, p12

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v14, Lode;

    invoke-direct {v14}, Lekc;-><init>()V

    iput-object v14, v0, Lndn;->d:Lode;

    iput-object v1, v0, Lndn;->a:Landroid/content/Context;

    iput-object v3, v0, Lndn;->b:Lvs;

    iget-object v4, v3, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v6, 0x7f0a010b

    invoke-static {v6, v4}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/google/android/material/appbar/AppBarLayout;

    iput-object v4, v0, Lndn;->k:Lcom/google/android/material/appbar/AppBarLayout;

    iget-object v4, v3, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v6, 0x7f0a023d

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    iput-object v6, v0, Lndn;->l:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    const v6, 0x7f0a0944

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v4, v0, Lndn;->m:Landroid/view/View;

    iput-object v5, v0, Lndn;->c:Lydn;

    iput-object v10, v0, Lndn;->j:Lgmk;

    iput-object v13, v0, Lndn;->e:Ljava/util/List;

    iget-object v4, v5, Lydn;->c:Lgfn;

    invoke-interface {v4}, Lgfn;->isEnabled()Z

    move-result v4

    iput-boolean v4, v0, Lndn;->q:Z

    invoke-virtual {v0}, Lndn;->a()Z

    move-result v4

    iput-boolean v4, v0, Lndn;->r:Z

    invoke-virtual {v0}, Lndn;->c()V

    new-instance v4, Ltah;

    new-instance v7, Ly1n;

    const/16 v6, 0xb

    move-object/from16 v8, p10

    invoke-direct {v7, v8, v6}, Ly1n;-><init>(Ljava/lang/Object;B)V

    iget-object v6, v3, Lvs;->b:Landroid/view/ViewGroup;

    move-object v8, v6

    check-cast v8, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    new-instance v11, Ljjg;

    const/16 v6, 0xe

    invoke-direct {v11, v0, v6}, Ljjg;-><init>(Ljava/lang/Object;B)V

    new-instance v12, Ly1n;

    const/16 v6, 0xc

    invoke-direct {v12, v0, v6}, Ly1n;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v6, p8

    move-object/from16 v9, p11

    invoke-direct/range {v4 .. v12}, Ltah;-><init>(Lydn;Lcom/opera/android/Lazy;Ly1n;Landroid/view/View;Lyug;Lgmk;Ljjg;Ly1n;)V

    new-instance v6, Lqdn;

    new-instance v7, Lm2g;

    const/4 v8, 0x3

    invoke-direct {v7, v14, v8}, Lm2g;-><init>(Lode;B)V

    invoke-direct {v6, v13, v7}, Lqdn;-><init>(Ljava/util/List;Lm2g;)V

    iput-object v6, v0, Lndn;->f:Lqdn;

    iget-object v6, v3, Lvs;->d:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v15, Lgdn;

    iget-object v7, v0, Lndn;->o:Ljava/util/List;

    iget-object v9, v0, Lndn;->n:Ljava/util/List;

    iget-object v11, v0, Lndn;->p:Lfdn;

    iget-boolean v12, v0, Lndn;->q:Z

    iget-boolean v8, v0, Lndn;->r:Z

    move-object/from16 v17, p5

    move-object/from16 v16, p7

    move-object/from16 v18, v7

    move/from16 v22, v8

    move-object/from16 v19, v9

    move-object/from16 v20, v11

    move/from16 v21, v12

    invoke-direct/range {v15 .. v22}, Lgdn;-><init>(Ltni;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lfdn;ZZ)V

    iput-object v15, v0, Lndn;->g:Lgdn;

    new-instance v7, Lilm;

    const/4 v8, 0x7

    invoke-direct {v7, v0, v8}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v2}, Lndc;->getLifecycle()Ltcc;

    move-result-object v8

    iget-object v9, v4, Ltah;->c:Ljava/lang/Object;

    check-cast v9, Li7f;

    invoke-virtual {v9, v7}, Li7f;->b(Ljava/lang/Object;)Z

    new-instance v9, Lqs2;

    invoke-direct {v9, v4, v7}, Lqs2;-><init>(Ltah;Lilm;)V

    invoke-virtual {v8, v9}, Ltcc;->a(Lmdc;)V

    new-instance v7, Leve;

    invoke-direct {v7, v1, v4}, Leve;-><init>(Landroid/content/Context;Ltah;)V

    invoke-virtual {v15, v7}, Lha2;->G(Lfa2;)V

    new-instance v7, Lnzb;

    const/4 v8, 0x0

    invoke-direct {v7, v4, v8}, Lnzb;-><init>(Ltah;B)V

    invoke-virtual {v15, v7}, Lha2;->G(Lfa2;)V

    new-instance v7, Lnzb;

    const/4 v9, 0x2

    invoke-direct {v7, v4, v9}, Lnzb;-><init>(Ltah;B)V

    invoke-virtual {v15, v7}, Lha2;->G(Lfa2;)V

    new-instance v7, Lnzb;

    const/4 v11, 0x1

    invoke-direct {v7, v4, v11}, Lnzb;-><init>(Ltah;B)V

    invoke-virtual {v15, v7}, Lha2;->G(Lfa2;)V

    invoke-virtual {v6, v15}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v7, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v7, v11, v8}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v3, v3, Lvs;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    iput-object v3, v0, Lndn;->h:Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    new-instance v7, Lmdn;

    invoke-direct {v7, v0, v8}, Lmdn;-><init>(Lndn;B)V

    invoke-virtual {v14, v2, v7}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v7, Lr2n;

    const/4 v12, 0x3

    invoke-direct {v7, v0, v12}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v7}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->a(Lzph;)V

    invoke-virtual {v0, v8}, Lndn;->d(Z)V

    const v3, 0x7f0a0932

    move-object/from16 v7, p9

    invoke-virtual {v7, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_126

    invoke-interface {v3, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_161

    :cond_126
    invoke-interface {v3, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iput-object v3, v0, Lndn;->s:Landroid/view/MenuItem;

    new-instance v7, Lz73;

    const/4 v8, 0x4

    invoke-direct {v7, v0, v8}, Lz73;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v3, v7}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    iget-object v3, v0, Lndn;->s:Landroid/view/MenuItem;

    invoke-interface {v3}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/SearchView;

    const v7, 0x7f14139c

    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    new-instance v1, Lbxk;

    const/16 v7, 0xa

    invoke-direct {v1, v0, v7}, Lbxk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    new-instance v1, Lnwc;

    invoke-direct {v1, v0, v3}, Lnwc;-><init>(Lndn;Landroidx/appcompat/widget/SearchView;)V

    invoke-virtual {v6, v1}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    new-instance v1, Ly1n;

    const/16 v6, 0xd

    invoke-direct {v1, v3, v6}, Ly1n;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v4, Ltah;->f:Ljava/lang/Object;

    :goto_161
    new-instance v1, Lvc7;

    invoke-direct {v1, v0, v9}, Lvc7;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lndn;->i:Lvc7;

    invoke-virtual {v5, v1}, Lydn;->b(Ltdn;)V

    iget-object v1, v10, Lgmk;->a:Lkze;

    new-instance v3, Lmdn;

    invoke-direct {v3, v0, v11}, Lmdn;-><init>(Lndn;B)V

    invoke-virtual {v1, v2, v3}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 5

    iget-object v0, p0, Lndn;->j:Lgmk;

    iget-object v0, v0, Lgmk;->a:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luvg;

    sget-object v1, Luvg;->d:Luvg;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_12

    move v0, v2

    goto :goto_13

    :cond_12
    move v0, v3

    :goto_13
    iget-object p0, p0, Lndn;->a:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn_pro.kill_switch.on"

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz v0, :cond_26

    if-eqz p0, :cond_26

    return v2

    :cond_26
    return v3
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Lndn;->c:Lydn;

    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    invoke-virtual {p0}, Lndn;->a()Z

    move-result v1

    iget-boolean v2, p0, Lndn;->q:Z

    if-ne v2, v0, :cond_15

    iget-boolean v2, p0, Lndn;->r:Z

    if-ne v2, v1, :cond_15

    return-void

    :cond_15
    iput-boolean v0, p0, Lndn;->q:Z

    iput-boolean v1, p0, Lndn;->r:Z

    invoke-virtual {p0}, Lndn;->c()V

    iget-boolean v0, p0, Lndn;->q:Z

    iget-boolean v1, p0, Lndn;->r:Z

    iget-object v2, p0, Lndn;->n:Ljava/util/List;

    iget-object v3, p0, Lndn;->p:Lfdn;

    iget-object p0, p0, Lndn;->g:Lgdn;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3, v2}, Lgdn;->Y(Lfdn;Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lgdn;->m:Ljava/util/List;

    iput-object v3, p0, Lgdn;->n:Lfdn;

    iput-boolean v0, p0, Lgdn;->o:Z

    iput-boolean v1, p0, Lgdn;->r:Z

    iget-boolean v0, p0, Lgdn;->q:Z

    invoke-virtual {p0, v0}, Lgdn;->Z(Z)V

    return-void
.end method

.method public final c()V
    .registers 10

    iget-boolean v0, p0, Lndn;->q:Z

    iget-object v1, p0, Lndn;->c:Lydn;

    if-eqz v0, :cond_b

    invoke-virtual {v1}, Lydn;->o()Lfdn;

    move-result-object v0

    goto :goto_f

    :cond_b
    invoke-virtual {v1}, Lydn;->n()Lfdn;

    move-result-object v0

    :goto_f
    iput-object v0, p0, Lndn;->p:Lfdn;

    iget-object v0, p0, Lndn;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v1, p0, Lndn;->p:Lfdn;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iget-object v4, p0, Lndn;->e:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_29
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_44

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfdn;

    invoke-virtual {v5}, Lfdn;->b()Z

    move-result v6

    if-eqz v6, :cond_3e

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3e
    iget-object v6, v5, Lfdn;->b:Ljava/lang/String;

    invoke-virtual {v3, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_29

    :cond_44
    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "settings.vpn.location.recently_used"

    const-string v5, ""

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v4, 0x3b

    const/4 v5, 0x1

    invoke-static {v5, v0, v4}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    :cond_5f
    :goto_5f
    if-ge v6, v5, :cond_81

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Ljava/lang/String;

    iget-object v8, v1, Lfdn;->b:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_75

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5f

    :cond_75
    invoke-virtual {v3, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lfdn;

    if-eqz v7, :cond_5f

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5f

    :cond_81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Lomj;

    const/16 v2, 0x11

    invoke-direct {v1, v2}, Lomj;-><init>(B)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-static {v4, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    iput-object v1, p0, Lndn;->n:Ljava/util/List;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lndn;->o:Ljava/util/List;

    return-void
.end method

.method public final d(Z)V
    .registers 10

    iget-object v0, p0, Lndn;->g:Lgdn;

    invoke-virtual {v0, p1}, Lgdn;->Z(Z)V

    iget-object v0, p0, Lndn;->m:Landroid/view/View;

    iget-object v1, p0, Lndn;->b:Lvs;

    iget-object v2, p0, Lndn;->a:Landroid/content/Context;

    iget-object v3, p0, Lndn;->k:Lcom/google/android/material/appbar/AppBarLayout;

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lndn;->l:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    if-eqz p1, :cond_35

    if-eqz v6, :cond_20

    invoke-static {v2}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    invoke-virtual {v6, v2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e(I)V

    :cond_20
    iput-boolean v5, v3, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    iput-boolean v4, v3, Lcom/google/android/material/appbar/AppBarLayout;->i:Z

    invoke-virtual {v3, v5, v4}, Lcom/google/android/material/appbar/AppBarLayout;->l(ZZ)Z

    invoke-virtual {v3, v5, v5, v4}, Lcom/google/android/material/appbar/AppBarLayout;->k(ZZZ)V

    iget-object v1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1, v5}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_54

    :cond_35
    if-eqz v6, :cond_45

    const v7, 0x7f0402f0

    invoke-static {v7, v2}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    invoke-virtual {v6, v2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e(I)V

    :cond_45
    iput-boolean v4, v3, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    iput-boolean v5, v3, Lcom/google/android/material/appbar/AppBarLayout;->i:Z

    iget-object v1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1, v4}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_54
    iput-boolean p1, p0, Lndn;->t:Z

    iget-object p0, p0, Lndn;->h:Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    invoke-virtual {p0}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->b()V

    return-void
.end method
