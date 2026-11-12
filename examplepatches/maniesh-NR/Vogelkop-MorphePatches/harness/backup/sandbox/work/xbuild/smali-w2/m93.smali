.class public abstract Lm93;
.super Llj;
.source "SourceFile"

# interfaces
.implements Ljvk;
.implements Lkkm;
.implements Llkm;


# instance fields
.field public r:Lqmj;

.field public s:Lyz7;

.field public t:Lflb;

.field public u:Lcom/opera/android/undo/UndoBar;

.field public v:Landroid/view/MenuItem;

.field public final w:Lig;

.field public final x:Lmvk;

.field public final y:I

.field public final z:I


# direct methods
.method public constructor <init>(II)V
    .registers 6

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput-boolean v2, v1, Litl;->c:Z

    const v2, 0x7f1406dc

    invoke-virtual {v0, v2}, Lu7k;->s(I)V

    const v0, 0x7f10003b

    iput v0, v1, Litl;->b:I

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    new-instance v0, Lig;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lm93;->w:Lig;

    const v0, 0x7f140e9f

    invoke-static {v0}, Lnvk;->v(I)Lmvk;

    move-result-object v0

    iput-object v0, p0, Lm93;->x:Lmvk;

    iput p1, p0, Lm93;->y:I

    iput p2, p0, Lm93;->z:I

    return-void
.end method


# virtual methods
.method public final A0(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .registers 4

    invoke-super {p0, p1}, Lltl;->A0(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    new-instance v0, Lgf;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 13

    new-instance v0, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    iget-object v2, p0, Lltl;->n:Lqm9;

    const/4 v5, 0x1

    move-object v4, p0

    move-object v3, p0

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v0, v3, Lm93;->u:Lcom/opera/android/undo/UndoBar;

    const p0, 0x7f120061

    invoke-virtual {v0, p0}, Lcom/opera/android/undo/UndoBar;->e(I)V

    new-instance p0, Lqmj;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v3}, Lm93;->H0()Ljava/util/Collection;

    move-result-object v0

    iget-object v1, v3, Lm93;->u:Lcom/opera/android/undo/UndoBar;

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lqmj;-><init>(Landroid/content/Context;Ljava/util/Collection;Lcom/opera/android/undo/UndoBar;Lcom/opera/api/Callback;)V

    iput-object p0, v3, Lm93;->r:Lqmj;

    new-instance p1, La83;

    const/4 v0, 0x1

    invoke-direct {p1, v3, v0}, La83;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    new-instance p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v4, Lyz7;

    iget-object v5, v3, Lm93;->r:Lqmj;

    iget v9, v3, Lm93;->z:I

    const/4 v6, 0x2

    const v7, 0x7f140b46

    iget v8, v3, Lm93;->y:I

    invoke-direct/range {v4 .. v9}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;IIII)V

    iput-object v4, v3, Lm93;->s:Lyz7;

    iget-object p0, v4, Lyz7;->c:Lx93;

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p0, v3, Lm93;->s:Lyz7;

    invoke-virtual {p0}, Lyz7;->c()V

    new-instance p0, Lnvk;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, v3}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance p1, Lflb;

    invoke-direct {p1, p0}, Lflb;-><init>(Lblb;)V

    iput-object p1, v3, Lm93;->t:Lflb;

    invoke-virtual {p1, p2}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public abstract G0(Ljava/lang/String;)V
.end method

.method public abstract H0()Ljava/util/Collection;
.end method

.method public abstract I0()V
.end method

.method public abstract J0(Ljava/util/ArrayList;)V
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
    .registers 2

    invoke-virtual {p0, p1}, Lm93;->J0(Ljava/util/ArrayList;)V

    iget-object p0, p0, Lm93;->r:Lqmj;

    invoke-virtual {p0, p1}, Lqmj;->H(Ljava/util/List;)V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x1

    iget-object p0, p0, Lm93;->x:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x0

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 3

    check-cast p1, Lpmj;

    iget-object p1, p1, Lpmj;->c:Ljava/lang/String;

    iget-object p0, p0, Lm93;->r:Lqmj;

    invoke-virtual {p0, p1}, Lqmj;->J(Ljava/lang/String;)V

    return-void
.end method

.method public final l0(Z)V
    .registers 4

    iget-object v0, p0, Lm93;->v:Landroid/view/MenuItem;

    if-eqz v0, :cond_10

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object p0, p0, Lm93;->v:Landroid/view/MenuItem;

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    return-void

    :cond_10
    iget-object v0, p0, Lm93;->u:Lcom/opera/android/undo/UndoBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    iget-object p0, p0, Lm93;->s:Lyz7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p0, p1, Lxz7;

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public onDestroyView()V
    .registers 3

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Lm93;->u:Lcom/opera/android/undo/UndoBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lm93;->r:Lqmj;

    iput-object v0, p0, Lm93;->s:Lyz7;

    iget-object v1, p0, Lm93;->t:Lflb;

    if-eqz v1, :cond_17

    invoke-virtual {v1, v0}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object v0, p0, Lm93;->t:Lflb;

    :cond_17
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

    const/4 v2, 0x3

    invoke-direct {v0, p0, v2}, Lsk;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    const v2, 0x7f1400a2

    const v3, 0x7f140e9f

    invoke-static {p1, p0, v2, v3, v0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    :cond_1e
    return v1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p1, 0x7f0a0932

    invoke-virtual {p0, p1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p1

    iget-object p2, p0, Lm93;->r:Lqmj;

    invoke-virtual {p2}, Lqmj;->I()Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const p1, 0x7f0a02cb

    invoke-virtual {p0, p1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p1

    iget-object p0, p0, Lm93;->r:Lqmj;

    invoke-virtual {p0}, Lqmj;->I()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final t(Le5d;)V
    .registers 2

    iget-object p0, p0, Lm93;->r:Lqmj;

    invoke-virtual {p0, p1}, Lqmj;->K(Le5d;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 4

    const v0, 0x7f0a0932

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lm93;->v:Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/SearchView;

    const v0, 0x7f140082

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    new-instance v0, Lpjn;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lpjn;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    return-void
.end method
