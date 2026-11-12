.class public final Lldn;
.super Llj;
.source "SourceFile"


# instance fields
.field public final r:Lua7;

.field public final s:Lydn;

.field public final t:Ltni;

.field public final u:Lcom/opera/android/Lazy;

.field public final v:Lyug;

.field public final w:Lgmk;

.field public x:Lndn;

.field public y:Lvs;


# direct methods
.method public constructor <init>(Lgjm;Lydn;Ltni;Lcom/opera/android/Lazy;Lyug;Lgmk;)V
    .registers 10

    const v0, 0x7f0d045a

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput-boolean v2, v1, Litl;->e:Z

    const v2, 0x7f14139b

    invoke-virtual {v0, v2}, Lu7k;->s(I)V

    const v0, 0x7f10003b

    iput v0, v1, Litl;->b:I

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lldn;->r:Lua7;

    iput-object p2, p0, Lldn;->s:Lydn;

    iput-object p3, p0, Lldn;->t:Ltni;

    iput-object p4, p0, Lldn;->u:Lcom/opera/android/Lazy;

    iput-object p5, p0, Lldn;->v:Lyug;

    iput-object p6, p0, Lldn;->w:Lgmk;

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 15

    iget-object v0, p0, Lldn;->y:Lvs;

    if-eqz v0, :cond_d8

    iget-object v0, p0, Lldn;->x:Lndn;

    if-nez v0, :cond_d8

    iget-object v5, p0, Lldn;->s:Lydn;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, LJ/N;->MNYP_$wg()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_1a
    if-ge v3, v2, :cond_2a

    aget-object v4, v1, v3

    invoke-virtual {v5, v4}, Lydn;->h(Ljava/lang/String;)Lfdn;

    move-result-object v4

    if-eqz v4, :cond_27

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_2a
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    iget-object v0, v5, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_47

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_47

    new-instance v0, Ly1n;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, LJ/N;->M0gL$01e(Ljava/lang/Object;)V

    return-void

    :cond_47
    new-instance v1, Lndn;

    iget-object v0, p0, Lldn;->y:Lvs;

    iget-object v0, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    iget-object v4, p0, Lldn;->y:Lvs;

    iget-object v0, v5, Lydn;->c:Lgfn;

    invoke-virtual {v5}, Lydn;->p()Lwdn;

    move-result-object v7

    iget-boolean v8, v7, Lwdn;->a:Z

    if-eqz v8, :cond_b1

    iget-boolean v7, v7, Lwdn;->b:Z

    if-eqz v7, :cond_b1

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v7

    if-nez v7, :cond_79

    iget-object v7, v5, Lydn;->q:Ljtg;

    invoke-virtual {v7}, Ljtg;->a()Z

    move-result v7

    if-nez v7, :cond_79

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_77
    move-object v7, v0

    goto :goto_b4

    :cond_79
    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v7

    if-eqz v7, :cond_84

    invoke-interface {v0}, Lgfn;->k()Ljava/util/Map;

    move-result-object v0

    goto :goto_85

    :cond_84
    const/4 v0, 0x0

    :goto_85
    iget-object v7, v5, Lydn;->s:Lcnk;

    invoke-virtual {v7, v0}, Lcnk;->a(Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_94
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_b4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lbnk;

    invoke-virtual {v8}, Lbnk;->a()Lfdn;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, v8, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {v8}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_94

    :cond_b1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_77

    :cond_b4
    :goto_b4
    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v10

    new-instance v11, Lr2n;

    const/4 v0, 0x2

    invoke-direct {v11, p0, v0}, Lr2n;-><init>(Ljava/lang/Object;B)V

    iget-object v12, p0, Lldn;->v:Lyug;

    iget-object v13, p0, Lldn;->w:Lgmk;

    iget-object v8, p0, Lldn;->t:Ltni;

    iget-object v9, p0, Lldn;->u:Lcom/opera/android/Lazy;

    invoke-direct/range {v1 .. v13}, Lndn;-><init>(Landroid/content/Context;Lndc;Lvs;Lydn;Ljava/util/List;Ljava/util/List;Ltni;Lcom/opera/android/Lazy;Litd;Lr2n;Lyug;Lgmk;)V

    iput-object v1, p0, Lldn;->x:Lndn;

    iget-object p0, p0, Lldn;->y:Lvs;

    iget-object p0, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_d8
    return-void
.end method

.method public final h0(Landroidx/fragment/app/w;)V
    .registers 2

    iget-object p0, p0, Lldn;->r:Lua7;

    invoke-virtual {p0}, Lua7;->D()V

    return-void
.end method

.method public final l0(Z)V
    .registers 4

    iget-object v0, p0, Lldn;->x:Lndn;

    if-eqz v0, :cond_14

    iget-object v1, v0, Lndn;->s:Landroid/view/MenuItem;

    if-eqz v1, :cond_14

    invoke-interface {v1}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v1

    if-eqz v1, :cond_14

    iget-object p0, v0, Lndn;->s:Landroid/view/MenuItem;

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    return-void

    :cond_14
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onDestroy()V
    .registers 4

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lldn;->x:Lndn;

    if-eqz v0, :cond_13

    iget-object v1, v0, Lndn;->c:Lydn;

    iget-object v2, v0, Lndn;->i:Lvc7;

    invoke-virtual {v1, v2}, Lydn;->A(Ltdn;)V

    iget-object v0, v0, Lndn;->g:Lgdn;

    invoke-virtual {v0}, Lha2;->onDestroy()V

    :cond_13
    const/4 v0, 0x0

    iput-object v0, p0, Lldn;->x:Lndn;

    iput-object v0, p0, Lldn;->y:Lvs;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lldn;->G0()V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 9

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a02a9

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    move-object v1, p1

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v0, 0x7f0a037b

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/AnimationEmptyListView;

    if-eqz v2, :cond_47

    const v0, 0x7f0a0384

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    if-eqz v2, :cond_47

    const v0, 0x7f0a08ae

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v3, :cond_47

    const v0, 0x7f0a0aad

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v4, :cond_47

    new-instance v0, Lvs;

    const/16 v5, 0x19

    invoke-direct/range {v0 .. v5}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lldn;->y:Lvs;

    invoke-virtual {p0, p2, v3}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    return-void

    :cond_47
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final z0()V
    .registers 2

    iget-object v0, p0, Lldn;->y:Lvs;

    iget-object v0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v0}, Lz4o;->q0(Landroid/view/View;)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    return-void
.end method
