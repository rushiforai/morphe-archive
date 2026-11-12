.class public final Ldm8;
.super Llj;
.source "SourceFile"

# interfaces
.implements Lkkm;
.implements Llkm;
.implements Lq9g;


# instance fields
.field public A:Lqmj;

.field public B:Lflb;

.field public C:Lflb;

.field public final r:Lgjm;

.field public final s:Lcom/opera/android/settings/SettingsManager;

.field public final t:Ls9g;

.field public final u:Lvo7;

.field public final v:Lig;

.field public final w:Lmvk;

.field public x:Ly83;

.field public y:Lcom/opera/android/undo/UndoBar;

.field public z:Lqmj;


# direct methods
.method public constructor <init>(Lgjm;Lcom/opera/android/settings/SettingsManager;Ls9g;Lvo7;)V
    .registers 7

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140731

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const v1, 0x7f10003a

    iput v1, v0, Litl;->b:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lig;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ldm8;->v:Lig;

    const v0, 0x7f140e9f

    invoke-static {v0}, Lnvk;->v(I)Lmvk;

    move-result-object v0

    iput-object v0, p0, Ldm8;->w:Lmvk;

    iput-object p3, p0, Ldm8;->t:Ls9g;

    iput-object p1, p0, Ldm8;->r:Lgjm;

    iput-object p2, p0, Ldm8;->s:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Ldm8;->u:Lvo7;

    return-void
.end method

.method public static K0(Ljava/util/AbstractCollection;)V
    .registers 5

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Ls9g;->h:Ls9g;

    const/4 v2, 0x0

    sget-object v3, Llag;->g:Llag;

    invoke-virtual {v1, v3, v0, v2}, Ls9g;->b(Llag;Ljava/lang/String;Z)V

    goto :goto_4

    :cond_19
    return-void
.end method


# virtual methods
.method public final A()V
    .registers 1

    iget-object p0, p0, Ldm8;->v:Lig;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final G0()Ljava/util/HashSet;
    .registers 8

    sget-object v0, Ls9g;->h:Ls9g;

    iget-object v0, v0, Ls9g;->c:Lvzk;

    sget-object v1, Lkag;->b:Lkag;

    invoke-virtual {v0, v1}, Lvzk;->E(Lkag;)Ljava/util/HashSet;

    move-result-object v0

    sget-object v2, Ls9g;->h:Ls9g;

    sget-object v3, Lkag;->d:Lkag;

    iget-object v2, v2, Ls9g;->c:Lvzk;

    invoke-virtual {v2, v3}, Lvzk;->E(Lkag;)Ljava/util/HashSet;

    move-result-object v2

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1d
    :goto_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_44

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v4, p0, Ldm8;->u:Lvo7;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lorg/chromium/url/GURL;

    invoke-direct {v5, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lvo7;->a(Lorg/chromium/url/GURL;Z)Luo7;

    move-result-object v4

    if-eqz v4, :cond_3d

    iget-object v4, v4, Luo7;->d:Lkag;

    goto :goto_3e

    :cond_3d
    const/4 v4, 0x0

    :goto_3e
    if-ne v4, v1, :cond_1d

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    :cond_44
    return-object v3
.end method

.method public final H0(Lqmj;Landroidx/recyclerview/widget/RecyclerView;)Lflb;
    .registers 7

    new-instance v0, Lflb;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ldg7;

    const/16 v3, 0xc

    invoke-direct {v2, p1, v3}, Ldg7;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lnvk;

    new-instance v3, Lcm8;

    invoke-direct {v3, p0, v2}, Lcm8;-><init>(Ldm8;Ldg7;)V

    invoke-direct {p1, v1, v3}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    invoke-direct {v0, p1}, Lflb;-><init>(Lblb;)V

    invoke-virtual {v0, p2}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-object v0
.end method

.method public final I0(Landroidx/recyclerview/widget/RecyclerView;Ljava/util/HashSet;)Lqmj;
    .registers 8

    new-instance v0, Lqmj;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Ldm8;->y:Lcom/opera/android/undo/UndoBar;

    new-instance v3, Ldg7;

    const/16 v4, 0xb

    invoke-direct {v3, p0, v4}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, p2, v2, v3}, Lqmj;-><init>(Landroid/content/Context;Ljava/util/Collection;Lcom/opera/android/undo/UndoBar;Lcom/opera/api/Callback;)V

    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-object v0
.end method

.method public final J0()V
    .registers 4

    iget-object v0, p0, Ldm8;->x:Ly83;

    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/SeparatorView;

    iget-object v1, p0, Ldm8;->z:Lqmj;

    invoke-virtual {v1}, Lqmj;->I()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1a

    iget-object v1, p0, Ldm8;->A:Lqmj;

    invoke-virtual {v1}, Lqmj;->I()Z

    move-result v1

    if-eqz v1, :cond_1a

    const/16 v1, 0x8

    goto :goto_1b

    :cond_1a
    move v1, v2

    :goto_1b
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ldm8;->z:Lqmj;

    invoke-virtual {v0}, Lqmj;->I()Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object v0, p0, Ldm8;->A:Lqmj;

    invoke-virtual {v0}, Lqmj;->I()Z

    move-result v0

    if-nez v0, :cond_2f

    :cond_2e
    const/4 v2, 0x1

    :cond_2f
    const v0, 0x7f0a02cb

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    if-eqz p0, :cond_3b

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_3b
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
    .registers 3

    invoke-static {p1}, Ldm8;->K0(Ljava/util/AbstractCollection;)V

    iget-object v0, p0, Ldm8;->z:Lqmj;

    invoke-virtual {v0, p1}, Lqmj;->H(Ljava/util/List;)V

    iget-object p0, p0, Ldm8;->A:Lqmj;

    invoke-virtual {p0, p1}, Lqmj;->H(Ljava/util/List;)V

    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 4

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lnn;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lnn;-><init>(B)V

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result p1

    if-eqz p1, :cond_18

    iget-object p0, p0, Ldm8;->v:Lig;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_18
    return-void
.end method

.method public final l0(Z)V
    .registers 4

    iget-object v0, p0, Ldm8;->y:Lcom/opera/android/undo/UndoBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 4

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Ldm8;->x:Ly83;

    iget-object v1, p0, Ldm8;->y:Lcom/opera/android/undo/UndoBar;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    iput-object v0, p0, Ldm8;->z:Lqmj;

    iget-object v1, p0, Ldm8;->B:Lflb;

    if-eqz v1, :cond_17

    invoke-virtual {v1, v0}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object v0, p0, Ldm8;->B:Lflb;

    :cond_17
    iput-object v0, p0, Ldm8;->A:Lqmj;

    iget-object v1, p0, Ldm8;->C:Lflb;

    if-eqz v1, :cond_22

    invoke-virtual {v1, v0}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object v0, p0, Ldm8;->C:Lflb;

    :cond_22
    iget-object v0, p0, Ldm8;->t:Ls9g;

    invoke-virtual {v0, p0}, Ls9g;->m(Lq9g;)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a02cb

    const/4 v1, 0x1

    if-ne p1, v0, :cond_1e

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    new-instance v0, Lsk;

    const/4 v2, 0x7

    invoke-direct {v0, p0, v2}, Lsk;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    const v2, 0x7f140e9e

    const v3, 0x7f140e9f

    invoke-static {p1, p0, v2, v3, v0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    :cond_1e
    return v1
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p1, Lam8;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lam8;-><init>(Ldm8;B)V

    new-instance v0, La83;

    invoke-direct {v0, p0, p1}, La83;-><init>(Ldm8;Ljava/lang/Runnable;)V

    iget-object p1, p0, Ldm8;->z:Lqmj;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    iget-object p1, p0, Ldm8;->x:Ly83;

    iget-object p1, p1, Ly83;->g:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v0, p0, Ldm8;->z:Lqmj;

    invoke-virtual {v0}, Lqmj;->I()Z

    move-result v0

    const/16 v1, 0x8

    if-eqz v0, :cond_25

    move v0, v1

    goto :goto_26

    :cond_25
    move v0, p2

    :goto_26
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Ldm8;->J0()V

    new-instance p1, Lam8;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lam8;-><init>(Ldm8;B)V

    new-instance v0, La83;

    invoke-direct {v0, p0, p1}, La83;-><init>(Ldm8;Ljava/lang/Runnable;)V

    iget-object p1, p0, Ldm8;->A:Lqmj;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    iget-object p1, p0, Ldm8;->x:Ly83;

    iget-object p1, p1, Ly83;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v0, p0, Ldm8;->A:Lqmj;

    invoke-virtual {v0}, Lqmj;->I()Z

    move-result v0

    if-eqz v0, :cond_4b

    move p2, v1

    :cond_4b
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Ldm8;->J0()V

    iget-object p1, p0, Ldm8;->t:Ls9g;

    invoke-virtual {p1, p0}, Ls9g;->a(Lq9g;)V

    return-void
.end method

.method public final t(Le5d;)V
    .registers 3

    iget-object v0, p0, Ldm8;->z:Lqmj;

    invoke-virtual {v0, p1}, Lqmj;->K(Le5d;)V

    iget-object p0, p0, Ldm8;->A:Lqmj;

    invoke-virtual {p0, p1}, Lqmj;->K(Le5d;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 14

    const v0, 0x7f0d013a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0100

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v4, :cond_cb

    const p2, 0x7f0a0751

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_cb

    const p2, 0x7f0a0752

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v6, :cond_cb

    const p2, 0x7f0a097d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v7, :cond_cb

    move-object v3, p1

    check-cast v3, Landroid/widget/LinearLayout;

    const p2, 0x7f0a0cee

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_cb

    const p2, 0x7f0a0cef

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v9, :cond_cb

    new-instance v2, Ly83;

    const/4 v10, 0x2

    invoke-direct/range {v2 .. v10}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    iput-object v2, p0, Ldm8;->x:Ly83;

    iget-object p1, p0, Ldm8;->s:Lcom/opera/android/settings/SettingsManager;

    const-string p2, "page_menu_show_open_in_external_app"

    invoke-virtual {p1, p2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {v4, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object p1, p0, Ldm8;->x:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lbm8;

    invoke-direct {p2, p0, v1}, Lbm8;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    new-instance v2, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v3

    iget-object v4, p0, Lltl;->n:Lqm9;

    const/4 v7, 0x1

    move-object v6, p0

    move-object v5, p0

    invoke-direct/range {v2 .. v7}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v2, v5, Ldm8;->y:Lcom/opera/android/undo/UndoBar;

    const p0, 0x7f120061

    invoke-virtual {v2, p0}, Lcom/opera/android/undo/UndoBar;->e(I)V

    iget-object p0, v5, Ldm8;->x:Ly83;

    iget-object p0, p0, Ly83;->h:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5}, Ldm8;->G0()Ljava/util/HashSet;

    move-result-object p1

    invoke-virtual {v5, p0, p1}, Ldm8;->I0(Landroidx/recyclerview/widget/RecyclerView;Ljava/util/HashSet;)Lqmj;

    move-result-object p0

    iput-object p0, v5, Ldm8;->z:Lqmj;

    iget-object p1, v5, Ldm8;->x:Ly83;

    iget-object p1, p1, Ly83;->h:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5, p0, p1}, Ldm8;->H0(Lqmj;Landroidx/recyclerview/widget/RecyclerView;)Lflb;

    move-result-object p0

    iput-object p0, v5, Ldm8;->B:Lflb;

    iget-object p0, v5, Ldm8;->x:Ly83;

    iget-object p0, p0, Ly83;->e:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    sget-object p1, Ls9g;->h:Ls9g;

    iget-object p1, p1, Ls9g;->c:Lvzk;

    sget-object p2, Lkag;->c:Lkag;

    invoke-virtual {p1, p2}, Lvzk;->E(Lkag;)Ljava/util/HashSet;

    move-result-object p1

    invoke-virtual {v5, p0, p1}, Ldm8;->I0(Landroidx/recyclerview/widget/RecyclerView;Ljava/util/HashSet;)Lqmj;

    move-result-object p0

    iput-object p0, v5, Ldm8;->A:Lqmj;

    iget-object p1, v5, Ldm8;->x:Ly83;

    iget-object p1, p1, Ly83;->e:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5, p0, p1}, Ldm8;->H0(Lqmj;Landroidx/recyclerview/widget/RecyclerView;)Lflb;

    move-result-object p0

    iput-object p0, v5, Ldm8;->C:Lflb;

    return-void

    :cond_cb
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
