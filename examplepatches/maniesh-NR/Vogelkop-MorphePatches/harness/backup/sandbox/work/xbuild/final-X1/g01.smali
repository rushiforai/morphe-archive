.class public final Lg01;
.super Llj;
.source "SourceFile"

# interfaces
.implements Ljvk;
.implements Lkkm;
.implements Llkm;
.implements Lq9g;


# instance fields
.field public final r:Ls9g;

.field public final s:Lgjm;

.field public t:Landroid/view/MenuItem;

.field public u:Landroidx/appcompat/widget/SearchView;

.field public final v:Lcom/opera/android/settings/SettingsManager;

.field public w:Lqmj;

.field public x:Lcom/opera/android/undo/UndoBar;

.field public final y:Ll45;

.field public final z:Lmvk;


# direct methods
.method public constructor <init>(Ls9g;Lgjm;Lcom/opera/android/settings/SettingsManager;)V
    .registers 8

    const v0, 0x7f14017d

    const v1, 0x7f10003b

    invoke-direct {p0, v0, v1}, Llj;-><init>(II)V

    new-instance v0, Ll45;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Ll45;->c:Ljava/lang/Object;

    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Ls9g;->h:Ls9g;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ls9g;->i(Z)Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Ll45;->a:Ljava/lang/Object;

    iput-object v0, p0, Lg01;->y:Ll45;

    const v0, 0x7f14056b

    invoke-static {v0}, Lnvk;->v(I)Lmvk;

    move-result-object v0

    iput-object v0, p0, Lg01;->z:Lmvk;

    iput-object p1, p0, Lg01;->r:Ls9g;

    iput-object p2, p0, Lg01;->s:Lgjm;

    iput-object p3, p0, Lg01;->v:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 1

    invoke-virtual {p0}, Lg01;->G0()V

    return-void
.end method

.method public final G0()V
    .registers 4

    iget-object p0, p0, Lg01;->y:Ll45;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Ls9g;->h:Ls9g;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ls9g;->i(Z)Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Ll45;->a:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Ll45;->b:Ljava/lang/Object;

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Lg01;

    iget-object v0, v0, Lg01;->w:Lqmj;

    invoke-virtual {p0}, Ll45;->z()Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v0, p0}, Lqmj;->L(Ljava/util/Collection;)V

    return-void
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 5

    new-instance p0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Lguh;

    const/4 v2, -0x1

    invoke-direct {v1, v0, v2}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_23
    new-instance p1, Le5d;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v1, 0x2

    invoke-direct {p1, p0, v0, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final O(Ll46;)V
    .registers 2

    return-void
.end method

.method public final R(Ljava/util/ArrayList;)V
    .registers 10

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {v0}, LJ/N;->MNitnPWj(Ljava/lang/Object;)D

    move-result-wide v1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :goto_10
    if-ge v5, v3, :cond_32

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/String;

    sget-object v7, Ls9g;->h:Ls9g;

    invoke-virtual {v7, v6}, Ls9g;->c(Ljava/lang/String;)V

    const/4 v7, 0x1

    invoke-static {v6, v7}, Llx3;->a(Ljava/lang/String;Z)V

    const/4 v7, 0x3

    invoke-static {v4, v7, v6, v4}, Lhj;->b(IILjava/lang/String;Z)V

    invoke-static {v6}, Lcom/opera/android/browser/BrowserUtils;->getHostString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7, v1, v2}, LJ/N;->MvtzH5Ni(Ljava/lang/Object;Ljava/lang/Object;D)V

    invoke-static {v6}, LJ/N;->M6qCWyJt(Ljava/lang/Object;)V

    goto :goto_10

    :cond_32
    iget-object v0, p0, Lg01;->w:Lqmj;

    invoke-virtual {v0, p1}, Lqmj;->H(Ljava/util/List;)V

    iget-object p0, p0, Lg01;->v:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "text_wrap"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 2

    invoke-virtual {p0}, Lg01;->G0()V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x1

    iget-object p0, p0, Lg01;->z:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x0

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 3

    check-cast p1, Lpmj;

    iget-object p1, p1, Lpmj;->c:Ljava/lang/String;

    iget-object p0, p0, Lg01;->w:Lqmj;

    invoke-virtual {p0, p1}, Lqmj;->J(Ljava/lang/String;)V

    return-void
.end method

.method public final l0(Z)V
    .registers 4

    iget-object v0, p0, Lg01;->t:Landroid/view/MenuItem;

    if-eqz v0, :cond_10

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object p0, p0, Lg01;->t:Landroid/view/MenuItem;

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    return-void

    :cond_10
    iget-object v0, p0, Lg01;->x:Lcom/opera/android/undo/UndoBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final onDestroyView()V
    .registers 2

    iget-object v0, p0, Lg01;->r:Ls9g;

    invoke-virtual {v0, p0}, Ls9g;->m(Lq9g;)V

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a02cb

    const/4 v1, 0x1

    if-ne p1, v0, :cond_20

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    new-instance v0, Lsk;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Lsk;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f141129

    const v2, 0x7f141128

    const v3, 0x7f140567

    invoke-static {p1, p0, v2, v3, v0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    :cond_20
    return v1
.end method

.method public final t(Le5d;)V
    .registers 2

    iget-object p0, p0, Lg01;->w:Lqmj;

    invoke-virtual {p0, p1}, Lqmj;->K(Le5d;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 9

    new-instance v0, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    iget-object v2, p0, Lltl;->n:Lqm9;

    const/4 v5, 0x1

    move-object v4, p0

    move-object v3, p0

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v0, v3, Lg01;->x:Lcom/opera/android/undo/UndoBar;

    const p0, 0x7f120061

    invoke-virtual {v0, p0}, Lcom/opera/android/undo/UndoBar;->e(I)V

    new-instance p0, Lqmj;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, v3, Lg01;->y:Ll45;

    invoke-virtual {v1}, Ll45;->z()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, v3, Lg01;->x:Lcom/opera/android/undo/UndoBar;

    new-instance v4, Lab;

    const/16 v5, 0x8

    invoke-direct {v4, v3, v5}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0, v0, v1, v2, v4}, Lqmj;-><init>(Landroid/content/Context;Ljava/util/Collection;Lcom/opera/android/undo/UndoBar;Lcom/opera/api/Callback;)V

    iput-object p0, v3, Lg01;->w:Lqmj;

    const p0, 0x7f0d0056

    invoke-virtual {p1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p0, 0x7f0a00e3

    invoke-virtual {p2, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    const p1, 0x7f0a00e4

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p2, v3, Lg01;->w:Lqmj;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p2, v3, Lg01;->w:Lqmj;

    new-instance v0, Lf01;

    invoke-direct {v0, v3, p0}, Lf01;-><init>(Lg01;Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;)V

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    iget-object p2, v3, Lg01;->w:Lqmj;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lbi;

    const/16 v1, 0x11

    invoke-direct {v0, p2, v1}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->a(Lzph;)V

    new-instance p2, Lnvk;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0, v3}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance v0, Lflb;

    invoke-direct {v0, p2}, Lflb;-><init>(Lblb;)V

    invoke-virtual {v0, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance p1, Le01;

    const/4 p2, 0x0

    invoke-direct {p1, v0, p2}, Le01;-><init>(Lflb;B)V

    iput-object p1, p0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->b:Ljava/lang/Runnable;

    const p0, 0x7f0a0932

    invoke-virtual {v3, p0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    iget-object p1, v3, Lg01;->w:Lqmj;

    invoke-virtual {p1}, Lqmj;->I()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const p0, 0x7f0a02cb

    invoke-virtual {v3, p0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    iget-object p1, v3, Lg01;->w:Lqmj;

    invoke-virtual {p1}, Lqmj;->I()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object p0, v3, Lg01;->r:Ls9g;

    invoke-virtual {p0, v3}, Ls9g;->a(Lq9g;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 4

    const v0, 0x7f0a0932

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lg01;->t:Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/SearchView;

    iput-object p1, p0, Lg01;->u:Landroidx/appcompat/widget/SearchView;

    const v0, 0x7f140082

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lg01;->u:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lpjn;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lpjn;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    return-void
.end method
